using Dispancer.Core.Models;
using Dispancer.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Security.Claims;
using System.Text.Json;

namespace Dispancer.Pages;

[Authorize]
public class DashboardModel : PageModel
{
    private readonly CustomerService _customerService;
    private readonly ILogger<DashboardModel> _logger;
    public string Username { get; set; }
    public DashboardModel(CustomerService customerService, ILogger<DashboardModel> logger)
    {
        _customerService = customerService;
       _logger = logger;        
    }

    public IEnumerable<Customer> Customers { get; set; } = new List<Customer>();

    /// <summary>
    /// Загружаем список всех пациентов
    /// </summary>
    /// <returns></returns>
    public async Task OnGetAsync()
    {
        Username = User.FindFirst(ClaimTypes.NameIdentifier)?.Value ?? User.FindFirstValue("name") ?? "Unknown";

        // Прловеряем, авторизированн ли пользователь
        if (User.Identity?.IsAuthenticated == true)
        {
            Customers = await _customerService.GetCustomers();
        }
    }

    /// <summary>
    /// Возвращает данные пациента в формате JSON для заполнения модального окна
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public async Task<IActionResult> OnGetCustomerAsync(int id)
    {
        try
        {
            var customer = await _customerService.GetCustomerById(id);

            if (customer == null)
            {
                return NotFound(new {message="Пациент не найден"});
            }

            return new JsonResult(customer);
        }
        catch (Exception ex)
        {
            return BadRequest(new { message = $"Ошибка: {ex.Message}" });
        }
    }

   // [Authorize(Roles = "Sensitive_medium,Sensitive_high")]
    public async Task<IActionResult> OnPostSaveCustomerAsync()
    {
        if (User.IsInRole("Sensitive_medium") || User.IsInRole("Sensitive_high")) {
            try
            {
                // Читаем JSON из тела запроса
                using var reader = new StreamReader(Request.Body);
                var body = await reader.ReadToEndAsync();
                var customerData = JsonSerializer.Deserialize<Customer>(body, new JsonSerializerOptions()
                {
                    PropertyNameCaseInsensitive = true
                });

                if (customerData == null)
                {
                    return BadRequest(new { message = "Фамлияобязательно" });
                }

                //Валидация            
                if (string.IsNullOrWhiteSpace(customerData.LastName))
                {
                    return BadRequest(new { message = "Имя обязательно для фамилия" });
                }
                if (string.IsNullOrWhiteSpace(customerData.FirstName))
                {
                    return BadRequest(new { message = "Имя обязательно для заполнения" });
                }

                // Сохраняем или обновляем пациента
                if (customerData.CustomerID == 0)
                {
                    // Создание нового
                    var newCustomer = await _customerService.CreateCustomer(customerData);
                    _logger.LogInformation($"{Username} добавил нового пациентаа id = {newCustomer.CustomerID} ФИО: {newCustomer.LastName}");
                    return new JsonResult(new
                    {
                        success = true,
                        customerId = newCustomer.CustomerID,
                        message = "Пациент успешно добавлне"
                    });
                }
                else
                {
                    // Обновление существующего пациента
                    await _customerService.UpdateCustomer(customerData.CustomerID, customerData);
                    _logger.LogInformation($"{Username} изменил данные пцаинта id = {customerData.CustomerID} ФИО: {customerData.LastName}");
                    return new JsonResult(new
                    {
                        success = true,
                        customerId = customerData.CustomerID,
                        message = "Пациент успешно обновлен"
                    });

                }
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = $"Ошибка сохранения: {ex.Message}" });
            }
        }
        return Page();
    }
   // [Authorize(Roles = "Sensitive_high")]
    public async Task OnDelteCustomerAsync(int id, CancellationToken token)
    {
        if (User.IsInRole("Sensitive_high"))
        {
            try
            {

                await _customerService.DeleteCustomer(id);
                _logger.LogInformation($"{Username} удалил пациентаа id = {id} ФИО");

                //return NoContent();
            }
            catch (Exception ex)
            {
                // return BadRequest(new { message = $"Ошибка: {ex.Message}");
                throw;
            }
        }
    }
}
