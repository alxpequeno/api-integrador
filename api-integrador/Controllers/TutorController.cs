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
    public class TutorController : ApiController
    {
        TutorNegocios negociosT = new TutorNegocios();

        [HttpGet]
        public List<Tutor> ListarTutores()
        {
            var listar = negociosT.ListarTutores();
            return listar;
        }

        [HttpPost]
        public string RegistrarTutor(Tutor tutor)
        {
            string mensaje = "";
            mensaje = negociosT.RegistrarTutor(tutor);
            return mensaje;
        }


        [HttpGet]
        public Tutor GetTutorById(int id)
        {
            var lista = negociosT.ListarTutores();
            Tutor tutor = lista.FirstOrDefault(x => x.idTutor == id);
            return tutor;
        }

        [HttpPost]
        public string ActualizarTutor(Tutor tutor)
        {
            string mensaje = "";
            mensaje = negociosT.ActualizarTrabajador(trabajador);
            return mensaje;
        }

        [HttpGet]
        public string EliminarTutor(int idTutor)
        {
            string mensaje = "";
            mensaje = negociosT.EliminarTutor(idTutor);
            return mensaje;
        }


    }
}