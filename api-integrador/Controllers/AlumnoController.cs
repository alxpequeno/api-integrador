using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using api_integrador.negocios;
using api_integrador.modelos;

namespace api_integrador.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class AlumnoController : ApiController
    {
        AlumnosNegocios negocios = new AlumnosNegocios();

        [HttpPost, HttpOptions]
        public string CrearAlumno(Alumno alumno)
        {
            string mensaje = "";
            mensaje = negocios.RegistrarAlumnos(alumno);
            return mensaje;
        }

        [HttpPost, HttpOptions]
        public string ActualizarAlumno(Alumno alumno)
        {
            string mensaje = "";
            mensaje = negocios.ActualizarAlumnos(alumno);
            return mensaje;
        }

        [HttpPost, HttpOptions]
        public string EliminarAlumno(Alumno alumno)
        {
            string mensaje = "";
            mensaje = negocios.EliminarAlumnos(alumno.emailAlumno);
            return mensaje;
        }
    }
}
