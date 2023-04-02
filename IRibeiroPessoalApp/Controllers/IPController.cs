using IRibeiroPessoalApp.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Threading.Tasks;

namespace IRibeiroPessoalApp.Controllers
{
    public class IPController : Controller
    {
        private readonly ILogger<IPController> _logger;
        public IPController(ILogger<IPController> logger) => _logger = logger;

        [HttpPost]
        public async Task<IActionResult> PostIP([FromServices] IPService _ipService)
        {
            _logger.LogInformation("chamando Action PostIP");
            await _ipService.RegisterUserIP(Response.HttpContext);
            return Ok();
        }
    }
}
