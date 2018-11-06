using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using api_integrador.modelos;

namespace api_integrador.datos
{
    public class EmpleadoDatos
    {
        string cadenaConexion = "server=DESKTOP-96PHRE7;database=BDINTEGRADOR;Integrated Security=true";
        SqlConnection conexion;

        public EmpleadoDatos()
        {
            conexion = new SqlConnection(cadenaConexion);
        }

        public void CrearEmpleado(Empleado empleado)
        {
            conexion.Open();

            string sqlStatement = "SP_EMPLEADO_INSERT";
            SqlCommand comando = new SqlCommand(sqlStatement, conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@nombre", empleado.nombre);
            comando.Parameters.AddWithValue("@apellido", empleado.apellido);
            comando.Parameters.AddWithValue("@direccion", empleado.direccion);
            comando.Parameters.AddWithValue("@email", empleado.email);
            comando.Parameters.AddWithValue("@clave", empleado.clave);

            comando.ExecuteNonQuery();

            conexion.Close();
        }
    }
}
