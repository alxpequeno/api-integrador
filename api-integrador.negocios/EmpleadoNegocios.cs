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

        public string ActualizarEmpleado(Empleado empleado)
        {
            string mensaje = "";
            try
            {
                
               
                
                    var existeEmpleado = datos.ListarEmpleados().Any(x => x.email == empleado.email);
                    if (existeEmpleado)
                    {

                        datos.ActualizarEmpleado(empleado);
                        mensaje = "Empleado actualizado";
                    }
                    else
                        mensaje = "Empleado no existe";
                
            }
            catch (Exception ex)
            {
                mensaje = "No se actualizo el empleado: " + ex.Message;
            }
            return mensaje;
        }

        public List<Empleado> ListarEmpleados()
        {
            return datos.ListarEmpleados();
        }

        public string EliminarEmpleado(string email)
        {
            string mensaje = "";
            try
            {
               
               
                    var existeEmpleado = datos.ListarEmpleados().Any(x => x.email == email);
                    if (existeEmpleado)
                    {
                        datos.EliminarEmpleado(email);
                        mensaje = "Empleado eliminado";
                    }
                    else
                        mensaje = "Empleado no existe";
                
            }
            catch (Exception ex)
            {
                mensaje = "No se pudo eliminar el empleado : " + ex.Message;
            }

            return mensaje;
        }

    }


}
