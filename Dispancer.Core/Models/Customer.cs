using System.ComponentModel.DataAnnotations;

namespace Dispancer.Core.Models;

public class Customer
{
    public int CustomerID { get; set; }
    [Range(1, int.MaxValue, ErrorMessage= "Номер медицинской карты должен быть положительным числом")]
    public int? MedCard { get; set; }

    [Range(1, int.MaxValue, ErrorMessage = "Номер пациента карты должен быть положительным числом")]
    public int? CodeCustomer { get; set; }

    [Required(ErrorMessage="Фамилия обязательна для заполнения")]
    public string LastName { get; set; }

    [Required(ErrorMessage = "Имя обязательно для заполнения")]
    public string FirstName { get; set; }
    public string? MiddleName { get; set; }
    public DateTime? Birthday { get; set; }
    public int Arch { get; set; } = 0;
}
