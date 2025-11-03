using System.Text.Json.Serialization;

namespace Dispancer.Frontend.Models;

public class LoginResponse
{
    [JsonPropertyName("token")]
    public string Token { get; set; }

    [JsonPropertyName("userName")]
    public string UserName { get; set; }

    [JsonPropertyName("role")]
    public string Role { get; set; }

    [JsonPropertyName("sensitiveLevel")]
    public string SensitiveLevel { get; set; }
}
