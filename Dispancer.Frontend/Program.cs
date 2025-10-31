using Dispancer.Frontend.Data;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;
using System.Diagnostics.Eventing.Reader;

var builder = WebApplication.CreateBuilder(args);

// Получаем базовый адрес API из appsettings.json
var apiBaseAddress = builder.Configuration["ApiBaseAddress"];

// Регистрация HttpClient для всего приложения
builder.Services.AddHttpClient("ApiClient", client =>
{
    if (string.IsNullOrEmpty(apiBaseAddress))
    {
        // Если адрес не найден в концигурации, можно использовать значения по умолчанию
        // ПОРТ БЕРЕМ ИЗ API-ПРОЕКТА
        client.BaseAddress = new Uri("https://localhost:7057");
    }
    else
    {
        client.BaseAddress = new Uri($"{apiBaseAddress}");
    }
});

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();
builder.Services.AddSingleton<WeatherForecastService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseRouting();

app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

app.Run();
