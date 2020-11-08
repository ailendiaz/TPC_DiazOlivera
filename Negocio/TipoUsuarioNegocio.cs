using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    class TipoUsuarioNegocio
    {
        public List<TipoUsuario> Listar()
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                List<TipoUsuario> lista = new List<TipoUsuario>();
                datos.setearQuery("select * from Tipo_Usuario");
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    lista.Add(new TipoUsuario((Convert.ToInt32(datos.reader[0])), (Convert.ToString(datos.reader[1]))));
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
