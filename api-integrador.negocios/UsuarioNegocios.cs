using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using api_integrador.datos;
using api_integrador.modelos;

namespace api_integrador.negocios
{
    public class UsuarioNegocios
    {
        private UsuarioDatos datos;

        public UsuarioNegocios()
        {
            datos = new UsuarioDatos();
        }

        public Usuario Login(string email, string clave)
        {
            return datos.Login(email,clave);
        }

        public List<Usuario> ListaTutoresPendientes()
        {
            return datos.ListaTutoresPendientes();
        }

        public string RegistrarTutor(Usuario usuario)
        {
            string mensaje = "";
            try
            {
                datos.RegistrarTutor(usuario);
                mensaje = "Tutor Registrado";
            }
            catch (Exception ex)
            {
                mensaje = "No se registro el tutor " + ex.Message;
            }
            return mensaje;
        }


        public List<Usuario> ListarTutores()
        {
            return datos.ListarTutores();
        }


        public string ActualizarTutor(Usuario usuario)
        {
            string mensaje = "";
            try
            {


                var existeTutor = datos.ListarTutores().Any(x => x.id == usuario.id);
                if (existeTutor)
                {

                    datos.ActualizarTutor(usuario);
                    mensaje = "Tutor actualizado";
                }
                else
                    mensaje = "Tutor no existe";

            }
            catch (Exception ex)
            {
                mensaje = "No se actualizo el tutor " + ex.Message;
            }
            return mensaje;
        }



        public string EliminarTutor(int id)
        {
            string mensaje = "";
            try
            {


                var existeTutor = datos.ListarTutores().Any(x => x.id == id);
                if (existeTutor)
                {
                    datos.EliminarTutor(id);
                    mensaje = "Tutor eliminado";
                }
                else
                    mensaje = "Tutor no existe";

            }
            catch (Exception ex)
            {
                mensaje = "No se pudo eliminar el tutor : " + ex.Message;
            }

            return mensaje;
        }








        public string RegistrarEmpleado(Usuario usuario)
        {
            string mensaje = "";
            try
            {
                datos.RegistrarEmpleado(usuario);
                mensaje = "Empleado Registrado";
            }
            catch (Exception ex)
            {
                mensaje = "No se registro el empleado " + ex.Message;
            }
            return mensaje;
        }


        public List<Usuario> ListarEmpleados()
        {
            return datos.ListarEmpleados();
        }


        public string ActualizarEmpleado(Usuario usuario)
        {
            string mensaje = "";
            try
            {


                var existeEmpleado = datos.ListarEmpleados().Any(x => x.id == usuario.id);
                if (existeEmpleado)
                {

                    datos.ActualizarEmpleado(usuario);
                    mensaje = "Empleado actualizado";
                }
                else
                    mensaje = "Empleado no existe";

            }
            catch (Exception ex)
            {
                mensaje = "No se actualizo el empleado " + ex.Message;
            }
            return mensaje;
        }



        public string EliminarEmpleado(int id)
        {
            string mensaje = "";
            try
            {


                var existeEmpleado = datos.ListarEmpleados().Any(x => x.id == id);
                if (existeEmpleado)
                {
                    datos.EliminarEmpleado(id);
                    mensaje = "Empleado eliminado";
                }
                else
                    mensaje = "Empleado";

            }
            catch (Exception ex)
            {
                mensaje = "No se pudo eliminar el empleado : " + ex.Message;
            }

            return mensaje;
        }
    }
}
