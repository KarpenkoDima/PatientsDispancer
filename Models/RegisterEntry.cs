namespace Dispancer.Models
{
    public class RegisterEntry
    {
        public int RegisterID { get; set; }
        public DateTime? FirstRegister { get; set; }
        public DateTime? FirstDeregister { get; set; }
        public DateTime? SecondRegister { get; set; }
        public DateTime? SecondDeRegister { get; set; }
        public string? Diagnosis { get; set; }
        public int? RegisterTypeID { get; set; }
        public int CustomerID { get; set; }
        public int? WhyDeRegisterID { get; set; }
        public int? WhySecondDeRegisterID { get; set; }
        public int? SecondRegisterTypeID { get; set; }
        public int LandID { get; set; }
        public string? NotaBene { get; set; }

        
    }

}
