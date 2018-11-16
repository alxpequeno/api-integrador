using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using api_integrador.negocios;
using api_integrador.modelos;
using System.Web.Http.Cors;

namespace api_integrador.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class TutorController : ApiController
    {
        TutorNegocios negociosT = new TutorNegocios();

        [HttpGet]
        public List<Tutor> ListarTutores()
        {
            var listar = negociosT.ListarTutores();
            return listar;
        }

        [HttpPost,HttpOptions]
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

        [HttpPost, HttpOptions]
        public string ActualizarTutor(Tutor tutor)
        {
            string mensaje = "";
            mensaje = negociosT.ActualizarTutor(tutor);
            return mensaje;
        }

        [HttpPost,HttpOptions]
        public string EliminarTutor(Tutor tutor)
        {
            string mensaje = "";
            mensaje = negociosT.EliminarTutor(tutor.emailTutor);
            return mensaje;
        }


    }
}