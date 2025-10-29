using Dapper;
using Dispancer.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace Dispancer.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize] // <-- это важно - только авторизированные пользователи могут сюда попасть
public class DictionaryController : Controller
{
    private readonly UserConnectionService _connectionService;

    public DictionaryController(UserConnectionService connectionService)
    {
        _connectionService = connectionService;// ТУТ ДАННЫЕ ДЛЯ ПОДКЛЮЧЕНИЯ
    }

    [HttpGet]
    [Route("lands")]
    [Authorize(Roles ="Sensitive_low,Sensitive_high,Sensitive_medium")]
    public async Task<IActionResult> GetLangs()
    {
        try
        {
            // используем строку подключении из appsettings.json
            using (var connection = _connectionService.CreateConnection())
            {
                // просто получаем всех пациентов из представления vGetCustomers
                var lands = await connection.QueryAsync("SELECT * FROM dbo.vGetLand");
                return Ok(lands);
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
