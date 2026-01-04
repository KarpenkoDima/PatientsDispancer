using Dispancer.Core.Models;
using Dispancer.SqlData;
using Microsoft.Data.SqlClient;

namespace Dispancer.Service;

public class RegisterService
{
    private readonly ISqlData _sqlData;

    public RegisterService(ISqlData sqlData)
    {
        _sqlData = sqlData;
    }

    public async Task<IEnumerable<RegisterEntry>> GetRegisterForCustomer(int customerId)
    {
        try
        {
            var entries = await _sqlData.QueryAsync<RegisterEntry>(
                    "dbo.uspGetRegisterByCustomerID",
                    new { CustomerID = customerId },
                    commandType: System.Data.CommandType.StoredProcedure
                    );
            return entries;
        }
        catch (SqlException)
        {
            // Буду логгировать тут ошибки и дальше пробрасывать
            throw;
        }
    }
}
