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
                
                List<Novedades> lista = new List<Novedades>();
                AccesoDatos datos = new AccesoDatos();
                datos.setearQuery("Select detalle, FechaHora From Novedades");
                datos.ejecutarReader();
                int con = 0;
                while (datos.reader.Read())
                {
                    Novedades novedades = new Novedades();
                    novedades.detalle = Convert.ToString(datos.reader[0]);
                    novedades.fechaHora = Convert.ToDateTime(datos.reader[1]);
                    lista.Add(novedades);
                    con++;

                }
                datos.cerrarConexion();
                return lista;
            }

            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void Guardar(Novedades guardar)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearSP("sp_GuardarNovedades"); 
                datos.agregarParametro("@Detalle", guardar.detalle);
                datos.agregarParametro("@FechaHora", guardar.fechaHora);
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
