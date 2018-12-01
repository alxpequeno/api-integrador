using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using api_integrador.modelos;

namespace api_integrador.datos
{
   public class TutoriasDatos
    {
        conexionbd cn = new conexionbd();
        SqlConnection conexion;

        public TutoriasDatos()
        {
            conexion = cn.conecta();
        }

        public void registrarTutorias(Tutoria tutoria)
        {
            

            conexion.Open();
            string query = "SP_TUTORIA_INSERT";
            SqlCommand cm = new SqlCommand(query, conexion);
            cm.CommandType = System.Data.CommandType.StoredProcedure;

            cm.Parameters.AddWithValue("@idTutor", tutoria.idTutor);
            cm.Parameters.AddWithValue("@tituloTutoria", tutoria.tituloTutoria);
            cm.Parameters.AddWithValue("@categoriaTutoria", tutoria.categoriaTutoria);
            cm.Parameters.AddWithValue("@Foto", tutoria.Foto);
            cm.Parameters.AddWithValue("@horaTutoria", tutoria.horaTutoria);
            cm.Parameters.AddWithValue("@ubicacionTutoria", tutoria.ubicacionTutoria);
            cm.Parameters.AddWithValue("@precioTutoria", tutoria.precioTutoria);
            cm.Parameters.AddWithValue("@descipcionTutoria", tutoria.descripcionTutoria);
            cm.Parameters.AddWithValue("@cantidadMaxima", tutoria.cantidadMaxima);
            cm.Parameters.AddWithValue("@fechaTutoria", tutoria.fechaTutoria);
            cm.ExecuteNonQuery();
            conexion.Close();

        }

        public void eliminarTutoria(int  idTutor, int idTutoria)
        {
           
            conexion.Open();
            string query = "SP_TUTORIA_DELETE";
            SqlCommand cm = new SqlCommand(query, conexion);
            cm.CommandType = System.Data.CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@idTutor", idTutor);
            cm.Parameters.AddWithValue("@idTutoria", idTutoria);
            cm.ExecuteNonQuery();
            conexion.Close();

        }

        public void actualizarTutoria(Tutoria tutoria)
        {
          
            conexion.Open();
            string query = "SP_TUTORIA_UPDATE";
            SqlCommand cm = new SqlCommand(query, conexion);
            cm.CommandType = System.Data.CommandType.StoredProcedure;

            cm.Parameters.AddWithValue("@idTutoria", tutoria.idTutoria);
            cm.Parameters.AddWithValue("@idTutor", tutoria.idTutor);
            cm.Parameters.AddWithValue("@tituloTutoria", tutoria.tituloTutoria);
            cm.Parameters.AddWithValue("@categoriaTutoria", tutoria.categoriaTutoria);
            cm.Parameters.AddWithValue("@Foto", tutoria.Foto);
            cm.Parameters.AddWithValue("@horaTutoria", tutoria.horaTutoria);
            cm.Parameters.AddWithValue("@ubicacionTutoria", tutoria.ubicacionTutoria);
            cm.Parameters.AddWithValue("@precioTutoria", tutoria.precioTutoria);
            cm.Parameters.AddWithValue("@descripcionTutoria", tutoria.descripcionTutoria);
            cm.Parameters.AddWithValue("@cantidadMaxima", tutoria.cantidadMaxima);
            cm.Parameters.AddWithValue("@fechaTutoria", tutoria.fechaTutoria);
            cm.ExecuteNonQuery();
            conexion.Close();
        }






