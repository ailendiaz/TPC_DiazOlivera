using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Negocio
{
    class AccesoDatos
    {
        public SqlDataReader reader { get; set; }
        public SqlConnection conexion { get; set; }
        public SqlCommand comando { get; set; }

        public AccesoDatos()
        {
            conexion = new SqlConnection("Data Source= DESKTOP-3EDAK3V\\SQLEXPRESS; initial catalog= Habitapp_DB;integrated security= sspi");
            conexion = new SqlConnection("Data Source= ALE\\SQLEXPRESS; initial catalog= Habitapp_DB;integrated security= sspi");
            comando = new SqlCommand();
            comando.Connection = conexion;
        }
        public void setearQuery(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;

        }
        public void setearSP(string sp)
        {
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.CommandText = sp;
        }
        public void agregarParametro(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }
        public void ejecutarReader()
        {
            try
            {
                conexion.Open();
                reader = comando.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                //conexion.Close();
            }
        }
        public void cerrarConexion()
        {
            conexion.Close();
        }
        internal void ejecutarAccion()
        {
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
        }

    }
}
