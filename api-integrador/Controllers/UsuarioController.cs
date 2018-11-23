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
    public class UsuarioController : ApiController
    {
        private UsuarioNegocios negocios;

        public UsuarioController() 
        {
            negocios = new UsuarioNegocios();
        }

        [HttpGet]
        public List<Usuario> ListaTutoresPendientes() 
        {
            return negocios.ListaTutoresPendientes();
        }

        [HttpPost, HttpOptions]
        public Usuario Login(UsuarioViewModel modelo) {
            Usuario usuario = negocios.Login(modelo.email, modelo.clave);

            return usuario;
        }

        [HttpPost, HttpOptions]
        public string RegistrarTutor(Usuario usuario)
        {
            string mensaje = "";
            mensaje = negocios.RegistrarTutor(usuario);
            return mensaje;
        }

        [HttpPost, HttpOptions]
        public string EliminarTutor(Usuario usuario)
        {
            string mensaje = "";
            mensaje = negocios.EliminarTutor(usuario.id);
            return mensaje;
        }

        [HttpPost, HttpOptions]
        public string ActualizarTutor(Usuario usuario)
        {
            string mensaje = "";
            mensaje = negocios.ActualizarTutor(usuario);
            return mensaje;
        }

        [HttpGet]
        public List<Usuario> ListarTutores()
        {
            var listar = negocios.ListarTutores();
            return listar;
        }






        [HttpPost, HttpOptions]
        public string RegistrarEmpleado(Usuario usuario)
        {
            string mensaje = "";
            mensaje = negocios.RegistrarEmpleado(usuario);
            return mensaje;
        }

        [HttpPost, HttpOptions]
        public string EliminarEmpleado(Usuario usuario)
        {
            string mensaje = "";
            mensaje = negocios.EliminarEmpleado(usuario.id);
            return mensaje;
        }

        [HttpPost, HttpOptions]
        public string ActualizarEmpleado(Usuario usuario)
        {
            string mensaje = "";
            mensaje = negocios.ActualizarEmpleado(usuario);
            return mensaje;
        }

        [HttpGet]
        public List<Usuario> ListarEmpleados()
        {
            var listar = negocios.ListarEmpleados();
            return listar;
        }

    }
}
