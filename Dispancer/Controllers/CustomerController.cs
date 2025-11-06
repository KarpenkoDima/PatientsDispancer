using Dispancer.Core.Models;
using Dispancer.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace Dispancer.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize] // <-- это важно - только авторизированные пользователи могут сюда попасть
public class CustomerController : ControllerBase
{
    // -- 4.2. ДОБАВЛЯЕМ СЕРВИС ДЛЯ ПОЛУЧЕНИЯ УЧЕТНЫХ ДАННЫХ ДЛЯ ПАЦИЕНТОВ --
    private readonly CustomerService _customerService;
    // -- Log
    private readonly ILogger<CustomerController> _logger;
    public CustomerController(CustomerService customerService, ILogger<CustomerController> logger)
    {
        _customerService = customerService;
        _logger = logger;
    }

    [HttpGet]
    public async Task<IActionResult> GetCustomers()
    {
        var userName = User.Identity?.Name ?? "Unknown";
        try
        {
            var customers = await _customerService.GetCustomers();
            return Ok(customers);
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

            var customer = await _customerService.GetCustomerByLastName(lastName);                    

                if (customer == null)
                {
                    return NotFound(new { message = $"Пациент с фамилией {lastName} не найден" });
                }
                return Ok(customer);
            
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
            var customer = await _customerService.GetCustomerById(id);
            if (customer == null)
            {
                return NotFound(new { message = $"Пациент {id} не найден" });
            }
            return Ok(customer);
        }
        catch (InvalidOperationException ex)
        {
            _logger.LogWarning(ex, "Ошибка при получении сведений о пациенте по ID ={id}. Пользователь: {userName}", id, userName);

            return Unauthorized(new { message = "Неавторизированный доступ - нет прав" });
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

            customer = await _customerService.CreateCustomer(customer);
            _logger.LogInformation("Пациент с CustomerID = {newId} добавлен. Пользователь: {userName}", customer.CustomerID, userName);
            return CreatedAtAction(nameof(CreateCustomer), new { id = customer.CustomerID }, customer);
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
                await _customerService.UpdateCustomer(id, customer);
                _logger.LogInformation("Пациент с CustomerID = {id} обновлен в БД. Пользователь: {userName}", id, userName);
                return NoContent(); // Успешно обновили, данных нет для возврата            
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
            
                await _customerService.DeleteCustomer(id);
                _logger.LogInformation("Удаление пациента выполненео успешно CustomerID {id}. Пользователь: {userName}", id, userName);
                return NoContent();
            
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Ошибка при удалении пациента. пользовател {userName}", userName);
            return StatusCode(500, new { message = $"{ex.Message}" });
        }
    }    
}
