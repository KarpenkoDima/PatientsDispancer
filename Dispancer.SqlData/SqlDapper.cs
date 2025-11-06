using Dapper;
using Dispancer.Core.Configuration;
using Dispancer.Core.Inrterfaces;
using Microsoft.Data.SqlClient;
using System.Data;

namespace Dispancer.SqlData;

public class SqlDapper : ISqlData
{
    IUserConnectionService _connectionService;
    ConnectionStrings _connectionStrings;
    public SqlDapper(IUserConnectionService connectionService, ConnectionStrings connectionStrings)
    {
        _connectionService = connectionService;
        _connectionStrings = connectionStrings;
    }

    public async Task ExecuteAsync<T>(string sql, object? param, CommandType commandType)
    {
        try
        {
            using (var connection = _connectionService.CreateConnection())
            {
              await connection.ExecuteAsync(sql, param, commandType:commandType);
            }
        }
        catch (Exception ex)
        {

            throw;
        }
    }

    public async Task<T?> ExecuteScalarAsync<T>(string sql, object? param, CommandType commandType)
    {
        try
        {
            using (var connection = _connectionService.CreateConnection())
            {
                return await connection.ExecuteScalarAsync<T>(
                    sql,
                    param,
                    commandType: commandType
                    );
            }
        }
        catch (Exception ex)
        {

            throw;
        }
    }

    public async Task<IEnumerable<T>> QueryAsync<T>(string sqlQuery)
    {
        try
        {
            using (var connection = _connectionService.CreateConnection())
            {
                return await connection.QueryAsync<T>(sqlQuery);
            }
        }
        catch (Exception ex)
        {
            throw;
        }
    }

    public async Task<T?> QuerySingleOrDefaultAsync<T>(string sql, object? param, CommandType commandType)
    {
        try
        {
            using (var connection = _connectionService.CreateConnection())
            {
                T ret = await connection.QuerySingleOrDefaultAsync<T>(
                    sql,
                    param,
                    commandType: commandType
                    );

                return ret;
            }
        }
        catch (Exception ex)
        {

            throw;
        }
    }

    public async Task<IEnumerable<string?>> LoginAsync(string username, string password, string sql, CommandType commandType)
    {
        var userConnectionString = new SqlConnectionStringBuilder(_connectionStrings.DefaultConnection)
        {
            UserID = username,
            Password = password
        }.ConnectionString;

        //  Пытаемся подключиться к БД с учетными данными пользователя
        try
        {
            await using (var connection = new SqlConnection(userConnectionString))
            {
                await connection.OpenAsync(); // Если Логин/Пароль не верны то будет исключение тут
                                              // 
                                              // 3. Если подключение успешно, получаем роли пользователя
                var roles = await connection.QueryAsync<string>(
                    sql, // "dbo.uspGetRoleForUser",                 
                    commandType);

                return roles;
            }
        }
        catch (Exception ex)
        {
            throw;
        }
    }
}
