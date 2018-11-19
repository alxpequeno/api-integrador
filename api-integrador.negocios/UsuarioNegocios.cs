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
        UsuarioDatos datos = new UsuarioDatos();

        public string obtenerUsuario(Usuario usuario)
        {
            string mensaje = "";

            try
            {
                Usuario usuarioRegistrado = new Usuario();
                usuarioRegistrado = datos.obtenerUsuario(usuario);

                if (usuario.isAlumno) mensaje = "isAlumno";
                if (usuario.isEmpleado) mensaje = "isEmpleado";
                if (usuario.isTutor) mensaje = "isTutor";
            }
            catch(Exception ex)
            {
                mensaje = "No se encontro el usuario : " + ex.Message;
            }

            return mensaje;
        }
    }
}
