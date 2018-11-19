using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using api_integrador.modelos;
using System.Data;
using System.Data.SqlClient;

namespace api_integrador.datos
{
    public class UsuarioDatos
    {
        conexionbd cn = new conexionbd();

        public Usuario obtenerUsuario(Usuario usuario)
        {
            SqlConnection cnx = cn.conecta();
            string sqlStatement = "SP_LOGIN";
            SqlCommand comando = new SqlCommand(sqlStatement, cnx);
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@email", usuario.email);
            comando.Parameters.AddWithValue("@clave", usuario.clave);

            cnx.Open();
            SqlDataReader reader = comando.ExecuteReader();
           
                    Usuario u = new Usuario();
                    u.email = reader["Email"].ToString();
                    u.clave = reader["Clave"].ToString();
                    u.isEmpleado = bool.Parse(reader["isEmpleado"].ToString());
                    u.isAlumno = bool.Parse(reader["isAlumno"].ToString());
                    u.isTutor = bool.Parse(reader["isTutor"].ToString());

            cnx.Close();
            return usuario;
        }
    }
}
