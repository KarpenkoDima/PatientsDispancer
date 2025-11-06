using Dispancer.Core.Interfaces;
using Dispancer.SqlData;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Caching.Memory;

namespace Dispancer.Service;

public class AuthService
{
    private readonly ISqlData _sqlData;
    private readonly ITokenService _tokenService;
    private readonly IMemoryCache _memoryCache;
    public AuthService(ISqlData sqlData, ITokenService tokenService, IMemoryCache memoryCache)
    {
        _sqlData = sqlData;
        _tokenService = tokenService;
        _memoryCache = memoryCache;
    }
    public async Task<(string Token, string DisplayRole, string SensitivityLevel, string role)> Login(string username, string password)
    {
        // 1. Аутентификация и получение ролей
        try
        {
            var roles = await GetRolesAsync(
                username,
                password);


            if (false == roles.Any())
            {
                throw new UnauthorizedAccessException("User has no roles assigned");
            }
          
            // 2. Кешируем
            var cacheEntryOptions = new MemoryCacheEntryOptions()
                .SetSlidingExpiration(TimeSpan.FromHours(1));
            _memoryCache.Set(username, password, cacheEntryOptions);            

            // 3. Определяем "главную" роль для отображения в БД
            string displayRole = "Регистратор";
            string role = "";
            if (roles.Contains("Sensitive_high"))
            {
                displayRole = "Администратор";
                role = "Sensitive_high";
            }
            else if (roles.Contains("Sensitive_medium"))
            {
                displayRole = "Оператор";
                role = "Sensitive_medium";
            }
            else if (roles.Contains("Sensitive_low"))
            {
                role = "Sensitive_low";
            }

            // 4. Генерируем JWT
            var token = _tokenService.GenerateToken(username, roles);

            return (
                token,
                username,
                displayRole,
                role // Берем "старшую" роль
            );
        }
        catch (SqlException ex)
        {
            throw ex;
        }
    }

    private async Task<IEnumerable<string>> GetRolesAsync(string username, string password)
    {
        // 1. Пытаемся подключиться к БД с учетными данными пользователя
        try
        {
            var roles = await _sqlData.LoginAsync(
                username,
                password,
                "dbo.uspGetRoleForUser",
                System.Data.CommandType.StoredProcedure);

            return roles;
        }
        catch (SqlException ex)
        {
            throw ex;
        }
    }
}
