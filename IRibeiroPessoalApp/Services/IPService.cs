using Dapper;
using IRibeiroPessoalApp.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Data;
using System.Net;
using System.Net.Http;
using System.Text.Json;
using System.Threading.Tasks;

namespace IRibeiroPessoalApp.Services
{
    public class IPService: BaseService
    {
        private IConfiguration _configuration;

        private readonly ILogger<IPService> _logger;


        public IPService(IConfiguration configuration, ILogger<IPService> logger) : base(configuration)
        {
            _logger = logger;
            _configuration = configuration;
        }

        public async Task RegisterUserIP(HttpContext context)
        {
            _logger.LogInformation("chamando IPService::RegisterUserIP");

            string ip = context.Connection.RemoteIpAddress.ToString();
            if (ip == "::1")
                ip = "1.1.1.1";

            string url = _configuration.GetValue<string>("ipgeolocation:url").Replace("{ip}", ip);

            _logger.LogInformation("URL de consulta: ", url);

            try
            {
                using var client = new HttpClient();
                _logger.LogInformation("Consultando site de ip");
                var response = await client.GetAsync(url);
                if (response.StatusCode == HttpStatusCode.OK)
                {

                    var content = await response.Content.ReadAsStringAsync();

                    var ipResponse = JsonSerializer.Deserialize<IPResponse>(content);
                    _logger.LogInformation("IPResponse", ipResponse);

                    using (var connection = this.GetConnection())
                    {
                        var parameters = new
                        {
                            ipAddress = ipResponse.ip,
                            city = ipResponse.city,
                            continentName = ipResponse.continent_name,
                            countryCode = ipResponse.country_code2,
                            countryName = ipResponse.country_code3,
                            stateProv = ipResponse.state_prov
                        };

                        var result = await connection.ExecuteAsync("InsertIPDetails", parameters, commandType: CommandType.StoredProcedure);
                    }
                }
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }
    }
}
