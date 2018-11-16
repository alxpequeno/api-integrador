using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using api_integrador.modelos;

namespace api_integrador.datos
{
    public class TutorDatos
    {
        conexionbd cn = new conexionbd();

        public void RegistrarTutor(Tutor tutor) {
            SqlConnection cnx = cn.conecta();
            cnx.Open();
            string sqlStatement = "sp_registroTutor";
            SqlCommand comando = new SqlCommand(sqlStatement, cnx);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@nombreT", tutor.nombreTutor);
            comando.Parameters.AddWithValue("@apellidoT", tutor.apellidoTutor);
            comando.Parameters.AddWithValue("@direccionT", tutor.direccionTutor);
            comando.Parameters.AddWithValue("@emailT", tutor.emailTutor);
            comando.Parameters.AddWithValue("@contraseñaT", tutor.contraseñaTutor);
            comando.ExecuteNonQuery(); 
            cnx.Close();

        }


        public void EliminarTutor(string email)
        {
            SqlConnection cnx = cn.conecta();
            cnx.Open();
            string sqlStatement = "sp_eliminarTutor";
            SqlCommand comando = new SqlCommand(sqlStatement, cnx);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@email", email);
            comando.ExecuteNonQuery();
            cnx.Close();
        }


        public void ActualizarTutor(Tutor tutor)
        {
            SqlConnection cnx = cn.conecta();
            cnx.Open();
            string sqlStatement = "sp_modificarTutor";
            SqlCommand comando = new SqlCommand(sqlStatement, cnx);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idT", tutor.idTutor);
            comando.Parameters.AddWithValue("@nombreT", tutor.nombreTutor);
            comando.Parameters.AddWithValue("@apellidoT", tutor.apellidoTutor);
            comando.Parameters.AddWithValue("@direccionT", tutor.direccionTutor);
            comando.Parameters.AddWithValue("@emailT", tutor.emailTutor);
            comando.Parameters.AddWithValue("@contraseñaT", tutor.contraseñaTutor);
            comando.ExecuteNonQuery();
            cnx.Close();
        }

        public List<Tutor> ListarTutores()
        {
            SqlConnection cnx = cn.conecta();
            List<Tutor> tutores = null;
            string sqlStatement = "sp_listarTutor";
            SqlCommand comando = new SqlCommand(sqlStatement, cnx);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            cnx.Open();
            SqlDataReader reader = comando.ExecuteReader();
            if (reader.HasRows)
            {
                tutores = new List<Tutor>();
                while (reader.Read())
                {
                    Tutor tutor = new Tutor();
                    tutor.idTutor = int.Parse(reader["id_tutor"].ToString());
                    tutor.nombreTutor = reader["nombre_tutor"].ToString();
                    tutor.apellidoTutor = reader["apellido_tutor"].ToString();
                    tutor.direccionTutor = reader["direccion_tutor"].ToString();
                    tutor.emailTutor = reader["email_tutor"].ToString();
                    tutor.contraseñaTutor = reader["contraseña_tutor"].ToString();
                    tutores.Add(tutor);
                }
            }
            cnx.Close();
            return tutores;
        }


    }
}
