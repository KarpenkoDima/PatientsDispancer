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
             string userRole = "";
             string sensitivityLevel = "";

        if (loginRequest.Username == "Admin")
        {
            userRole = "Администратор";
            sensitivityLevel = "Sensitive_High";
        }
        else if (loginRequest.Username == "Operator")
        {
            userRole = "Оператор";
            sensitivityLevel = "Sensitive_Middle";
        }
        else if (loginRequest.Username == "Registrator")
        {
            userRole = "Регистратор";
            sensitivityLevel = "Sensitive_Low";
        }
        
        if (false == string.IsNullOrEmpty(userRole))
        {

        
            // В случае успеха возвращаем "ненастоящий" токен
            var fakeToken = $"fake-jwt-token-for-{loginRequest.Username}";
            var response = new
            {
                token = fakeToken,
                userName = loginRequest.Username,
                role = userRole,
                sensitivityLevel = sensitivityLevel
            };
            return Ok(response);
        }

        // В случае неудачи возвращаем ошибку
        return Unauthorized( new {message ="Invalid credentials"});
    }
}
