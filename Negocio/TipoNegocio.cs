using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class TipoNegocio
    {
        public List<Tipo> ListarTipoUF()
        {
            try
            {
                List<Tipo> lista = new List<Tipo>();
                AccesoDatos datos = new AccesoDatos();

                datos.setearQuery("select * from Tipo_Unidad_Funcional");
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    lista.Add(new Tipo(Convert.ToInt32(datos.reader[0]), Convert.ToString(datos.reader[1])));
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
