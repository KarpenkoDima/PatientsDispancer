using Dispancer.Core.Configuration;
using Dispancer.Core.Inrterfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.Data.SqlClient;
using System.Security.Claims;
using Microsoft.Extensions.Caching.Memory;

namespace Dispancer.Services;

/// <summary>
/// -- ШАГ 4. НАЧАЛО. СЕРВИС ДЛЯ СОХРАНЕНИЯ ЛОГИНА И ПАРОЛЯ ДЛЯ СТРОКИ ПОДКЛЮЧЕНИЯ --
/// Сервис для создания персонализированных к базе данных для текущего пользователя
/// </summary>
public class UserConnectionService : IUserConnectionService
{
    private readonly ConnectionStrings _connectionStrings;
    private readonly IMemoryCache _cache;
    private readonly IHttpContextAccessor _httpContextAccessor;

    public UserConnectionService(
        ConnectionStrings connectionStrings,
        IMemoryCache cache,
        IHttpContextAccessor httpContextAccessor
        )
    {
        _connectionStrings = connectionStrings;
        _cache = cache;
        _httpContextAccessor = httpContextAccessor;
    }

    public SqlConnection CreateConnection()
    {
        // 1. Получаем имя пользователя из утверждений JWT-токенов
        var userName = _httpContextAccessor.HttpContext?.User?.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        if (string.IsNullOrEmpty(userName))
        {
            throw new InvalidOperationException("Не удалось определить пользователя из токена");
        }

        // 2. Пытаемся получить пароль из серверного кэша
        if (false == _cache.TryGetValue(userName, out string userPassword))
        {
            throw new InvalidOperationException($"For {userName} password does not exist. Repeat again enter");
        }
        // 3. Собираем персонализированную строку подлючения
        var userConnectionString = new SqlConnectionStringBuilder(_connectionStrings.DefaultConnection)
        {
            UserID = userName,
            Password = userPassword
        }.ConnectionString;

        // 4. Создаем и возвращаем подключение
        return new SqlConnection(userConnectionString);
    }
}

