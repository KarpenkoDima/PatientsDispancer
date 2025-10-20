namespace Dispancer.Models
{
    public class Customer
    {
        public int CustomerID { get; set; }
        public int? MedCard { get; set; }
        public int? CodeCustomer { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string? MiddleName { get; set; }
        public DateTime? Birthday { get; set; }
        public int Arch { get; set; } = 0;
    }
}
