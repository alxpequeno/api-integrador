using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace api_integrador.datos
{
    public class conexionbd
    {
        SqlConnection cn;
        public SqlConnection conecta()
        {
            cn = new SqlConnection(
            "server=sql5021.site4now.net;database=DB_A42E0A_integrador;uid=DB_A42E0A_integrador_admin;pwd=APIintegrador123");

           // "server=ANDRES\\SQLEXPRESS;database=BDINTEGRADOR;uid=sa;pwd=sql");

            return cn;
        }
    }
}
