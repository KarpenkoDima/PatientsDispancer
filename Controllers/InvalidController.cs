using Dapper;
using Dispancer.Models;
using Dispancer.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace Dispancer.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize]
public class InvalidController : Controller
{
    private readonly UserConnectionService _userConnectionService;
    public InvalidController(UserConnectionService userConnectionService)
    {
        _userConnectionService = userConnectionService;
    }

    // ========= ЧТЕНИЕ (Sensitive_low и выше) ===========

    // GET: /api/invalid/by-customer/1
    [HttpGet("by-customer/{customerId}")]
    [Authorize(Roles ="Sensitive_low,Sensitive_medium,Sensitive_high")]
    public async Task<IActionResult> GetInvalidByCustomerId(int customerId)
    {
        try
        {
            using (var connection = _userConnectionService.CreateConnection())
            {
                var invalids = await connection.QueryAsync(
                    "dbo.uspGetInvalidByCustomerID",
                    new {CustomerID =  customerId},
                    commandType: System.Data.CommandType.StoredProcedure
                    );
                return Ok(invalids);
            }
        }
        catch (Exception ex)
        {
            return StatusCode(500, new { message = "Ошибка получения данных об инвалидностим" });
        }
    }
    
    [HttpGet("{invalidId}/benefits")]
    [Authorize(Roles ="Sensitive_low,Sensitive_medium,Sensitive_high")]
    public async Task<IActionResult> GetBenefitsByInvalidId(int invalidId)
    {
        try
        {
            using(var connection = _userConnectionService.CreateConnection())
            {
                // 
                var benefits = await connection.QueryAsync(@"
                    SELECT ibc.invID AS InvalidID,
                    ibc.BenefitsID AS BenefitsCategoryID,
                    bc.Name AS BenefitsCategoryName,
                    bc.NotaBene 
                FROM dbo.vGetInvalid_BenefitsCategory AS ibc 
                INNER JOIN dbo.vGetBenefitsCategory AS bc
                   ON bc.BenefitsCategoryID = ibc.BenefitsID
                WHERE ibc.InvID = @InvalidID",
                new { InvalidID = invalidId });

                return Ok(benefits);
            }
        }
        catch (Exception ex)
        {
            return StatusCode ( 500, new {message="Ошибка получения льгот"});
        }
    }
    
    [HttpGet("disability-groups")]
    [Authorize(Roles ="Sensitive_low,Sensitive_medium,Sensitive_high")]
    public async Task<IActionResult> GetDisabilityGroups()
    {
        try
        {
            using(var connection = _userConnectionService.CreateConnection())
            {
                var groups = await connection.QueryAsync(
                    "SELECT * FROM dbo.vGetDisabilityGroup");
                    return Ok(groups);                   
            }
        }
        catch (Exception ex)
        {
            return StatusCode(500, new { message = "Ошибка получения групп инвалидности" });
        }
    }

    [HttpGet("chiper-recepts")]
    [Authorize(Roles = "Sensitive_low,Sensitive_medium,Sensitive_high")]
    public async Task<IActionResult> GetChiperRecepts()
    {
        try
        {
            using (var connection = _userConnectionService.CreateConnection())
            {
                var recepts = await connection.QueryAsync(
                    "SELECT * FROM dbo.vGetChiperRecept"
                    );
                return Ok(recepts);
            }
        }
        catch (Exception ex)
        {
            return StatusCode(500, new { message = "Ошибка получения шифров" });
        }
    }
    [HttpGet("benefits-categories")]
    [Authorize(Roles = "Sensitive_low,Sensitive_medium,Sensitive_high")]
    public async Task<IActionResult> GetBenefitsCategories()
    {
        try
        {
            using (var connection = _userConnectionService.CreateConnection())
            {
                var categories = await connection.QueryAsync(
                    "SELECT * FROM dbo.vGetBenefitsCategories"
                    );
                return Ok(categories);
            }
        }
        catch (Exception ex)
        {
            return StatusCode(500, new { message = "Ошибка получения категорий льгот" });
        }
    }

    // ===== ЗАПИСЬ (создание и обновление) =======

