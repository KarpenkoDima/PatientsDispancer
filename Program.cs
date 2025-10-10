using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Dispancer.Configuration;
using Dispancer.Services;

var builder = WebApplication.CreateBuilder(args);

// --- НАЧАЛО БЛОКА ДЛЯ ДОБАВЛЕНИЯ ---
// 1. Читаем конфигурацию из appsettings.json
var jwtSettings = builder.Configuration.GetSection("Jwt").Get<JwtSettings>();
var connectionString = builder.Configuration.GetSection("ConnectionStrings").Get<ConnectionStrings>();

// 2. Регистрируем наши классы конфигурации в DI-контейнере
// Теперь мы можем запрашивать их в любом сервисе или контроллере
builder.Services.AddSingleton(jwtSettings);
builder.Services.AddSingleton(connectionString);
builder.Services.AddScoped<TokenService>();

// 3. Настраиваем аутентификацию с использованием JWT
builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer(options =>
{
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidAudience = jwtSettings.Audience,
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtSettings.Key))
    };
});
// --- КОНЕЦ БЛОКА ДЛЯ ДОБАВЛЕНИЯ ---

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

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
