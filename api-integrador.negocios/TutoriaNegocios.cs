﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using api_integrador.datos;
using api_integrador.datos.response;
using api_integrador.modelos;



namespace api_integrador.negocios
{
   public class TutoriaNegocios
    {
        private TutoriasDatos datos;

        public TutoriaNegocios()
        {
            datos = new TutoriasDatos();
        }

        public string RegistrarTutorias( Tutoria tutoria)
        {
            string mensaje = "";
            try
            {
                datos.registrarTutorias(tutoria);
                mensaje = "Tutoria Registrada";
            }
            catch (Exception ex)
            {
                mensaje = "No se registro la tutoria " + ex.Message;
            }
            return mensaje;


        }
        public string ActualizarTutoria(Tutoria tutoria)
        {
            string mensaje = "";
            try
            {


                var existeTutoria = datos.listarTutorias().Any(x => x.idTutoria == tutoria.idTutoria);
                if (existeTutoria)
                {

                    datos.actualizarTutoria(tutoria);
                    mensaje = "Tutoria actualizada";
                }
                else
                    mensaje = "Tutoria no existe";

            }
            catch (Exception ex)
            {
                mensaje = "No se actualizo la tutoria " + ex.Message;
            }
            return mensaje;
        }


        public string EliminarTutoria(int idTutor, int idTutoria)
        {
            string mensaje = "";
            try
            {
                var existeTutoria = datos.listarTutorias().Any(x => x.idTutoria == idTutoria);
                if (existeTutoria)
                {
                    datos.eliminarTutoria(idTutor, idTutoria);
                    mensaje = "Tutoria eliminada";
                }
                else
                    mensaje = "Tutoria no existe";

            }
            catch (Exception ex)
            {
                mensaje = "No se pudo eliminar la Tutoria : " + ex.Message;
            }

            return mensaje;
        }

        public List<Tutoria> ListarTutoria_alumno_tutor(int idTutoria, int id)
        {
            return datos.listarTutoria_tutor_alumno(idTutoria, id);
        }


        public List<TutoriasPorTutor> ListarTutoria_tutor(int id)
        {
            return datos.listarTutoria_tutor(id);

                             
                }


        public List<Tutoria> ListaTutoriaxFiltros(string titulo, string fecha, string categoria)
        {
            return datos.ListaTutoriaxFiltros(titulo, fecha, categoria);
        }

        public List<TutoriaViewModel> ListaTutoriaxFiltros2(string titulo, string fecha, string categoria)
        {
            return datos.ListaTutoriaxFiltros2(titulo, fecha, categoria);
        }

        public List<TutoriaViewModel> ListaTutoriasxAlumno(int idAlumno)
        {
            return datos.TutoriasAlumno(idAlumno);
        }

        public List<TutoriaViewModel> ListaTutoriasxTutor(int idTutor)
        {
            return datos.TutoriasTutor(idTutor);
        }


        public List<Tutoria> ListarTutoria()
        {
            return datos.listarTutorias();


        }


        public List<Reporte> ReporteTutorias()
        {
            return datos.ReporteTutorias();


        }


        public string matriculaTutoria(MatriculaViewModel matricula)
        {
            string mensaje = "";
            try
            {
                datos.matriculaTutoria(matricula);
                mensaje = "Alumno matriculado";
            }
            catch (Exception ex)
            {
                mensaje = "No se pudo matricular a el alumno " + ex.Message;
            }
            return mensaje;


        }


        public string validarAlumnoTutoria(int? idTutoria,int? idAlumno)
        {
            string mensaje = "";
            var existeMatricula = datos.listarMatricula().Any(x => x.idAlumno == idAlumno && x.idTutoria==idTutoria);
            if (existeMatricula)
            {
                mensaje = "Alumno ya se encuentra matriculado";
            }

            return mensaje;

        }


        public string CulminarTutoria(int idTutor)
        {
            string mensaje = "";
            try
            {

                datos.CulminarTutoria(idTutor);
                    mensaje = "Tutoria eliminada";
             

            }
            catch (Exception ex)
            {
                mensaje = "No se pudo eliminar tutoria : " + ex.Message;
            }

            return mensaje;
        }





    }
}
