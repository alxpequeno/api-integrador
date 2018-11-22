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
    }
}
