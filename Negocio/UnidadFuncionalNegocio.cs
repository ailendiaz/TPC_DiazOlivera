using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class UnidadFuncionalNegocio
    {
        public List<UnidadFuncional> Listar()
        {
            try
            {
                List<UnidadFuncional> lista = new List<UnidadFuncional>();
                AccesoDatos datos = new AccesoDatos();
                datos.setearQuery("select uf.ID,tp.id,tp.nombre,uf.numero from Unidad_Funcional as uf inner join Tipo_Unidad_Funcional as tp on tp.id=uf.IDTipo");
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    UnidadFuncional aux = new UnidadFuncional();
                    aux.ID = Convert.ToInt64(datos.reader[0]);
                    aux.tipo = new Tipo();
                    aux.tipo.ID = Convert.ToInt32(datos.reader[1]);
                    aux.tipo.tipo = Convert.ToString(datos.reader[2]);
                    aux.numero = Convert.ToInt32(datos.reader[3]);
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
