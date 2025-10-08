using Microsoft.AspNetCore.Mvc;

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
    [HttpPost("login")]
    public IActionResult Login([FromBody] LoginRequest loginRequest)
    {
        // -- ВРЕМЕННАЯ ЗАГЛУШКА --
        // Пока, что мы не будем проверять пароль в БД
        // Просто проверим, что логин один из ожидаеммых
        if (loginRequest.Username == "Admin" ||
            loginRequest.Username == "Registrator" || 
            loginRequest.Username == "Operator")
        {
            // В случае успеха возвращаем "ненастоящий" токен
            var fakeToken = $"fake-jwt-token-for{loginRequest.Username}";
            return Ok(new {Toke=fakeToken});
        }

        // В случае неудачи возвращаем ошибку
        return Unauthorized( new {Message ="Invalid credentials"});
    }
}
