using Dapper;
using Dispancer.Core.Models;
using Dispancer.SqlData;
using Microsoft.Data.SqlClient;

namespace Dispancer.Service;

public class CustomerService
{
    private readonly ISqlData _sqlData;

    public CustomerService(ISqlData sqlData)
    {
        _sqlData = sqlData;
    }

    public async Task<IEnumerable<Customer>> GetCustomers()
    {
        try
        {
            var customers = await _sqlData.QueryAsync<Customer>("SELECT * FROM dbo.vGetCustomers");
            return customers;
        }
        catch (SqlException)
        {
            // Буду логгировать тут ошибки и дальше пробрасывать
            throw;
        }
    }
        
    public async Task<Customer> GetCustomerByLastName(string lastName)
    {
        try
        {
            var customer = await _sqlData.QuerySingleOrDefaultAsync<Customer>(
                    "dbo.uspGetCustomerByLastName",
                    new { LastName = lastName },
                    System.Data.CommandType.StoredProcedure);
            return customer;
        }
        catch (Exception ex)
        {
            // Буду логгировать тут ошибки и дальше пробрасывать

            throw;
        }
    }
   
    public async Task<Customer> GetCustomerById(int id)
    {    
        try
        {
                var customer = await _sqlData.QuerySingleOrDefaultAsync<Customer>(
                    "dbo.uspGetCustomerByID",
                    new { CustomerID = id },
                    System.Data.CommandType.StoredProcedure);
                
                return customer;            
        }
        catch (Exception ex)
        {        
            // Буду логгировать тут ошибки и дальше пробрасывать
            throw;
        }
    }   
    public async Task<Customer> CreateCustomer(Customer customer)
    {
        try
        {
            var newId = await _sqlData.ExecuteScalarAsync<int>(
                "dbo.uspSaveCustomer",
                customer,
                System.Data.CommandType.StoredProcedure);

            customer.CustomerID = newId;
            return customer;
        }
        catch (Exception ex)
        {
            // Буду логгировать тут ошибки и дальше пробрасывать

            throw;
        }
    }
    
    public async Task<Customer> UpdateCustomer(int id, Customer customer)
    {
        try
        {
            var parameters = new DynamicParameters();
            parameters.Add("@CustomerID", id); // Указываем ID для обновления
            parameters.Add("@MedCard", customer.MedCard);
            parameters.Add("@CodeCustomer", customer.CodeCustomer);
            parameters.Add("@LastName", customer.LastName);
            parameters.Add("@FirstName", customer.FirstName);
            parameters.Add("@MiddleName", customer.MiddleName);
            parameters.Add("@Birthday", customer.Birthday);
            parameters.Add("@Arch", customer.Arch);

            await _sqlData.ExecuteAsync<Customer>(
                "dbo.uspSaveCustomer",
               parameters,
                System.Data.CommandType.StoredProcedure);
            customer.CustomerID = id;
            return customer;
        }
        catch (Exception ex)
        {
            throw;
        }
    }

    public async Task DeleteCustomer(int id)
    {
        try
        {
            await _sqlData.ExecuteAsync<Customer>(
                "dbo.uspDeleteCustomer",
                new { CustomerID = id },
                System.Data.CommandType.StoredProcedure);         
         

        }
        catch (Exception ex)
        {
            // Буду логгировать тут ошибки и дальше пробрасывать

            throw;
        }
    }
}
