using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Hosting;

namespace IRibeiroPessoalApp.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger) => _logger = logger;

        public IActionResult Index() => RedirectToAction("About");

        [Route("/about")]
        public IActionResult About() => View();

        [Route("/articles")]
        public IActionResult Articles() => View();

        [Route("/contact")]
        public IActionResult Contact() => View();

        [Route("/error")]
        public IActionResult HandleError() => Problem();


        [Route("/error-development")]
        public IActionResult HandleErrorDevelopment(
            [FromServices] IHostEnvironment hostEnvironment)
        {
            if (!hostEnvironment.IsDevelopment())
                return NotFound();

            var exceptionHandlerFeature =
                HttpContext.Features.Get<IExceptionHandlerFeature>()!;

            return Problem(
                detail: "Erro de servidor",
                title: exceptionHandlerFeature.Error.Message);
        }
    }
}
