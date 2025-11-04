using Dispancer.Core.Inrterfaces;
using System.Data;
using Dapper;

namespace Dispancer.SqlData;

public class SqlDapper : ISqlData
{
    IUserConnectionService _connectionService;

    public SqlDapper(IUserConnectionService connectionService)
    {
            _connectionService = connectionService;
    }

    public Task<T> ExecuteAsync<T>(string sql, object? param, CommandType commandType)
    {
        throw new Exception();
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
                var customer = await connection.QuerySingleOrDefaultAsync(
                    sql,
                    param,
                    commandType:commandType
                    );

                return customer;
            }
        }
        catch (Exception ex)
        {

            throw;
        }
    }
}
