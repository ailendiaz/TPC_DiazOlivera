using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class GastosNegocio
    {

        public void GuardarGastos(List<Gastos>listagastos)
        {
            
            try
            {
                //Expensas expensas = new Expensas();

                AccesoDatos datos = new AccesoDatos();
                foreach (Gastos item in listagastos )
                {
                    
                    datos.setearSP("sp_GuardarGastos");
                    //datos.agregarParametro("@IDExpensas", expensas.ID);
                    datos.agregarParametro("@Importe", item.importe);
                    datos.agregarParametro("@Fecha", item.fechaHora.Date);
                    
                    
                    //Tipo tipo = new Tipo();
                    datos.agregarParametro("@IDTipo", item.tipo.ID);
                    datos.ejecutarAccion();
                    
                }

                datos.cerrarConexion();

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }














        //public List<Gastos> Listar()
        //{
        //    List<Gastos> lista = new List<Gastos>();
        //    AccesoDatos datos = new AccesoDatos();
        //    datos.setearQuery();
            
        //    return lista;
        //}
    }
}
