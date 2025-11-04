namespace Dispancer.Core.Interfaces;

public interface ITokenService
{
    string GenerateToken(string username, IEnumerable<string> role);
}
