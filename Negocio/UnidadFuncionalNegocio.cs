using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UnidadFuncionalNegocio
    {
        public List<UnidadFuncional> ListarUF()
        {
            try
            {
                List<UnidadFuncional> lista = new List<UnidadFuncional>();
                AccesoDatos datos = new AccesoDatos();
                datos.setearQuery("select ID,numero, impagas,saldo from vw_GeneralUF");
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    UnidadFuncional aux = new UnidadFuncional(Convert.ToInt64(datos.reader[0]), Convert.ToInt32(datos.reader[1]), Convert.ToInt32(datos.reader[2]), Convert.ToDecimal(datos.reader[3]));
                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
