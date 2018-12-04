using api_integrador.modelos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace api_integrador.datos
{
    public class TarjetaDatos
    {
        conexionbd cn = new conexionbd();
        SqlConnection conexion;


        public TarjetaDatos()
        {
            conexion = cn.conecta();
        }


        public TarjetaInfo ObtenerInformacionTarjeta(int tipoTarjeta,
                                string numeroTarjeta,
                                string titularTarjeta,
                                string mesExpiracion,
                                string añoExpiracion,
                                string codigoSeguridad)
        {
            TarjetaInfo tarjetaInfo = null;
            string query = "SP_TARJETAINFO";
            SqlCommand comando = new SqlCommand(query, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idTipoTarjeta", tipoTarjeta);
            comando.Parameters.AddWithValue("@numeroTarjeta", numeroTarjeta);
            comando.Parameters.AddWithValue("@nombreTarjeta", titularTarjeta);
            comando.Parameters.AddWithValue("@securityCodeTarjeta", codigoSeguridad);
            comando.Parameters.AddWithValue("@mesExpiracionTarjeta", mesExpiracion);
            comando.Parameters.AddWithValue("@añoExpiracionTarjeta", añoExpiracion);
            conexion.Open();
            SqlDataReader reader = comando.ExecuteReader();
            if (reader.HasRows)
            {
                tarjetaInfo = new TarjetaInfo();
                while (reader.Read())
                {
                    tarjetaInfo.titularTarjeta = reader["nombreTarjeta"].ToString();
                    tarjetaInfo.numeroTarjeta = reader["numeroTarjeta"].ToString();
                    tarjetaInfo.tarjetaHabilitada = bool.Parse(reader["tarjetaHabilitada"].ToString());
                    tarjetaInfo.creditoDisponible = double.Parse(reader["creditoDisponible"].ToString());
                }
            }
            conexion.Close();
            return tarjetaInfo;
        }


    }
}
