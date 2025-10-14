using Dapper;
using Dispancer.Configuration;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace Dispancer.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize] // <-- єто важно - только авторизированные пользователи могут сюда попасть
public class CustomerController : ControllerBase
{
     private readonly ConnectionStrings _connectionStrings;

    public CustomerController(ConnectionStrings connectionStrings)
    {
        _connectionStrings = connectionStrings;
    }

    [HttpGet]
    public async Task<IActionResult> GetCustomers()
    {
        try
        {
            // используем строку подключении из appsettings.json
            using (var connection = new SqlConnection(_connectionStrings.DefaultConnection))
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
    }
}
