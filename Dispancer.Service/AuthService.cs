using Dispancer.SqlData;
using Microsoft.Data.SqlClient;

namespace Dispancer.Service;

public class AuthService
{
    private readonly ISqlData _sqlData;
    public AuthService(ISqlData sqlData)
    {
        _sqlData = sqlData;
    }
    public async Task<IEnumerable<string>> Login(string username, string password)
    {
        // 1. Пытаемся подключиться к БД с учетными данными пользователя
        try
        {           
                var roles = await _sqlData.LoginAsync(
                    username, 
                    password,
                    "dbo.uspGetRoleForUser",               
                    System.Data.CommandType.StoredProcedure);
              
                return roles;            
        }
        catch (SqlException ex)
        {
            throw ex;
        }
    }
}
