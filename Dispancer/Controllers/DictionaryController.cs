using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Dispancer.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize] // <-- это важно - только авторизированные пользователи могут сюда попасть
public class DictionaryController : Controller
{
   /* private readonly UserConnectionService _connectionService;
    private readonly ILogger<DictionaryController> _logger;
    public DictionaryController(UserConnectionService connectionService, ILogger<DictionaryController> logger)
    {
        _connectionService = connectionService;// ТУТ ДАННЫЕ ДЛЯ ПОДКЛЮЧЕНИЯ
        _logger = logger;
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
            _logger.LogError($"Ошибка при полцучении списка учатков: {ex.Message}");
            // В продакшен приложении здусь будет логирование ошибок
            return StatusCode(500, new { message = "An internal server error occurred." });
        }
        catch (InvalidOperationException ex) // для ошибки если допустим отсутствует пароль или логин
        {
            _logger.LogError(ex, $"Ошибка при получении списка участков");
            return Unauthorized(new { message = ex.Message });
        }
    }*/
}
