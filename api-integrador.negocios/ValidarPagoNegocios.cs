using api_integrador.datos;
using api_integrador.modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace api_integrador.negocios
{
    public class ValidarPagoNegocios
    {
        TarjetaDatos tarjetaDatos = new TarjetaDatos();
        public bool ValidarPago(out string mensaje,
                               int tipoTarjeta,
                               string numeroTarjeta,
                               string titularTarjeta,
                               double montoConsumir,
                               string mesExpiracion,
                               string añoExpiracion,
                               string codigoSeguridad
                               )
        {
            bool ValidacionCorrecta = false;
            mensaje = "";
            TarjetaInfo tarjetaInfo = tarjetaDatos.ObtenerInformacionTarjeta(tipoTarjeta, numeroTarjeta, titularTarjeta,
                                                    mesExpiracion, añoExpiracion, codigoSeguridad);
            
            if (tarjetaInfo == null)
            {
                mensaje = "Tarjeta no Existe";
            }
            else
            {
                if (!tarjetaInfo.tarjetaHabilitada)
                {
                    mensaje = "Tarjeta No Habilitada";
                }
                else
                {
                    if (tarjetaInfo.creditoDisponible < montoConsumir)
                    {
                        mensaje = "Linea de credito insuficiente";
                    }
                    else
                    {
                        ValidacionCorrecta = true;
                    }
                }
            }
            return ValidacionCorrecta;
        }


    }
}
