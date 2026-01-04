using Dispancer.Core.Models;
using Dispancer.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Security.Claims;

namespace Dispancer.Pages;

[Authorize]
public class CustomerDetailsModel : PageModel
{
    private readonly CustomerService _customerService;
    private readonly RegisterService _registerService;
    private readonly ILogger<CustomerDetailsModel> _logger;

    public string Username { get; set; } = string.Empty;
    public Customer? Customer { get; set; }
    public string ErrorMessage { get; set; }= string.Empty;
    public IEnumerable<RegisterEntry> Registers { get; set; } = new List<RegisterEntry>();

    public CustomerDetailsModel(CustomerService customerService, RegisterService registerService, ILogger<CustomerDetailsModel> logger)
    {
        _customerService = customerService;
        _registerService = registerService;
        _logger = logger;
    }

    public async Task OnGetAsync(int CustomerID)
    {
        Username = User.FindFirst(ClaimTypes.NameIdentifier)?.Value ?? User.FindFirstValue("name") ?? "Unknown";
        try
        {
             Customer = await _customerService.GetCustomerById(CustomerID);
            if (Customer == null)
            {
                ErrorMessage = "Пациент не найден";
                return;
            }
            Registers = await _registerService.GetRegisterForCustomer(Customer.CustomerID);
            

        }
        catch (Exception ex)
        {
            _logger.LogWarning(ex, "Ошибка при получении записи по CustomerID {customerId} пациента: пользоваель: {userName}", CustomerID, Username);
             ErrorMessage = $"Ошибка при загрузки данных {ex.Message}";
        }
        
    }

    // ============================================================================
    // ОБРАБОТЧИКИ ДЛЯ РАБОТЫ С ПАЦИЕНТАМИ
    // ============================================================================

    public async Task<IActionResult> OnGetGetCustomerAsync(int customerId)
    {
        try
        {
            if (Customer == null)
            {
                Customer = await _customerService.GetCustomerById(customerId);
                if (Customer == null)
                {
                    ErrorMessage = "";
                    return NotFound();
                }
            }

            return new JsonResult(Customer);
        }
        catch (Exception ex)
        {

            return BadRequest(new { message = $"Ошибка:  {ex.Message}" });
        }
       
    }
}
