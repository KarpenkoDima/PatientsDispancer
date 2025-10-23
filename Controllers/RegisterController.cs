using Dapper;
using Dispancer.Models;
using Dispancer.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel;

namespace Dispancer.Controllers;

[ApiController]
// ВАЖНО Маршрут привязан к конкретному пациенту
[Route("api/customer/{customerId}/register")]
public class RegisterController : Controller
{

    private readonly UserConnectionService _connectionService;

    public RegisterController(UserConnectionService connectionService)
    {
        _connectionService = connectionService;
    }

    [HttpGet]
    public async Task<IActionResult> GetRegisterForCustomer(int customerId)
    {
        using (var connection = _connectionService.CreateConnection())
        {
            var entries = await connection.QueryAsync(
                "uspGetRegisterByCustomerID",
                new { CustomerID = customerId },
                commandType: System.Data.CommandType.StoredProcedure
                );

            return Ok(entries);
        }
    }

    // POST: api/customer/5/register (Создать новую запись для пациента)
    [HttpPost]
    [Authorize(Roles =("Sensitive_medium,Sensitive_high"))]
    public async Task<IActionResult> CreateRegister(int customerId, [FromBody] RegisterEntry registerEntry)
    {
        using (var connection = _connectionService.CreateConnection())
        {
            var parameters = new DynamicParameters();
            parameters.Add("@RegisterID", 0, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput); // ID =0 для создание
            parameters.Add("CustomerID", customerId);
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
            parameters.Add("@NotaBene", registerEntry.Notes);

            await connection.ExecuteAsync("dbo.uspSaveRegister", parameters, commandType: System.Data.CommandType.StoredProcedure);
            var newId = parameters.Get<int>("@RegisterID");

            return Ok(new { RegisterID = newId });
        }
    }

    // PUT api/customer/5/register/10 (Обновить запись с RegisterID=10
    [HttpPut("{entryId}")]
    [Authorize(Roles ="Sensitive_medium,Sensitive_high")]
    public async Task<IActionResult> UpdateRegisterEntry(int customerId, int entryId, [FromBody] RegisterEntry registerEntry)
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
            parameters.Add("@NotaBene", registerEntry.Notes);

            await connection.ExecuteAsync("dbo.uspSaveRegister", parameters, commandType: System.Data.CommandType.StoredProcedure);
            return NoContent();
        }
    }

    // DELETE api.customer/5/register/10 (Удалить запись с RegisterID=10
    [HttpDelete("{entryId}")]
    [Authorize(Roles =("Sensitive_high"))] // Только админ
    public async Task<IActionResult> DeleteRegisterEntry(int entryId)
    {
        using (var connection = _connectionService.CreateConnection())
        {
            await connection.ExecuteAsync(
                "dbo.uspDeleteRegister",
                new { RegisterID = entryId },
                commandType: System.Data.CommandType.StoredProcedure
                );
            return NoContent();
        }
    }
}
