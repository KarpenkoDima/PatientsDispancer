using Dispancer.Frontend.Components;

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
builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();
app.UseAntiforgery();

app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode();

app.Run();