        public List<Tutoria> listarTutoria_tutor_alumno(int idTutoria, int id)
        {

            List<Tutoria> tutorias = null;
            string query = "SP_LISTAR_TUTORIA_TUTOR_ALUMNO";
            SqlCommand comando = new SqlCommand(query, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idTutoria", idTutoria);
            comando.Parameters.AddWithValue("@id", id);
            conexion.Open();
            SqlDataReader reader = comando.ExecuteReader();
            if (reader.HasRows)
            {
                tutorias = new List<Tutoria>();

                while (reader.Read())
                {

                    Tutoria t = new Tutoria();
                    t.tituloTutoria = reader["tituloTutoria"].ToString();
                    t.categoriaTutoria = reader["categoriaTutoria"].ToString();
                    t.fechaTutoria = DateTime.Parse( reader["fechaTutoria"].ToString());
                    t.precioTutoria = double.Parse(reader["precioTutoria"].ToString());
                    t.horaTutoria = reader["horaTutoria"].ToString();
                    t.Foto = reader["Foto"].ToString();

                    tutorias.Add(t);


                }


            }
            conexion.Close();

            return tutorias;
        }


        public List<response.TutoriasPorTutor> listarTutoria_tutor( int id)
        {
           
            List<response.TutoriasPorTutor> tutorias = null;
            string query = "SP_LISTAR_TUTORIA_TUTOR";
            SqlCommand comando = new SqlCommand(query, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;           
            comando.Parameters.AddWithValue("@id", id);
            conexion.Open();
            SqlDataReader reader = comando.ExecuteReader();
            if (reader.HasRows)
            {
                tutorias = new List<response.TutoriasPorTutor>();

                while (reader.Read())
                {
                    response.TutoriasPorTutor t = new response.TutoriasPorTutor();
                    t.tituloTutoria = reader["tituloTutoria"].ToString();
                    t.categoriaTutoria = reader["categoriaTutoria"].ToString();
                    t.fechaTutoria =DateTime.Parse( reader["fechaTutoria"].ToString());
                    t.horaTutoria = reader["horaTutoria"].ToString();
                    t.precioTutoria = double.Parse(reader["precioTutoria"].ToString());
                    t.Foto = reader["Foto"].ToString();          
                    tutorias.Add(t);
                }
            }
            conexion.Close();
            return tutorias;
        }

        public List<Tutoria> listarTutoria_filtros(string titulo, DateTime fecha, string categoria)
        {
          
            List<Tutoria> tutorias = null;
            string query = "SP_LISTAR_TUTORIA_FILTROS";
            SqlCommand comando = new SqlCommand(query, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@titulo", titulo);
            comando.Parameters.AddWithValue("@fecha", fecha);
            comando.Parameters.AddWithValue("@categoria", categoria);
            conexion.Open();
            SqlDataReader reader = comando.ExecuteReader();
            if (reader.HasRows)
            {
                tutorias = new List<Tutoria>();

                while (reader.Read())
                {
                    Tutoria t = new Tutoria();
                    t.tituloTutoria = reader["tituloTutoria"].ToString();
                    t.categoriaTutoria = reader["categoriaTutoria"].ToString();
                    t.fechaTutoria = DateTime.Parse(reader["fechaTutoria"].ToString());
                    t.horaTutoria = reader["horaTutoria"].ToString();
                    t.precioTutoria = double.Parse(reader["horaTutoria"].ToString());
                    t.Foto = reader["Foto"].ToString();
                    tutorias.Add(t);
                }
            }
            conexion.Close();
            return tutorias;
        }



        public List<Tutoria> listarTutorias()
        {
            List<Tutoria> tutoria = null;
            string query = "SP_LISTAR_TUTORIA";
            SqlCommand comando = new SqlCommand(query, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            conexion.Open();
            SqlDataReader reader = comando.ExecuteReader();
            if (reader.HasRows)
            {
                tutoria = new List<Tutoria>();

                while (reader.Read())
                {
                    Tutoria t = new Tutoria();

                    t.idTutoria = int.Parse(reader["idTutoria"].ToString());
                    t.tituloTutoria = reader["tituloTutoria"].ToString();
                    t.categoriaTutoria = reader["categoriaTutoria"].ToString();
                    t.Foto = reader["Foto"].ToString();
                    t.fechaTutoria = DateTime.Parse(reader["fechaTutoria"].ToString());
                    t.horaTutoria = reader["horaTutoria"].ToString();
                    t.ubicacionTutoria = reader["ubicacionTutoria"].ToString();
                    t.precioTutoria = double.Parse(reader["precioTutoria"].ToString());
                    t.descripcionTutoria = reader["descripcionTutoria"].ToString();
                    t.estadoTutoria = bool.Parse(reader["estadoTutoria"].ToString());
                    //t.cantidadAlumnos = int.Parse(reader["cantidadAlumnos"].ToString());
                   // t.cantidadMaxima = int.Parse(reader["cantidadMaxima"].ToString());
                    t.idTutor = int.Parse(reader["idTutor"].ToString());
                    

                    tutoria.Add(t);
                }


            }
            conexion.Close();

            return tutoria;
        }









    }
}
