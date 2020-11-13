using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class NovedadesNegocio
    {
        public List<Novedades> listar()
        {
            try
            {
                Novedades novedades = new Novedades();
                List<Novedades> lista = new List<Novedades>();
                AccesoDatos datos = new AccesoDatos();
                datos.setearQuery("Select detalle, FechaHora From Novedades");
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    novedades.detalle = Convert.ToString(datos.reader[0]);
                    novedades.fechaHora = Convert.ToDateTime(datos.reader[1]);
                    lista.Add(novedades);

                }
                datos.cerrarConexion();
                return lista;
            }

            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
