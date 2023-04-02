using Dapper;
using IRibeiroPessoalApp.Models;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace IRibeiroPessoalApp.Services
{
    public class LanguageService: BaseService
    {
        private IConfiguration _configuration;
        public LanguageService(IConfiguration configuration) : base(configuration) => _configuration = configuration;

        public List<Section> GetSections(string abbreviation)
        {
            using (var connection = this.GetConnection())
            {
                var result = connection.Query<Section>("GetSectionsByLanguage", new { abbreviation = abbreviation }, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

        public About GetAbout(string abbreviation)
        {
            using (var connection = this.GetConnection())
            {
                var result = connection.Query<About>("GetPresentationByLanguage",
                    new { abbreviation = abbreviation }, commandType: CommandType.StoredProcedure).SingleOrDefault();

                return result;
            }
        }

        public List<ContactField> GetContactFields(string abbreviation)
        {
            using (var connection = this.GetConnection())
            {
                var result = connection.Query<ContactField>("GetContactFieldsByLanguage",
                    new { abbreviation = abbreviation }, commandType: CommandType.StoredProcedure).ToList();

                return result;
            }
        }
    }
}
