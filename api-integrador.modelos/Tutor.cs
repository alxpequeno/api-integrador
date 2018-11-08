using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace api_integrador.modelos
{
    public class Tutor
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string direccion { get; set; }
        public string apellido { get; set; }
        public string email { get; set; }
        public string contraseña { get; set; }
    }
}
