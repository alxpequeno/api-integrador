using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using api_integrador.datos;
using api_integrador.modelos;

namespace api_integrador.negocios
{
    public class EmpleadoNegocios
    {
        EmpleadoDatos datos = new EmpleadoDatos();

        public string CrearEmpleado(Empleado empleado)
        {
            string mensaje = "";

            try
            {

                datos.CrearEmpleado(empleado);
                mensaje = "Empleado Creado";
            } catch(Exception ex)
            {
                mensaje = "No se creó el empleado : " + ex.Message;
            }

            return mensaje;
        }
    }
}
