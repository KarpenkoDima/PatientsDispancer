using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Dispancer.Configuration;
using Dispancer.Services;

var builder = WebApplication.CreateBuilder(args);

// --- ������ ����� ��� ���������� ---
// 1. ������ ������������ �� appsettings.json
var jwtSettings = builder.Configuration.GetSection("Jwt").Get<JwtSettings>();
var connectionString = builder.Configuration.GetSection("ConnectionStrings").Get<ConnectionStrings>();

// 2. ������������ ���� ������ ������������ � DI-����������
// ������ �� ����� ����������� �� � ����� ������� ��� �����������
builder.Services.AddSingleton(jwtSettings);
builder.Services.AddSingleton(connectionString);
builder.Services.AddScoped<TokenService>();

// 3. ����������� �������������� � �������������� JWT
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
// --- ����� ����� ��� ���������� ---

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

// ������� login.html ��� �������� �� ���������
DefaultFilesOptions defaultFilesOptions = new DefaultFilesOptions();
defaultFilesOptions.DefaultFileNames.Clear();
defaultFilesOptions.DefaultFileNames.Add("login.html");
app.UseDefaultFiles(defaultFilesOptions);

app.UseStaticFiles(); // � ��� ����������� �������� ��

// --- � ��� ---
app.UseAuthentication();
app.UseAuthorization();
// --- ����� ---

app.MapControllers();

app.Run();
