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


        public string RegistrarAlumnos(Alumno alumnos)
        {
            string mensaje = "";
            try
            {
                datosA.registrarAlumno(alumnos);
                mensaje = "Alumno Registrado";
            }
            catch (Exception ex)
            {
                mensaje = "No se registro el Alumno " + ex.Message;
            }
            return mensaje;
        }


        public List<Alumno> ListarAlumnos()
        {
            return datosA.listarAlumnos();
        }



        public string ActualizarAlumnos(Alumno alumnos)
        {
            string mensaje = "";
            try
            {
                
                    var existeAlumno = datosA.listarAlumnos().Any(x => x.emailAlumno == alumnos.emailAlumno);
                    if (existeAlumno)
                    {

                        datosA.actualizarAlumno(alumnos);
                        mensaje = "Alumno actualizado";
                    }
                    else
                        mensaje = "Alumno no existe";
                
            }
            catch (Exception ex)
            {
                mensaje = "No se creo el Alumno " + ex.Message;
            }
            return mensaje;
        }


        public string EliminarAlumnos(string email)
        {
            string mensaje = "";
            try
            {
                
                
                    var existeAlumno = datosA.listarAlumnos().Any(x => x.emailAlumno == email);
                    if (existeAlumno)
                    {
                        datosA.eliminarAlumno(email);
                        mensaje = "Alumno eliminado";
                    }
                    else
                        mensaje = "Alumno no existe";
                
            }
            catch (Exception ex)
            {
                mensaje = "No se pudo eliminar el Alumno : " + ex.Message;
            }

            return mensaje;
        }







    }


    }

