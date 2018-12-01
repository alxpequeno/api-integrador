using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace api_integrador.datos.response
{
    public class TutoriasPorTutor
    {
        public int idTutor { get; set; }
        public string tituloTutoria { get; set; }
        public string categoriaTutoria { get; set; }
        public DateTime fechaTutoria { get; set; }
        public string horaTutoria { get; set; }
        public double precioTutoria { get; set; }
        public string Foto { get; set; }
        public string cantidadAlumnos { get; set; }
    }
}
