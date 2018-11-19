using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace api_integrador.modelos
{
    public class Usuario
    {
        public string email { get; set; }
        public string clave { get; set; }
        public bool isEmpleado { get; set; }
        public bool isAlumno { get; set; }
        public bool isTutor { get; set; }
    }
}
