using Dispancer.Service;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.ComponentModel.DataAnnotations;
using System.Security.Claims;

namespace Dispancer.Pages;

public class LoginModel : PageModel
{
    private readonly AuthService _authService;

    public LoginModel(AuthService authService)
    {
        _authService = authService;
    }

    [BindProperty]
    public InputModel Input { get; set; } = new InputModel();
    public string? ErrorMessage { get; set; }
    public void OnGet()
    {
        ErrorMessage = null; // Очищаем любую предыдущую ошибку
    }

    public async Task<IActionResult> OnPostAsync()
    {
        if (false == ModelState.IsValid)
        {
            return Page();
        }
        try
        {
            var (token, displayRole, sensitivityLevel, role) = await _authService.Login(Input.Username, Input.Password);

            // Если аутентификация успешна, создаем ClaimPrincipal
            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.NameIdentifier, Input.Username), // Username, не token!
                new Claim(ClaimTypes.Name, Input.Username),
                new Claim("DisplayRole", displayRole), // 
                new Claim(ClaimTypes.Role, sensitivityLevel)
            };

            var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            var authPropeties = new AuthenticationProperties
            {
                IsPersistent = true, // Сохранять вход между сессиями браузера
                ExpiresUtc = DateTimeOffset.UtcNow.AddHours(8) // Срок действия cookie
            };

            // Выполняем вход пользователя, создаем cookie
            await HttpContext.SignInAsync(
                CookieAuthenticationDefaults.AuthenticationScheme,
                new ClaimsPrincipal(claimsIdentity),
                authPropeties
                );

            // перенаправляем на защищенную страницу
            return RedirectToPage("/Dashboard");

        }
        catch (UnauthorizedAccessException ex)
        {
            ErrorMessage = ex.Message;
            return Page();
        }
        catch (Exception ex)
        {
            ErrorMessage = $"Произошло ошибка: {ex.Message}";
            return Page();
        }
    }
}

public class InputModel
{
    [Required(ErrorMessage = "Имя пользователя обязательно")]
    public string Username { get; set; } = "";

    [Required(ErrorMessage = "Пароль обязательно")]
    [DataType(DataType.Password)]
    public string Password { get; set; } = "";
}