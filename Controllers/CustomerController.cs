using Dapper;
using Dispancer.Configuration;
using Dispancer.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace Dispancer.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize] // <-- это важно - только авторизированные пользователи могут сюда попасть
public class CustomerController : ControllerBase
{
    // -- 4.2. ДОБАВЛЯЕМ СЕРВИС ДЛЯ ПОЛУЧЕНИЯ УЧЕТНЫХ ДАННЫХ ДЛЯ СТРОК --
     private readonly UserConnectionService _connectionService;

    public CustomerController(UserConnectionService connectionService)
    {
        _connectionService = connectionService;// ТУТ ДАННЫЕ ДЛЯ ПОДКЛЮЧЕНИЯ
    }

    [HttpGet]
    public async Task<IActionResult> GetCustomers()
    {
        try
        {
            // используем строку подключении из appsettings.json
            using (var connection = _connectionService.CreateConnection())
            {
                // просто получаем всех пациентов из представления vGetCustomers
                var customers = await connection.QueryAsync("SELECT * FROM dbo.vGetCustomers");
                return Ok(customers);
            }
        }
        catch (SqlException ex)
        {
            // В продакшен приложении здусь будет логирование ошибок
            return StatusCode(500, new { message = "An internal server error occurred." });
        }
        catch (InvalidOperationException ex) // для ошибки если допустим отсутствует пароль или логин
        {
            return Unauthorized(new { message = ex.Message });
        }
    }
}
