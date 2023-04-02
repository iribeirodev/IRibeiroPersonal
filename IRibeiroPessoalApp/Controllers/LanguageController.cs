using IRibeiroPessoalApp.Services;
using Microsoft.AspNetCore.Mvc;

namespace IRibeiroPessoalApp.Controllers
{
    public class LanguageController : Controller
    {
        [HttpGet]
        public IActionResult GetSections([FromServices] LanguageService _languageService, string abbreviation) => Ok(_languageService.GetSections(abbreviation));

        [HttpGet]
        public IActionResult GetAbout([FromServices] LanguageService _languageService, string abbreviation) => Ok(_languageService.GetAbout(abbreviation));

        [HttpGet]
        public IActionResult GetContactFields([FromServices] LanguageService _languageService, string abbreviation) => Ok(_languageService.GetContactFields(abbreviation));
    }
}
