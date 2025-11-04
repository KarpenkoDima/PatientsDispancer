using Microsoft.Data.SqlClient;

namespace Dispancer.Core.Inrterfaces;

public interface IUserConnectionService
{
    SqlConnection CreateConnection();
}