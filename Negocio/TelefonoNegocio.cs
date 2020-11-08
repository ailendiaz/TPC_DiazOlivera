using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class TelefonoNegocio
    {
        public List<Telefono> Listar(Int64 IDUsuario)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                List<Telefono> lista = new List<Telefono>();
                datos.setearQuery("select * from telefonos");
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    if (IDUsuario == Convert.ToInt64(datos.reader[1]))
                    {
                        Telefono aux = new Telefono();
                        aux.ID = Convert.ToInt64(datos.reader[0]);
                        aux.IDUsuario = Convert.ToInt64(datos.reader[1]);
                        aux.telefono = (string)datos.reader[2];
                        lista.Add(aux);
                    }
                }
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }
        public void Agregar(Int64 IDUsuario, string telefono)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();

                datos.setearQuery("insert into Telefonos (IDUsuario,Telefono) values(@IDUsuario,'@telefono')");
                datos.agregarParametro("@telefono", telefono);
                datos.agregarParametro("@IDUsuario", IDUsuario);
                datos.ejecutarAccion();
                datos.cerrarConexion();
                
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void Eliminar(string telefono)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();

                datos.setearQuery("delete from Telefonos where telefono= '@telefono'");
                datos.agregarParametro("@telefono", telefono);
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
