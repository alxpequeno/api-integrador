﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using api_integrador.negocios;
using api_integrador.modelos;
using api_integrador.datos.response;

namespace api_integrador.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class TutoriaController : ApiController
    {
        private TutoriaNegocios negocios;

        public TutoriaController()
        {
            negocios = new TutoriaNegocios();
        }



        [HttpPost, HttpOptions]
        public string RegistrarTutoria(Tutoria tutoria)
        {
            string mensaje = "";
            mensaje = negocios.RegistrarTutorias(tutoria);
            return mensaje;
        }

        [HttpPost, HttpOptions]
        public string EliminarTutoria(Tutoria tutoria)
        {
            string mensaje = "";
            mensaje = negocios.EliminarTutoria(tutoria.idTutoria,tutoria.idTutor);
            return mensaje;
        }

        [HttpPost, HttpOptions]
        public string ActualizarTutoria(Tutoria tutoria)
        {
            string mensaje = "";
            mensaje = negocios.ActualizarTutoria(tutoria);
            return mensaje;
        }



       [HttpPost, HttpOptions]
        public List<Tutoria> ListarTutoria_alumno_tutor(Tutoria tutoria)
        {
            var listar = negocios.ListarTutoria_alumno_tutor(tutoria.idTutoria,tutoria.idTutor);
            return listar;
        }
        

        [HttpPost, HttpOptions]
        public List<TutoriasPorTutor> ListarTutoria_tutor(TutoriasPorTutor tutoria )
        {
           
            var listar = negocios.ListarTutoria_tutor(tutoria.idTutor);
            return listar;
        }

        

        [HttpPost, HttpOptions]
        public List<Tutoria> ListaTutoriaxFiltros(Tutoria tutoria)
        {
            var listar = negocios.ListaTutoriaxFiltros(tutoria.tituloTutoria, tutoria.fechaTutoria, tutoria.categoriaTutoria);
            return listar;
        }


        [HttpGet]
        public List<Tutoria> ListarTutorias()
        {
            var listar = negocios.ListarTutoria();
            return listar;
        }




    }
}