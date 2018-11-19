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
        UsuarioNegocios negocios = new UsuarioNegocios();

        [HttpPost, HttpOptions]
        public string login(Usuario usuario)
        {
            string mensaje = "";
            mensaje = negocios.obtenerUsuario(usuario);
            return mensaje;
        }
    }
}
