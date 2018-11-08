using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace api_integrador.datos
{
    public class Conexion
    {
        SqlConnection cn;
        public SqlConnection conecta()
        {
            cn = new SqlConnection(
            "server=.;database=BDINTEGRADOR;Integrated Security=true");
            return cn;
        }
    }
}
