using Dapper;
using Dispancer.Models;
using Dispancer.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel;
using System.Diagnostics.Eventing.Reader;

namespace Dispancer.Controllers;

[ApiController]
// ВАЖНО Маршрут привязан к конкретному пациенту
[Route("api/customer/{customerId}/register")]
[Authorize]
public class RegisterController : Controller
{

    private readonly UserConnectionService _connectionService;

    private readonly ILogger<RegisterController> _logger;
    public RegisterController(UserConnectionService connectionService, ILogger<RegisterController> logger)
    {
        _connectionService = connectionService;
        _logger = logger;
    }

    // GET: api/customer/5/register/10
    [HttpGet("{registerId}")]
    public async Task<IActionResult> GetRegisterById(int registerId)
    {

        var userName = User.Identity?.Name ?? "Unknown";
        try
        {
            using (var connection = _connectionService.CreateConnection())
            {
                var entries = await connection.QueryAsync(
                    $"SELECT * FROM dbo.vGetRegister AS vgr WHERE vgr.RegisterID = @RegisterID",
                    new { RegisterID = registerId }
                    );
                if (entries == null)
                {
                    return NotFound();
                }
                return Ok(entries);
            }
        }
        catch (InvalidOperationException ex) // для ошибки если допустим отсутствует пароль или логин
        {
            _logger.LogWarning(ex, "Ошибка при получении записи RegisterID {registerId} пациента: {userName}", registerId, userName);
            return Unauthorized(new { message = "неавторизированный доступ"});
        }
    }

    [HttpGet]
    public async Task<IActionResult> GetRegisterForCustomer(int customerId)
    {

        var userName = User.Identity?.Name ?? "Unknown";
        try
        {
            using (var connection = _connectionService.CreateConnection())
            {
                var entries = await connection.QueryAsync(
                    "dbo.uspGetRegisterByCustomerID",
                    new { CustomerID = customerId },
                    commandType: System.Data.CommandType.StoredProcedure
                    );

                return Ok(entries);
            }
        }
        catch (InvalidOperationException ex) // для ошибки если допустим отсутствует пароль или логин
        {
            _logger.LogWarning(ex, "Ошибка при получении записи по CustomerID {customerId} пациента: пользоваель: {userName}",customerId, userName);
            return Unauthorized(new { message = "неавторизированный доступ" });
        }
    }

    // POST: api/customer/5/register (Создать новую запись для пациента)
    [HttpPost]
    [Authorize(Roles =("Sensitive_medium,Sensitive_high"))]
    public async Task<IActionResult> CreateRegister(int customerId, [FromBody] RegisterEntry registerEntry)
    {
        if (false== ModelState.IsValid)
        {
            BadRequest(ModelState);
        }

        var userName = User.Identity?.Name ?? "Unknown";
        try
        {

            using (var connection = _connectionService.CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@RegisterID", 0, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput); // ID =0 для создание
                parameters.Add("@CustomerID", customerId);
                parameters.Add("@RegisterID", registerEntry.RegisterID);
                parameters.Add("@FirstRegister", registerEntry.FirstRegister);
                parameters.Add("@FirstDeregister", registerEntry.FirstDeregister);
                parameters.Add("@SecondRegister", registerEntry.SecondRegister);
                parameters.Add("@SecondDeRegister", registerEntry.SecondDeRegister);
                parameters.Add("@Diagnosis", registerEntry.Diagnosis);
                parameters.Add("@RegisterTypeID", registerEntry.RegisterTypeID);
                parameters.Add("@WhyDeRegister", registerEntry.WhyDeRegisterID);
                parameters.Add("@WhySecondDeRegister", registerEntry.WhySecondDeRegisterID);
                parameters.Add("@SecondRegisterTypeID", registerEntry.SecondRegisterTypeID);
                parameters.Add("@LandID", registerEntry.LandID);
                parameters.Add("@NotaBene", registerEntry.NotaBene);

                await connection.ExecuteAsync("dbo.uspSaveRegister", parameters, commandType: System.Data.CommandType.StoredProcedure);
                var newId = parameters.Get<int>("@RegisterID");
                _logger.LogDebug("Создана новвая запись пациента с CustomerID: {customerId}, поьзователь: {userName}", customerId, userName);
                return Ok(new { RegisterID = newId });
            }
        }
        catch (Exception ex) // для ошибки если допустим отсутствует пароль или логин
        {
            _logger.LogError($"Ошибка при создании записи: {ex.Message}");
            return StatusCode(500, "Ошибка при создании записи");
        }
    }

    // PUT api/customer/5/register/10 (Обновить запись с RegisterID=10
    [HttpPut("{entryId}")]
    [Authorize(Roles = "Sensitive_medium,Sensitive_high")]
    public async Task<IActionResult> UpdateRegisterEntry(int customerId, int entryId, [FromBody] RegisterEntry registerEntry)
    {
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
                parameters.Add("@RegisterID", entryId);
                parameters.Add("@CustomerID", customerId);
                parameters.Add("@FirstRegister", registerEntry.FirstRegister);
                parameters.Add("@FirstDeregister", registerEntry.FirstDeregister);
                parameters.Add("@SecondRegister", registerEntry.SecondRegister);
                parameters.Add("@SecondDeRegister", registerEntry.SecondDeRegister);
                parameters.Add("@Diagnosis", registerEntry.Diagnosis);
                parameters.Add("@RegisterTypeID", registerEntry.RegisterTypeID);
                parameters.Add("@WhyDeRegister", registerEntry.WhyDeRegisterID);
                parameters.Add("@WhySecondDeRegister", registerEntry.WhySecondDeRegisterID);
                parameters.Add("@SecondRegisterTypeID", registerEntry.SecondRegisterTypeID);
                parameters.Add("@LandID", registerEntry.LandID);
                parameters.Add("@NotaBene", registerEntry.NotaBene);

                await connection.ExecuteAsync("dbo.uspSaveRegister", parameters, commandType: System.Data.CommandType.StoredProcedure);
                _logger.LogDebug("Успешна обновлена запись {entryId} пациента {customerId}. Пользователь: {userName}", entryId, customerId, userName);
                return NoContent();
            }

        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Ошибка при обновлении записи {entryId} пациента {customerId}. Пользователь: {userName}", entryId, customerId, userName);
            return StatusCode(500, new { message = $"ошибка операции" });
        }
    }

    // DELETE api.customer/5/register/10 (Удалить запись с RegisterID=10
    [HttpDelete("{entryId}")]
    [Authorize(Roles =("Sensitive_high"))] // Только админ
    public async Task<IActionResult> DeleteRegisterEntry(int entryId)
    {
        var userName = User.Identity?.Name ?? "Unknown";
        try
        {
            using (var connection = _connectionService.CreateConnection())
            {
                await connection.ExecuteAsync(
                    "dbo.uspDeleteRegister",
                    new { RegisterID = entryId },
                    commandType: System.Data.CommandType.StoredProcedure
                    );
                _logger.LogDebug("Удалена запись: {entryId}", entryId);
                return NoContent();
            }
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Ошибка при удалении записи {entryId}: Поьзователь: {userName}", entryId, userName);
            return StatusCode(500, "Ошибка при выполнении операции");
        }
    }
}
