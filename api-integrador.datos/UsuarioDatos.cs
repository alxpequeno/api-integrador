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

        public void RegistrarTutor(Usuario usuario)
        {
            conexion.Open();
            string sqlStatement = "SP_TUTOR_INSERT";
            SqlCommand comando = new SqlCommand(sqlStatement, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@nombre", usuario.nombre);
            comando.Parameters.AddWithValue("@apellido", usuario.apellido);
            comando.Parameters.AddWithValue("@direccion", usuario.direccion);
            comando.Parameters.AddWithValue("@email", usuario.email);
            comando.Parameters.AddWithValue("@clave", usuario.clave);
            comando.ExecuteNonQuery();
            conexion.Close();
        }


        public void EliminarTutor(int id)
        {
            conexion.Open();
            string sqlStatement = "SP_TUTOR_DELETE";
            SqlCommand comando = new SqlCommand(sqlStatement, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@id", id);
            comando.ExecuteNonQuery();
            conexion.Close();
        }


        public List<Usuario> ListarTutores()
        {
            List<Usuario> usuarios = null;
            string sqlStatement = "SP_TUTOR_LISTAR";
            SqlCommand comando = new SqlCommand(sqlStatement, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            conexion.Open();
            SqlDataReader reader = comando.ExecuteReader();
            if (reader.HasRows)
            {
                usuarios = new List<Usuario>();
                while (reader.Read())
                {
                    Usuario usuario = new Usuario();
                    usuario.id = int.Parse(reader["id"].ToString());
                    usuario.nombre = reader["nombre"].ToString();
                    usuario.apellido = reader["apellido"].ToString();
                    usuario.direccion = reader["direccion"].ToString();
                    usuario.email = reader["email"].ToString();
                    usuario.clave = reader["clave"].ToString();
                    usuarios.Add(usuario);
                }
            }
            conexion.Close();
            return usuarios;
        }


        public void ActualizarTutor(Usuario usuario)
        {

            conexion.Open();
            string sqlStatement = "SP_TUTOR_UPDATE";
            SqlCommand comando = new SqlCommand(sqlStatement, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@id", usuario.id);
            comando.Parameters.AddWithValue("@nombre", usuario.nombre);
            comando.Parameters.AddWithValue("@apellido", usuario.apellido);
            comando.Parameters.AddWithValue("@direccion", usuario.direccion);
            comando.Parameters.AddWithValue("@email", usuario.email);
            comando.Parameters.AddWithValue("@clave", usuario.clave);
            comando.ExecuteNonQuery();
            conexion.Close();
        }




        public void RegistrarEmpleado(Usuario usuario)
        {
            conexion.Open();
            string sqlStatement = "SP_EMP_INSERT";
            SqlCommand comando = new SqlCommand(sqlStatement, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@nombre", usuario.nombre);
            comando.Parameters.AddWithValue("@apellido", usuario.apellido);
            comando.Parameters.AddWithValue("@direccion", usuario.direccion);
            comando.Parameters.AddWithValue("@email", usuario.email);
            comando.Parameters.AddWithValue("@clave", usuario.clave);
            comando.ExecuteNonQuery();
            conexion.Close();
        }


        public void EliminarEmpleado(int id)
        {
            conexion.Open();
            string sqlStatement = "SP_EMP_DELETE";
            SqlCommand comando = new SqlCommand(sqlStatement, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@id", id);
            comando.ExecuteNonQuery();
            conexion.Close();
        }


        public List<Usuario> ListarEmpleados()
        {
            List<Usuario> usuarios = null;
            string sqlStatement = "SP_EMP_LISTAR";
            SqlCommand comando = new SqlCommand(sqlStatement, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            conexion.Open();
            SqlDataReader reader = comando.ExecuteReader();
            if (reader.HasRows)
            {
                usuarios = new List<Usuario>();
                while (reader.Read())
                {
                    Usuario usuario = new Usuario();
                    usuario.id = int.Parse(reader["id"].ToString());
                    usuario.nombre = reader["nombre"].ToString();
                    usuario.apellido = reader["apellido"].ToString();
                    usuario.direccion = reader["direccion"].ToString();
                    usuario.email = reader["email"].ToString();
                    usuario.clave = reader["clave"].ToString();
                    usuarios.Add(usuario);
                }
            }
            conexion.Close();
            return usuarios;
        }


        public void ActualizarEmpleado(Usuario usuario)
        {

            conexion.Open();
            string sqlStatement = "SP_EMP_UPDATE";
            SqlCommand comando = new SqlCommand(sqlStatement, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@id", usuario.id);
            comando.Parameters.AddWithValue("@nombre", usuario.nombre);
            comando.Parameters.AddWithValue("@apellido", usuario.apellido);
            comando.Parameters.AddWithValue("@direccion", usuario.direccion);
            comando.Parameters.AddWithValue("@email", usuario.email);
            comando.Parameters.AddWithValue("@clave", usuario.clave);
            comando.ExecuteNonQuery();
            conexion.Close();
        }


        public List<TutorViewModel> ObtenerTutorxId()
        {
            List<TutorViewModel> tutores = null;
            string sqlStatement = "SP_OBTENERTUTORXID";
            SqlCommand comando = new SqlCommand(sqlStatement, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            conexion.Open();
            SqlDataReader reader = comando.ExecuteReader();
            if (reader.HasRows)
            {
                tutores = new List<TutorViewModel>();
                while (reader.Read())
                {
                    TutorViewModel tutor = new TutorViewModel();
                    tutor.id = int.Parse(reader["id"].ToString());
                    tutor.nombre = reader["nombre"].ToString();
                    tutor.apellido = reader["apellido"].ToString();
                    tutor.direccion = reader["direccion"].ToString();
                    tutor.email = reader["email"].ToString();
                    tutor.clave = reader["clave"].ToString();
                    tutor.curriculum = reader["curriculum"].ToString();
                    tutor.antecedentes = reader["antecedentes"].ToString();
                    tutor.recibo = reader["recibo"].ToString();
                    tutor.foto = reader["foto"].ToString();
                    tutores.Add(tutor);
                }
            }
            conexion.Close();
            return tutores;
        }




        public List<Usuario> ListarAlumnos()
        {
            List<Usuario> usuarios = null;
            string sqlStatement = "SP_ALUMNO_LISTAR";
            SqlCommand comando = new SqlCommand(sqlStatement, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            conexion.Open();
            SqlDataReader reader = comando.ExecuteReader();
            if (reader.HasRows)
            {
                usuarios = new List<Usuario>();
                while (reader.Read())
                {
                    Usuario usuario = new Usuario();
                    usuario.id = int.Parse(reader["id"].ToString());
                    usuario.nombre = reader["nombre"].ToString();
                    usuario.apellido = reader["apellido"].ToString();
                    usuario.direccion = reader["direccion"].ToString();
                    usuario.email = reader["email"].ToString();
                    usuario.clave = reader["clave"].ToString();
                    usuarios.Add(usuario);
                }
            }
            conexion.Close();
            return usuarios;
        }

        public void RegistrarAlumnos(Usuario usuario)
        {
            conexion.Open();
            string sqlStatement = "SP_ALUMNO_INSERT";
            SqlCommand comando = new SqlCommand(sqlStatement, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@nombre", usuario.nombre);
            comando.Parameters.AddWithValue("@apellido", usuario.apellido);
            comando.Parameters.AddWithValue("@direccion", usuario.direccion);
            comando.Parameters.AddWithValue("@email", usuario.email);
            comando.Parameters.AddWithValue("@clave", usuario.clave);
            comando.ExecuteNonQuery();
            conexion.Close();
        }

        public void EliminarAlumnos(int id)
        {
            conexion.Open();
            string sqlStatement = "SP_ALUMNO_DELETE";
            SqlCommand comando = new SqlCommand(sqlStatement, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@id", id);
            comando.ExecuteNonQuery();
            conexion.Close();
        }



        public void ActualizarAlumnos(Usuario usuario)
        {

            conexion.Open();
            string sqlStatement = "SP_ALUMNO_UPDATE";
            SqlCommand comando = new SqlCommand(sqlStatement, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@id", usuario.id);
            comando.Parameters.AddWithValue("@nombre", usuario.nombre);
            comando.Parameters.AddWithValue("@apellido", usuario.apellido);
            comando.Parameters.AddWithValue("@direccion", usuario.direccion);
            comando.Parameters.AddWithValue("@email", usuario.email);
            comando.Parameters.AddWithValue("@clave", usuario.clave);
            comando.ExecuteNonQuery();
            conexion.Close();
        }





        public List<AlumnoViewModel> ObtenerTutorxId()
        {
            List<TutorViewModel> tutores = null;
            string sqlStatement = "SP_OBTENERTUTORXID";
            SqlCommand comando = new SqlCommand(sqlStatement, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            conexion.Open();
            SqlDataReader reader = comando.ExecuteReader();
            if (reader.HasRows)
            {
                tutores = new List<TutorViewModel>();
                while (reader.Read())
                {
                    TutorViewModel tutor = new TutorViewModel();
                    tutor.id = int.Parse(reader["id"].ToString());
                    tutor.nombre = reader["nombre"].ToString();
                    tutor.apellido = reader["apellido"].ToString();
                    tutor.direccion = reader["direccion"].ToString();
                    tutor.email = reader["email"].ToString();
                    tutor.clave = reader["clave"].ToString();
                    tutor.curriculum = reader["curriculum"].ToString();
                    tutor.antecedentes = reader["antecedentes"].ToString();
                    tutor.recibo = reader["recibo"].ToString();
                    tutor.foto = reader["foto"].ToString();
                    tutores.Add(tutor);
                }
            }
            conexion.Close();
            return tutores;
        }






    }

}
