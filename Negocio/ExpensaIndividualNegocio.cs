using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class ExpensaIndividualNegocio
    {
        public List<ExpensaIndividual> Listar()
        {
            try
            {
                List<ExpensaIndividual> lista = new List<ExpensaIndividual>();
                AccesoDatos datos = new AccesoDatos();
                datos.setearQuery("select ei.ID,ei.IDUnidadFuncional,ei.IDEstadoExpensa,ei.Fecha,ei.Importe from Expensas_individuales as ei");
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    ExpensaIndividual aux = new ExpensaIndividual();
                    DeptoNegocio negocioDepto = new DeptoNegocio();
                    EstadoNegocio negocioEstado = new EstadoNegocio();
                    aux.ID = Convert.ToInt64(datos.reader[0]);
                    aux.depto = new Depto();
                    aux.depto = negocioDepto.BuscarxUsuario(Convert.ToInt64(datos.reader[1]));
                    aux.estado = new Estado();
                    aux.estado = negocioEstado.BuscarEstadoExpensa(Convert.ToInt32(datos.reader[2]));
                    aux.fecha = Convert.ToDateTime(datos.reader[3]);
                    aux.total = Convert.ToDecimal(datos.reader[4]);
                    lista.Add(aux);

                }
                datos.cerrarConexion();
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }
        public List<ExpensaIndividual> Listar(Int64 ID)
        {
            try
            {
                List<ExpensaIndividual> lista = new List<ExpensaIndividual>();
                AccesoDatos datos = new AccesoDatos();
                datos.setearQuery("select ei.ID,ei.IDUnidadFuncional,ei.IDEstadoExpensa,ei.Fecha,ei.Importe from Expensas_individuales as ei");
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    if (ID==Convert.ToInt64(datos.reader[1])) 
                    {
                        ExpensaIndividual aux = new ExpensaIndividual();
                        DeptoNegocio negocioDepto = new DeptoNegocio();
                        EstadoNegocio negocioEstado = new EstadoNegocio();
                        aux.ID = Convert.ToInt64(datos.reader[0]);
                        aux.depto = new Depto();
                        aux.depto = negocioDepto.BuscarxUsuario(Convert.ToInt64(datos.reader[1]));
                        aux.estado = new Estado();
                        aux.estado = negocioEstado.BuscarEstadoExpensa(Convert.ToInt32(datos.reader[2]));
                        aux.fecha = Convert.ToDateTime(datos.reader[3]);
                        aux.total = Convert.ToDecimal(datos.reader[4]);
                        lista.Add(aux);
                    }
                }
                datos.cerrarConexion();
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public void ModificarEstado(Int64 ID,string estado)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearSP("sp_ModificarEstadoExpensaIndividual");
                datos.agregarParametro("@ID", ID);
                datos.agregarParametro("@ESTADO", estado);
                datos.ejecutarAccion();
                datos.cerrarConexion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
