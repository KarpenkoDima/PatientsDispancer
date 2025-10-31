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

    // -- Log
    private readonly ILogger<CustomerController> _logger;
    public CustomerController(UserConnectionService connectionService, ILogger<CustomerController> logger)
    {
        _connectionService = connectionService;// ТУТ ДАННЫЕ ДЛЯ ПОДКЛЮЧЕНИЯ
        _logger = logger;
    }

    [HttpGet]
    public async Task<IActionResult> GetCustomers()
    {
        var userName = User.Identity?.Name ?? "Unknown";
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
            _logger.LogError(ex, "Ошибка при получении списка пациентов из БД: ");
            // В продакшен приложении здусь будет логирование ошибок
            return StatusCode(500, new { message = "An internal server error occurred." });
        }
        catch (InvalidOperationException ex) // для ошибки если допустим отсутствует пароль или логин
        {
            _logger.LogWarning(ex, "Ошибка при получении списка пациентов из БД. Пользователь: {userName}", userName);
            return Unauthorized(new { message = ex.Message });
        }
    }
    
    // НОВЫЕ МЕТОДЫ
    // GET: api/customer/5 получаем одного пациента по LastName
    [HttpGet("by-lastname/{lastName}")]
    public async Task<IActionResult> GetCustomerByLastName(string lastName)
    {
        var userName = User.Identity?.Name ?? "Unknown";

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
            _logger.LogWarning(ex, "Ошибка при получении Ф.И.О. пациента из БД. Пользователь: {userName}", userName);
            return Unauthorized(new
            {
                message = "Неавторизированный доступ"
            });
        }
    }
    
    [HttpGet("{id}")]
    public async Task<IActionResult> GetCustomerById(int id)
    {
        var userName = User.Identity?.Name ?? "Unknown";

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
            _logger.LogWarning(ex, "Ошибка при получении сведений о пациенте по ID ={id}. Пользователь: {userName}", id, userName);

            return Unauthorized(new { message =  "Неавторизированный доступ - нет прав" });
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
        var userName = User.Identity?.Name ?? "Unknown";
        try
        {
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
                _logger.LogInformation("Пациент с CustomerID = {newId} добавлен. Пользователь: {userName}", newId, userName);
                return CreatedAtAction(nameof(CreateCustomer), new { id = newId }, customer);
            }
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Ошибка при добавлении пациента. Пользователь: {userName}", userName);
            return StatusCode(500, "Ошибка операции");
        }
    }

    [HttpPut("{id}")]
    [Authorize(Roles = "Sensitive_medium,Sensitive_high")] // Только Оператор и Админ
    public async Task<IActionResult> UpdateCustomer(int id, [FromBody] Customer customer)
    {
        var userName = User.Identity?.Name ?? "Unknown";

        _logger.LogInformation("Старт обновления Пациента с CustomerID = {id}. Пользователь: {userName}", id, userName);
        // Добавляем проверку валидности моделей
        if (false == ModelState.IsValid)
        {
            _logger.LogWarning("Пациент с CustomerID = {id} не обновлен в БД. Данные некоректные. Пользователь: {userName}", id, userName);
            return BadRequest(ModelState);
        }

        try
        {
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
                _logger.LogInformation("Пациент с CustomerID = {id} обновлен в БД. Пользователь: {userName}", id, userName);
                return NoContent(); // Успешно обновили, данных нет для возврата
            }
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Ошибка при обновлении пациента с CustomerID = {id}: ", id);
            return StatusCode(500, "Ошибка операции");
        }
    }

    [HttpDelete("{id}")]
    [Authorize(Roles = "Sensitive_high")]
    public async Task<IActionResult> DeleteCustomer(int id)
    {
        var userName = User.Identity?.Name ?? "Unknown";
        try
        {
            using (var connection = _connectionService.CreateConnection())
            {
                await connection.ExecuteAsync(
                    "dbo.uspDeleteCustomer",
                    new { CustomerID = id },
                    commandType: System.Data.CommandType.StoredProcedure);
                _logger.LogInformation("Удаление пациента выполненео успешно CustomerID {id}. Пользователь: {userName}", id, userName);
                return NoContent();
            }
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Ошибка при удалении пациента. пользовател {userName}", userName);
            return StatusCode(500, new { message = $"{ex.Message}" });
        }
    }
}
