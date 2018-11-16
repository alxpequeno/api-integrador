using api_integrador.modelos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace api_integrador.datos
{
    public class AlumnosDatos
    {
        conexionbd cn = new conexionbd();


        public List<Alumno> listarAlumnos()
        {
            SqlConnection cnx = cn.conecta();

            List<Alumno> alumnos = null;
            string query = "SP_LISTAR_ALUMNOS";
            SqlCommand comando = new SqlCommand(query, cnx);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            cnx.Open();
            SqlDataReader reader = comando.ExecuteReader();
            if (reader.HasRows)
            {
                alumnos = new List<Alumno>();

                while (reader.Read())
                {

                    Alumno a = new Alumno();
                    a.idAlumno = int.Parse(reader["idAlumno"].ToString());
                    a.nombreAlumno = reader["nombreAlumno"].ToString();
                    a.apellidoAlumno = reader["apellidoAlumno"].ToString();
                    a.emailAlumno = reader["emailAlumno"].ToString();

                    alumnos.Add(a);


                }


            }
            cnx.Close();

            return alumnos;
        }





        public void registrarAlumno(Alumno alumnos)
        {

            SqlConnection cnx = cn.conecta();
            cnx.Open();
            string query = "SP_REGISTRAR_ALUMNOS";
            SqlCommand cm = new SqlCommand(query, cnx);
            cm.CommandType = System.Data.CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@nombreA", alumnos.nombreAlumno);
            cm.Parameters.AddWithValue("@apellidoA", alumnos.apellidoAlumno);
            cm.Parameters.AddWithValue("@emailA", alumnos.emailAlumno);
            cm.Parameters.AddWithValue("@contraseñaA ", alumnos.contraseñaAlumno);
            cm.ExecuteNonQuery();
            cnx.Close();

        }

        public void eliminarAlumno(string email)
        {

            SqlConnection cnx = cn.conecta();
            cnx.Open();
            string query = "SP_ELIMINAR_ALUMNO";
            SqlCommand cm = new SqlCommand(query, cnx);
            cm.CommandType = System.Data.CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@email", email);
            cm.ExecuteNonQuery();
            cnx.Close();

        }

        public void actualizarAlumno(Alumno alumnos)
        {

            SqlConnection cnx = cn.conecta();
            cnx.Open();
            string query = "SP_MODIFICAR_ALUMNO";
            SqlCommand cm = new SqlCommand(query, cnx);
            cm.CommandType = System.Data.CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@nombreA", alumnos.nombreAlumno);
            cm.Parameters.AddWithValue("@apellidoA", alumnos.apellidoAlumno);
            cm.Parameters.AddWithValue("@emailA", alumnos.emailAlumno);
            cm.Parameters.AddWithValue("@contraseñaA", alumnos.contraseñaAlumno);

            cm.ExecuteNonQuery();
            cnx.Close();
        }



    }
}
