using Dapper;
using Dispancer.Configuration;
using Dispancer.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.ComponentModel;

namespace Dispancer.Controllers;

// Модель для данных, который придут от клиента (из формы входа)
public class LoginRequest
{
    public string Username { get; set; }
    public string Password { get; set; }
}

[ApiController]
[Route("api/[controller]")]
public class AuthController : Controller
{
    private readonly ConnectionStrings _connectionStrings;
    private readonly TokenService _tokenService;

    // Внедрение зависимости через конструктор
    public AuthController(ConnectionStrings connectionStrings, TokenService tokenService)
    {
        _connectionStrings = connectionStrings; 
        _tokenService = tokenService;
    }

    [HttpPost("login")]
    public async Task<IActionResult> Login([FromBody] LoginRequest loginRequest)
    {
        // 1. Создаем строку подключения для конкретного пользователя
        var userConnectionString = new SqlConnectionStringBuilder(_connectionStrings.DefaultConnection)
        {
            UserID = loginRequest.Username,
            Password = loginRequest.Password
        }.ConnectionString;

        // 2. Пытаемся подключиться к БД с учетными данными пользователя
        try
        {
            using (var connection = new SqlConnection(userConnectionString))
            {
                await connection.OpenAsync(); // Если Логин/Пароль не верны то будет исключение тут
                                              // 
                                              // 3. Если подключение успешно, получаем роли пользователя
                var roles = await connection.QueryAsync<string>(
                    "dbo.uspGetRoleForUser",
                    //new { UserName = loginRequest.Username },  <-- убераем она нам не надо
                    commandType: System.Data.CommandType.StoredProcedure);

                if(false == roles.Any())
                {
                    return Unauthorized(new { message = "User has no roles assigned" });
                }

                //  Определяем "главную" роль для отображения в БД
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
                    var token = _tokenService.GenerateToken(loginRequest.Username, roles);

                var responseData = new
                {
                    token = token,
                    userName = loginRequest.Username,
                    role = displayRole,
                    sensitivityLevel = role // Берем "старшую" роль
                };
                return Ok(responseData);
            }
        }
        catch (SqlException ex)
        {
            // Логируем другие возможные ошибки
            // logger.LogError(ex, "An error occured during login");
            
            return StatusCode(500, new { mesage = $"An internal server error occurred. {ex.Message}" });
        }
    }
}
