using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class EstadoNegocio
    {
        public Estado BuscarEstadoExpensa(int ID)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearQuery("select *from Estado_Expensas where ID=@ID");
                datos.agregarParametro("@ID", ID);
                datos.ejecutarReader();
                datos.reader.Read();
                Estado aux = new Estado();
                aux.ID = Convert.ToInt32(datos.reader[0]);
                aux.estado = Convert.ToString(datos.reader[1]);
                datos.cerrarConexion();
                return aux;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
