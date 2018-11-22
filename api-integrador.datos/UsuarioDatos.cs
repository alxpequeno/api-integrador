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
        SqlConnection conexion;
        public UsuarioDatos()
        {
            conexion = cn.conecta();
        }

        public List<Usuario> ListaTutoresPendientes()
        {

            List<Usuario> usuarios = null;

            conexion.Open();

            string query = "SP_LISTA_TUTORES_PENDIENTES";
            SqlCommand comando = new SqlCommand(query, conexion);
            comando.CommandType = CommandType.StoredProcedure;

            SqlDataReader lector = comando.ExecuteReader();

            if (lector.HasRows)
            {
                usuarios = new List<Usuario>();

                while (lector.Read())
                {
                    var u = new Usuario();
                    u.id = int.Parse(lector["Id"].ToString());
                    u.nombre = lector["Nombre"].ToString();
                    u.apellido = lector["Apellido"].ToString();
                    u.direccion = lector["Direccion"].ToString();
                    u.email = lector["Email"].ToString();
                    u.clave = lector["Clave"].ToString();
                    u.isEmpleado = bool.Parse(lector["isEmpleado"].ToString());
                    u.isTutor = bool.Parse(lector["isTutor"].ToString());
                    u.isAlumno = bool.Parse(lector["isAlumno"].ToString());
                    u.estado = bool.Parse(lector["Estado"].ToString());

                    usuarios.Add(u);
                }
            }

            conexion.Close();
            return usuarios;
        }

        public Usuario Login(string email, string clave)
        {
            Usuario usuario = null;

            conexion.Open();

            string query = "SP_LOGIN";
            SqlCommand comando = new SqlCommand(query, conexion);
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@email", email);
            comando.Parameters.AddWithValue("@clave", clave);

            SqlDataReader lector = comando.ExecuteReader();

            if (lector.HasRows)
            {
                while (lector.Read())
                {
                    usuario = new Usuario();
                    usuario.id = int.Parse(lector["Id"].ToString());
                    usuario.nombre = lector["Nombre"].ToString();
                    usuario.apellido = lector["Apellido"].ToString();
                    usuario.direccion = lector["Direccion"].ToString();
                    usuario.email = lector["Email"].ToString();
                    usuario.clave = lector["Clave"].ToString();
                    usuario.isEmpleado = bool.Parse(lector["isEmpleado"].ToString());
                    usuario.isTutor = bool.Parse(lector["isTutor"].ToString());
                    usuario.isAlumno = bool.Parse(lector["isAlumno"].ToString());
                    usuario.estado = bool.Parse(lector["Estado"].ToString());
                }
            }

            conexion.Close();

            return usuario;
        }
    }
}
