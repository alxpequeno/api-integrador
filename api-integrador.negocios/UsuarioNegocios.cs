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
    }
}
