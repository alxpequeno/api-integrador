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
        
        conexionbd cn = new conexionbd();

        public void ActualizarEmpleado(Empleado empleado)
        {
            SqlConnection cnx = cn.conecta();
            cnx.Open();
            string sqlStatement = "SP_EMPLEADO_UPDATE";
            SqlCommand comando = new SqlCommand(sqlStatement, cnx);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@nombre", empleado.nombre);
            comando.Parameters.AddWithValue("@apellido", empleado.apellido);
            comando.Parameters.AddWithValue("@direccion",empleado.direccion);
            comando.Parameters.AddWithValue("@email", empleado.email);
            comando.Parameters.AddWithValue("@clave", empleado.clave);
            comando.ExecuteNonQuery();
            cnx.Close();
        }

        public List<Empleado> ListarEmpleados()
        {
            SqlConnection cnx = cn.conecta();
            List<Empleado> empleados = null;
            string sqlStatement = "SP_EMPLEADO_LIST";
            SqlCommand comando = new SqlCommand(sqlStatement, cnx);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            cnx.Open();
            SqlDataReader reader = comando.ExecuteReader();
            if (reader.HasRows)
            {
                empleados = new List<Empleado>();
                while (reader.Read())
                {
                    Empleado empleado = new Empleado();
                    empleado.id = int.Parse(reader["Id"].ToString());
                    empleado.nombre = reader["Nombre"].ToString();
                    empleado.direccion = reader["Direccion"].ToString();
                    empleado.apellido = reader["Apellido"].ToString();
                    empleado.email = reader["Email"].ToString();
                    empleado.clave = reader["Clave"].ToString();
                    empleados.Add(empleado);
                }
            }
            cnx.Close();
            return empleados;
        }

        public void CrearEmpleado(Empleado empleado)
        {
            SqlConnection cnx = cn.conecta();
            cnx.Open();

            string sqlStatement = "SP_EMPLEADO_INSERT";
            SqlCommand comando = new SqlCommand(sqlStatement, cnx);
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@nombre", empleado.nombre);
            comando.Parameters.AddWithValue("@apellido", empleado.apellido);
            comando.Parameters.AddWithValue("@direccion", empleado.direccion);
            comando.Parameters.AddWithValue("@email", empleado.email);
            comando.Parameters.AddWithValue("@clave", empleado.clave);

            comando.ExecuteNonQuery();

            cnx.Close();
        }

        public void EliminarEmpleado(string email)
        {
            SqlConnection cnx = cn.conecta();
            cnx.Open();
            string sqlStatement = "SP_EMPLEADO_DELETE";
            SqlCommand comando = new SqlCommand(sqlStatement, cnx);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@email", email);
            comando.ExecuteNonQuery();
            cnx.Close();
        }
    }
}
