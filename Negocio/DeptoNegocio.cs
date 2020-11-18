using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
namespace Negocio
{
    public class DeptoNegocio:UnidadFuncionalNegocio
    {
        public List<Depto> ListarDepto()
        {
            try
            {
                List<Depto> lista = new List<Depto>();
                AccesoDatos datos = new AccesoDatos();
                datos.setearQuery("select ID,numero,torre, piso from Unidad_Funcional");
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    Depto aux = new Depto(Convert.ToInt32(datos.reader[0]), Convert.ToInt32(datos.reader[1]), Convert.ToInt32(datos.reader[2]), Convert.ToInt32(datos.reader[3]));
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

        public Depto Buscar(Int64 ID)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                Depto aux = new Depto();
                datos.setearQuery("select ID, numero, torre, piso from Unidad_Funcional as uf inner join Usuarios_x_UnidadFuncional as uxu on uxu.IDUF=uf.ID where uxu.IDUsuario=@ID");
                datos.agregarParametro("@ID",ID);
                datos.ejecutarReader();
                datos.reader.Read();
                aux = new Depto(Convert.ToInt64(datos.reader[0]), Convert.ToInt32(datos.reader[1]), Convert.ToInt32(datos.reader[2]), Convert.ToInt32(datos.reader[3]));
                return aux;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

    }
}
