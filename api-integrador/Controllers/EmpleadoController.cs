﻿using System;
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
    public class EmpleadoController : ApiController
    {

        EmpleadoNegocios negocios = new EmpleadoNegocios();

        [HttpPost,HttpOptions]
        public string CrearEmpleado(Empleado empleado)
        {
            string mensaje = "";
            mensaje = negocios.CrearEmpleado(empleado);
            return mensaje;
        }

        [HttpPost, HttpOptions]
        public string ActualizarEmpleado(Empleado empleado)
        {
            string mensaje = "";
            mensaje = negocios.ActualizarEmpleado(empleado);
            return mensaje;
        }

        [HttpPost, HttpOptions]
        public string EliminarEmpleado(Empleado empleado)
        {
            string mensaje = "";
            mensaje = negocios.EliminarEmpleado(empleado.email);
            return mensaje;
        }

    }
}
