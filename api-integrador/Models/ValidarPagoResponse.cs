using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace api_integrador.Models
{
    public class ValidarPagoResponse
    {
        public bool TransaccionCompleta { get; set; }
        public string TransaccionMensaje { get; set; }
    }
}