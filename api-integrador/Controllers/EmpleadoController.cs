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
    public class EmpleadoController : ApiController
    {

        EmpleadoNegocios negocios = new EmpleadoNegocios();

        [HttpPost]
        public string CrearEmpleado(Empleado empleado)
        {
            string mensaje = "";
            mensaje = negocios.CrearEmpleado(empleado);
            return mensaje;
        }
    }
}
