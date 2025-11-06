using System.Data;

namespace Dispancer.SqlData;

public interface ISqlData
{
    Task<IEnumerable<T>> QueryAsync<T>(string sqlQuery);
    Task<T?> QuerySingleOrDefaultAsync<T>(string sql, object? param, CommandType commandType);
    Task<T?> ExecuteScalarAsync<T>(string sql, object? param, CommandType commandType);
    Task ExecuteAsync<T>(string sql, object? param, CommandType commandType);
    Task<IEnumerable<string?>> LoginAsync(string username, string password, string sql, CommandType commandType);
  
}

