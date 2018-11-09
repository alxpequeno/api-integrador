using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using api_integrador.modelos;

namespace api_integrador.datos
{
    public class AlumnosDatos
    {
        conexionbd cn = new conexionbd();


        public List<Alumnos> listarAlumnos(){
            SqlConnection cnx = cn.conecta();

            List<Alumnos> alumnos = null;
           string query = "";
            SqlCommand comando = new SqlCommand(query, cnx);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            cnx.Open();
            SqlDataReader reader = comando.ExecuteReader();
            if (reader.HasRows)
            {
                alumnos = new List<Alumnos>();

                while (reader.Read()) {

                    Alumnos a = new Alumnos();
                    a.idAlumno = int.Parse(reader["idAlumno"].ToString());
                    a.nombreAlumno = reader["nombreAlumno"].ToString();
                    a.apellidoAlumno = reader["apellidoAlumno"].ToString();
                    a.emailAlumno = reader["emailAlumno  "].ToString();

                    alumnos.Add(a);


                }


            }
            cnx.Close();

                return alumnos;
        }




        public void registrarAlumno(Alumnos alumnos)
        {

            SqlConnection cnx = cn.conecta();
            cnx.Open();
            string query = "";
            SqlCommand cm = new SqlCommand(query, cnx);
            cm.CommandType = System.Data.CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@nombreA", alumnos.nombreAlumno);
            cm.Parameters.AddWithValue("@apellidoA", alumnos.apellidoAlumno);
            cm.Parameters.AddWithValue("@emailA", alumnos.emailAlumno);
            cm.Parameters.AddWithValue("@contraseñaA ", alumnos.contraseñaAlumno);
            cm.ExecuteNonQuery();
            cnx.Close();

        }

        public void eliminarAlumno(int idAlumno)
        {

            SqlConnection cnx = cn.conecta();
            cnx.Open();
            string query = "";
            SqlCommand cm = new SqlCommand(query, cnx);
            cm.CommandType = System.Data.CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@idA", idAlumno);
            cm.ExecuteNonQuery();
            cnx.Close();

        }

        public void actualizarAlumno(Alumnos alumnos)
        {

            SqlConnection cnx = cn.conecta();
            cnx.Open();
            string query = "";
            SqlCommand cm = new SqlCommand(query, cnx);
            cm.CommandType = System.Data.CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@idA", alumnos.idAlumno);
            cm.Parameters.AddWithValue("@nombreA", alumnos.nombreAlumno);
            cm.Parameters.AddWithValue("@apellidoA", alumnos.apellidoAlumno);
            cm.Parameters.AddWithValue("@emailA", alumnos.emailAlumno);
            cm.Parameters.AddWithValue("@contraseñaA", alumnos.contraseñaAlumno);
        }


     
}

}