    [HttpPost]
    [Authorize(Roles = "Sensitive_high,Sensitive_medium")]
    public async Task<IActionResult> SaveInvalid([FromBody]Invalid invalid)
    {
        try
        {
            using(var connection = _userConnectionService.CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@InvalidID", invalid.InvalidID, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
                parameters.Add("@DisabilityGroupID", invalid.DisabilityGroupID);
                parameters.Add("@DataInvalidity", invalid.DataInvalidity);
                parameters.Add("@PeriodInvalidity", invalid.PeriodInvalidity);
                parameters.Add("@ChiperReceptID", invalid.ChiperReceptID);
                parameters.Add("@Incapable", invalid.Incapable);
                parameters.Add("@DateIncapable", invalid.DateIncapable);
                parameters.Add("@CustomerID", invalid.CustomerID);                

                await connection.ExecuteAsync(
                    "dbo.uspSaveInvalid",
                    parameters,
                    commandType: System.Data.CommandType.StoredProcedure
                );

                var savedId = parameters.Get<int>("@InvalidID");

                return Ok(new
                {
                    messag = "Инвалидность сохранена",
                    invalidId = savedId
                });
            }            
        }
        catch (Exception ex)
        {
            return StatusCode(500, new
            {
                message = $"Ошибка сохранения: {ex.Message}",
                details = ex.InnerException?.Message
            });
        }
    }

    [HttpPost("{invalidId}/benefits/{benefitId}")]
    [Authorize(Roles = "Sensitive_high,Sensitive_medium")]
    public async Task<IActionResult> AddBenefit(int invalidId, int benefitId)
    {
        try
        {
            using (var connection = _userConnectionService.CreateConnection())
            {
                await connection.ExecuteAsync(
                    "dbo.uspSaveInvalidBenefitsCategory",
                    new
                    {
                        InvalidID = invalidId,
                        BenefitsCategoryID = benefitId
                    },
                    commandType: System.Data.CommandType.StoredProcedure
                    );

                return Ok(new { message = "Льгота добавлена" });
            }
        }
        catch (Exception ex)
        {
            return StatusCode(500, new
            {
                message = "Ошибка добавления льготы",
                details = ex.Message
            });
        }
    }

    [HttpDelete("{invalidId}/benefits/{benefitId}")]
    [Authorize(Roles ="Sensitive_medium,Sensitive_high")]
    public async Task<IActionResult> RemoveBenefits(int invalidId, int benefitId)
    {
        try
        {
            using (var connection = _userConnectionService.CreateConnection())
            {
                await connection.ExecuteAsync(
                    "dbo.uspDeleteInvalidBenefitsCategory",
                    new
                    {
                        InvalidID = invalidId,
                        BenefitsCategory = benefitId
                    },
                    commandType: System.Data.CommandType.StoredProcedure
                    );

                return Ok(new { message = "Льгота удалена" });
            }
        }
        catch (Exception ex)
        {
            return StatusCode(500, new
            {
                message = "Ошибка удаление льготы"
            });
        }
    }

    // === УДАЛНИЕ (только Sensitive_high) ===
    [HttpDelete("{invalidId}")]
    [Authorize(Roles ="Sensitive_high")]
    public async Task<IActionResult> DeleteInvalid(int invalidid)
    {
        try
        {
            using (var connection = _userConnectionService.CreateConnection())
            {
                await connection.ExecuteAsync(
                    "dbo.uspDeleteInvalid",
                    new {InvalidID=invalidid},
                    commandType: System.Data.CommandType.StoredProcedure
                    );

                return Ok(new
                {
                    message = "Инвалидность удалена"
                });
            }
        }
        catch (Exception ex)
        {
            return StatusCode(500, new { message = "Ошибка удаления инвалидности" });
        }
    }

    // ============ ПОИСК ============

    [HttpGet("by-lastname/{lastName}")]
    [Authorize(Roles = "Sensitive_low,Sensitive_medium,Sensitive_high")]
    public async Task<IActionResult> GetInvalidByLastName(string lastName)
    {
        try
        {
            using (var connection = _userConnectionService.CreateConnection())
            {
                var invalids = await connection.QueryAsync(
                    "dbo.uspGetInvalidByLastName",
                    new { LastName = lastName },
                    commandType: CommandType.StoredProcedure);

                return Ok(invalids);
            }
        }
        catch (Exception ex)
        {
            return StatusCode(500, new { message = "Ошибка поиска" });
        }
    }
       
    [HttpGet("by-benefits/{benefitsId}")]
    [Authorize(Roles = "Sensitive_low,Sensitive_medium,Sensitive_high")]
    public async Task<IActionResult> GetInvalidByBenefits(int benefitsId)
    {
        try
        {
            using (var connection = _userConnectionService.CreateConnection())
            {
                var invalids = await connection.QueryAsync(
                    "dbo.uspGetInvalidByBenefitsCategory",
                    new { ID = benefitsId },
                    commandType: CommandType.StoredProcedure);

                return Ok(invalids);
            }
        }
        catch (Exception ex)
        {
            return StatusCode(500, new { message = "Ошибка поиска" });
        }
    }
}
