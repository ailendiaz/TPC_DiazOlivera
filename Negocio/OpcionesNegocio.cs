using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class OpcionesNegocio
    {

        public List<Opciones> listar()
        {
            try
            {

                List<Opciones> lista = new List<Opciones>();
                AccesoDatos datos = new AccesoDatos();
                datos.setearQuery("Select Nombre, IDTipoUsuario From Opciones");
                datos.ejecutarReader();
                int con = 0;
                while (datos.reader.Read())
                {
                    Opciones opciones = new Opciones();
                    opciones.nombre = Convert.ToString(datos.reader[0]);
                    opciones.tipo = new Tipo();
                    opciones.tipo.ID = Convert.ToInt32(datos.reader[1]);
                    lista.Add(opciones);
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
    }


}
