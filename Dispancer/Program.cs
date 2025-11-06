using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Dispancer.Services;
using Microsoft.OpenApi.Models;
using Serilog;
using Microsoft.Extensions.Options;
using Dispancer.Core.Configuration;
using Dispancer.Core.Interfaces;
using Dispancer.SqlData;

var builder = WebApplication.CreateBuilder(args);

// 0. настраиваем Serilog ПЕРЕД созданием приложения
// Это важно - логи будут работать с самого начала запуска приложения
Log.Logger = new LoggerConfiguration()
    // Минимальный уровень логирования - все записи ниже этого уровня игнорируются
    // Information означает, что Debug записи не будут выводиться
    .MinimumLevel.Information()
    // Для определённых пространств имён можем задать свой уровень
    // Microsoft.* это встроенные классы ASP.NET Core - их логи обычно слишком подробные
    .MinimumLevel.Override("Microsoft", Serilog.Events.LogEventLevel.Warning)
    .MinimumLevel.Override("System", Serilog.Events.LogEventLevel.Warning)
    // Обогащаем логи дополнительной информацией
    .Enrich.FromLogContext() // Добавляет контекстные свойства
    // Пишем логи в консоль - для разработки и Docker контейнеров
    .WriteTo.Console(
    outputTemplate: "[{Timestamp:HH:mm:ss} {Level:u3} {SourceContext}: {Message:lj}{NewLine}{Exception}]")
    // Пишем логи в файл
    .WriteTo.File(
      path: "logs/medapp-.log",  // Путь к файлу, дефис означает что будет добавлена дата
        rollingInterval: RollingInterval.Day,  // Новый файл каждый день
        retainedFileCountLimit: 30,  // Храним логи за последние 30 дней
                                     // outputTemplate задаёт формат записи в файле
        outputTemplate: "{Timestamp:yyyy-MM-dd HH:mm:ss.fff} [{Level:u3}] [{SourceContext}] {Message:lj}{NewLine}{Exception}")
    // Создаём логгер
    .CreateLogger();

builder.Host.UseSerilog();

// Логируем старт приложения - это поможет отследить рестарт
Log.Information("========= Зауск медицинского приложения ==========");

// 1. Читаем конфигурацию из appsettings.json и готовим для инъекции
builder.Services.Configure<JwtSettings>(
    builder.Configuration.GetSection("Jwt"));

// 2. Регистрируем наши классы конфигурации в DI-контейнере
// Теперь мы можем запрашивать их в любом сервисе или контроллере
builder.Services.AddScoped<ITokenService, TokenService>();

// DI строки подключения
builder.Services.Configure<ConnectionStrings>(
    builder.Configuration.GetSection("ConnectionStrings"));
builder.Services.AddSingleton(resolver =>
resolver.GetRequiredService<IOptions<ConnectionStrings>>().Value);



// 4.1.  Регистрирую сервисы хранения строк подключения
builder.Services.AddHttpContextAccessor(); // позволяет получать доступ к HttpContext из сервисов
builder.Services.AddMemoryCache(); // Добавляем серврный кэш в память
builder.Services.AddScoped<Dispancer.Core.Inrterfaces.IUserConnectionService, UserConnectionService>();
builder.Services.AddScoped<ISqlData, SqlDapper>();
builder.Services.AddTransient<Dispancer.Service.AuthService>();
builder.Services.AddScoped<Dispancer.Service.CustomerService>();

// 3. Настраиваем аутентификацию с использованием JWT
builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer(options =>
{
    var jwtSettings = builder.Configuration.GetSection("Jwt").Get<JwtSettings>();
    options.TokenValidationParameters = new TokenValidationParameters
    {

        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = jwtSettings.Issuer, // <-- ДОБАВЬТЕ ЭТУ СТРОКУ
        ValidAudience = jwtSettings.Audience,
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtSettings.Key))
    };
});
// --- КОНЕЦ БЛОКА ДЛЯ ДОБАВЛЕНИЯ ---

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen((opt) => // Для работы с Jwt Token в Swagger
{
    OpenApiSecurityScheme openApiSecurityScheme = new OpenApiSecurityScheme();
    openApiSecurityScheme.Scheme = JwtBearerDefaults.AuthenticationScheme;
    openApiSecurityScheme.Type = SecuritySchemeType.Http;
    openApiSecurityScheme.BearerFormat = "Jwt";
    opt.AddSecurityDefinition("MyJwt", openApiSecurityScheme);

    // применим Seqyrity Requirement
    opt.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            // Ссылаемся на схему которую мі поерделили выше
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = "MyJwt" // имя должно быть тоже самое как в AddSecurityDefinition
                }
            },
        new List<string>()
        }
    });
});


builder.Services.AddControllers();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

// Добавим login.html как страницу по умолчанию
DefaultFilesOptions defaultFilesOptions = new DefaultFilesOptions();
defaultFilesOptions.DefaultFileNames.Clear();
defaultFilesOptions.DefaultFileNames.Add("login.html");
app.UseDefaultFiles(defaultFilesOptions);

app.UseStaticFiles(); // и вкл возможность отдавать их

// --- И ЭТО ---
app.UseAuthentication();
app.UseAuthorization();
// --- КОНЕЦ ---

app.MapControllers();

app.Run();
