using Dispancer.Core.Interfaces;
using Dispancer.Service;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Caching.Memory;

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
    private readonly ITokenService _tokenService;
    // -- 4.3. Добавим кэш для сохаррения логина и пароля
    private readonly IMemoryCache _memoryCache;

    private readonly AuthService _authService;

    // Внедрение зависимости через конструктор
    // Добавляем в конструкторы сервисы
    public AuthController(AuthService authService, ITokenService tokenService, IMemoryCache memoryCache)
    {        
        _tokenService = tokenService;
        _memoryCache = memoryCache;
        _authService = authService;
    }

    [HttpPost("login")]
    public async Task<IActionResult> Login([FromBody] LoginRequest loginRequest)
    {
        try
        {
            var (token, displayRole, sensitivityLevel, role) = await _authService.Login(loginRequest.Username, loginRequest.Password);


            var responseData = new
            {
                token = token,
                userName = loginRequest.Username,
                role = displayRole,
                sensitivityLevel = role
            };
            return Ok(responseData);

        }
        catch (UnauthorizedAccessException ex)
        {
            // Обработка случая, когда AuthenticateAndGenerateTokenAsync бросает исключение из-за отсутствия ролей
            return Unauthorized(new { message = ex.Message });
        }
        catch (SqlException ex)
        {
            // Логируем возможные ошибки
            // logger.LogError(ex, "An error occured during login");
            return StatusCode(500, new { mesage = $"An internal server error occurred. {ex.Message}" });
        }
    }
}
