using Dapper;
using Dispancer.Configuration;
using Dispancer.Models;
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
    
    // НОВЫЕ МЕТОДЫ
    // GET: api/customer/5 получаем одного пациента по LastName
    [HttpGet("by-lastname/{lastName}")]
    public async Task<IActionResult> GetCustomerByLastName(string lastName)
    {
        try
        {
            using (var connection = _connectionService.CreateConnection())
            {
                var customer = await connection.QuerySingleOrDefaultAsync(
                    "dbo.uspGetCustomerByLastName",
                    new { LastName = lastName },
                    commandType: System.Data.CommandType.StoredProcedure);

                if (customer == null)
                {
                    return NotFound(new { message = $"Пациент с фамилией {lastName} не найден" });
                }
                return Ok(customer);
            }
        }
        catch (InvalidOperationException ex)
        {
            return Unauthorized(new
            {
                message = ex.Message
            });
        }
    }
    
    [HttpGet("{id}")]
    public async Task<IActionResult> GetCustomerById(int id)
    {
        try
        {
            using (var connection = _connectionService.CreateConnection())
            {
                var customer = await connection.QuerySingleOrDefaultAsync(
                    "dbo.uspGetCustomerByID",
                    new { CustomerID = id },
                    commandType: System.Data.CommandType.StoredProcedure);

                if (customer == null)
                {
                    return NotFound(new { message = $"Пациент {id} не найден" });
                }
                return Ok(customer);
            }
        }
        catch (InvalidOperationException ex)
        {
            return Unauthorized(new { message =  ex.Message  });
        }
    }
    
    [HttpPost]
    [Authorize(Roles = "Sensitive_medium,Sensitive_high")] // Только Оператор и Админ
    public async Task<IActionResult> CreateCustomer([FromBody] Customer customer)
    {
        // Добавляем проверку валидности моделей
        if (false == ModelState.IsValid)
        {
            return BadRequest(ModelState);
        }

        using (var connection = _connectionService.CreateConnection())
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MedCard", customer.MedCard);
            parameters.Add("@CodeCustomer", customer.CodeCustomer);
            parameters.Add("@LastName", customer.LastName);
            parameters.Add("@FirstName", customer.FirstName);
            parameters.Add("@MiddleName", customer.MiddleName);
            parameters.Add("@Birthday", customer.Birthday);
            parameters.Add("@Arch", customer.Arch);
            // ... добавить другие поля

            var newId = await connection.ExecuteScalarAsync<int>(
                "dbo.uspSaveCustomer",
                parameters,
                commandType: System.Data.CommandType.StoredProcedure);

            customer.CustomerID = newId;
            return CreatedAtAction(nameof(CreateCustomer), new { id = newId }, customer);
        }
    }

    [HttpPut("{id}")]
    [Authorize(Roles = "Sensitive_medium,Sensitive_high")] // Только Оператор и Админ
    public async Task<IActionResult> UpdateCustomer(int id, [FromBody] Customer customer)
    {
        // Добавляем проверку валидности моделей
        if (false == ModelState.IsValid)
        {
            return BadRequest(ModelState);
        }
        using (var connection = _connectionService.CreateConnection())
        {
            var parameters = new DynamicParameters();
            parameters.Add("@CustomerID", id); // Указываем ID для обновления
            parameters.Add("@MedCard", customer.MedCard);
            parameters.Add("@CodeCustomer", customer.CodeCustomer);
            parameters.Add("@LastName", customer.LastName);
            parameters.Add("@FirstName", customer.FirstName);
            parameters.Add("@MiddleName", customer.MiddleName);
            parameters.Add("@Birthday", customer.Birthday);
            parameters.Add("@Arch", customer.Arch);
            // ... добавить другие поля

            await connection.ExecuteAsync(
                "dbo.uspSaveCustomer",
                parameters,
                commandType: System.Data.CommandType.StoredProcedure);

            return NoContent(); // Успешно обновили, данных нет для возврата
        }
    }

    [HttpDelete("{id}")]
    [Authorize(Roles = "Sensitive_high")]
    public async Task<IActionResult> DeleteCustomer(int id)
    {
        try
        {
            using (var connection = _connectionService.CreateConnection())
            {
                await connection.ExecuteAsync(
                    "dbo.uspDeleteCustomer",
                    new { CustomerID = id },
                    commandType: System.Data.CommandType.StoredProcedure);

                return NoContent();
            }
        }
        catch (Exception ex)
        {
            return StatusCode(500, new { message = $"{ex.Message}" });
        }
    }
}
