using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using api_integrador.negocios;
using api_integrador.modelos;


namespace api_integrador.Controllers
{

    public class AlumnosController : ApiController
    {

        AlumnosNegocios negociosA = new AlumnosNegocios();

        [HttpGet]
        public List<Alumnos> ListarAlumnos()
        {
            var listar = negociosA.ListarAlumnos();
            return listar;
        }



        [HttpPost]
        public string RegistrarAlumnos(Alumnos alumnos)
        {
            string mensaje = "";
            mensaje = negociosA.RegistrarAlumnos(alumnos);
            return mensaje;
        }


        

        [HttpPost]
        public string ActualizarAlumnos(Alumnos alumnos)
        {
            string mensaje = "";
            mensaje = negociosA.ActualizarAlumnos(alumnos);
            return mensaje;
        }

        [HttpPost]
        public string EliminarTutor(Alumnos alumnos)
        {
            string mensaje = "";
            mensaje = negociosA.EliminarAlumnos(alumnos.idAlumno);
            return mensaje;
        }



    }
}
