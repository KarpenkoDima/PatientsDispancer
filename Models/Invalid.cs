namespace Dispancer.Models;

// Модели данных
public class Invalid
{
    public int? InvalidID { get; set; }
    public int? DisabilityGroupID { get; set; }
    public DateTime? DataInvalidity { get; set; }
    public DateTime? PeriodInvalidity { get; set; }
    public int? ChiperReceptID { get; set; }
    public bool Incapable { get; set; }
    public DateTime? DateIncapable { get; set; }
    public int CustomerID { get; set; }
    public DateTime? ModifiedDate { get; set; }
}
