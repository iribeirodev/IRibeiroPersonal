using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace IRibeiroPessoalApp.Services
{
    public abstract class BaseService
    {
        private readonly IConfiguration _config;

        protected BaseService(IConfiguration configuration)
        {
            _config = configuration;
        }

        protected SqlConnection GetConnection()
        {
            var connection = new SqlConnection(_config.GetConnectionString("DefaultConnection"));
            connection.Open();

            return connection;
        }

    }
}
