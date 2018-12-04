﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace api_integrador.modelos
{
    public class TarjetaInfo
    {
        public string numeroTarjeta { get; set; }
        public string titularTarjeta { get; set; }
        public bool tarjetaHabilitada { get; set; }
        public double creditoDisponible { get; set; }
    }
}
