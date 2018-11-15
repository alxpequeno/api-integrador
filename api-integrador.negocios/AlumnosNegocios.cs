using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using api_integrador.datos;
using api_integrador.modelos;

namespace api_integrador.negocios
{
    public class AlumnosNegocios
    {

        AlumnosDatos datosA = new AlumnosDatos();


        public string RegistrarAlumnos(Alumnos alumnos)
        {
            string mensaje = "";
            try
            {
                datosA.RegistrarAlumnos(alumnos);
                mensaje = "Alumno Registrado";
            }
            catch (Exception ex)
            {
                mensaje = "No se registro el Alumno " + ex.Message;
            }
            return mensaje;
        }


        public List<Alumnos> ListarAlumnos()
        {
            return datosA.ListarAlumnos();
        }



        public string ActualizarAlumnos(Alumnos alumnos)
        {
            string mensaje = "";
            try
            {
                if (alumnos.idAlumno == 0)
                {
                    mensaje = "Id invalida";
                }
                else
                {
                    var existeAlumno = datosA.ListarAlumnos().Any(x => x.idAlumno == alumnos.idAlumno);
                    if (existeAlumno)
                    {

                        datosA.ActualizarAlumnos(alumnos);
                        mensaje = "Alumno actualizado";
                    }
                    else
                        mensaje = "Alumno no existe";
                }
            }
            catch (Exception ex)
            {
                mensaje = "No se creo el Alumno " + ex.Message;
            }
            return mensaje;
        }


        public string EliminarAlumnos(int idAlumno)
        {
            string mensaje = "";
            try
            {
                if (idAlumno == 0)
                {
                    mensaje = "Id invalida";
                }
                else
                {
                    var existeAlumno = datosA.ListarAlumnos().Any(x => x.idAlumno == idAlumno);
                    if (existeAlumno)
                    {
                        datosA.EliminarAlumnos(idAlumno);
                        mensaje = "Alumno eliminado";
                    }
                    else
                        mensaje = "Alumno no existe";
                }
            }
            catch (Exception ex)
            {
                mensaje = "No se pudo eliminar el Alumno : " + ex.Message;
            }

            return mensaje;
        }







    }


    }

