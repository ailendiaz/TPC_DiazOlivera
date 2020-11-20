using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class ExpensasNegocio
    {
        public void GuardarExpensa(Expensas expensa)
        {
            
            try
            {
                
                AccesoDatos datos = new AccesoDatos();
                datos.setearSP("sp_GuardarExpensa");
                datos.agregarParametro("@FECHA",expensa.fecha.Date);
                datos.agregarParametro("@TOTAL", expensa.total);
                datos.ejecutarAccion();
                datos.cerrarConexion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void GuardarExpensaIndividual(Expensas expensa,Int64 IDUF)
        {

            try
            {

                AccesoDatos datos = new AccesoDatos();
                datos.setearSP("sp_GuardarExpensaIndividual");
                datos.agregarParametro("@IDEXPENSA", expensa.ID);
                datos.agregarParametro("@IDUF", IDUF);
                datos.agregarParametro("@FECHA", expensa.fecha.Date);
                datos.agregarParametro("@TOTALEXPENSA", expensa.total);
                datos.ejecutarAccion();
                datos.cerrarConexion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public Int64 UltimoID()
        {
            try
            {
                Int64 ID;
                AccesoDatos datos = new AccesoDatos();
                datos.setearQuery("select max(ID) from Expensas");
                datos.ejecutarReader();
                datos.reader.Read();
                ID = Convert.ToInt64(datos.reader[0]);
                datos.cerrarConexion();
                return ID;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
