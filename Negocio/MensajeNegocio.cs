using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class MensajeNegocio
    {
        public List<Mensaje> Listar()
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                List<Mensaje> lista = new List<Mensaje>();
                datos.setearQuery("select ID,IDEmisor,IDReceptor,Asunto,Detalle,FechaHora,IDReclamo from Mensajes order by FechaHora desc");
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    lista.Add(new Mensaje(Convert.ToInt64(datos.reader[0]), Convert.ToInt64(datos.reader[1]), Convert.ToInt64(datos.reader[2]),Convert.ToString(datos.reader[3]), Convert.ToString(datos.reader[4]),Convert.ToDateTime(datos.reader[5]), Convert.ToInt64(datos.reader[6])));
                }
                datos.cerrarConexion();
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public List<Mensaje> ListarPropios(Int64 IDUsuario)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                List<Mensaje> lista = new List<Mensaje>();
                datos.setearQuery("select ID,IDEmisor,IDReceptor,Asunto,Detalle,FechaHora,IDReclamo from Mensajes where IDEmisor=@ID or IDReceptor =@ID order by FechaHora desc");
                datos.agregarParametro("@ID",IDUsuario);
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    lista.Add(new Mensaje(Convert.ToInt64(datos.reader[0]), Convert.ToInt64(datos.reader[1]), Convert.ToInt64(datos.reader[2]), Convert.ToString(datos.reader[3]), Convert.ToString(datos.reader[4]), Convert.ToDateTime(datos.reader[5]), Convert.ToInt64(datos.reader[6])));
                }
                datos.cerrarConexion();
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void Guardar(Mensaje mensaje)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearSP("sp_GuardarMensaje");
                datos.agregarParametro("@ASUNTO", mensaje.asunto);
                datos.agregarParametro("@DETALLE", mensaje.detalle);
                datos.agregarParametro("@IDEMISOR", mensaje.IDEmisor);
                datos.agregarParametro("@IDRECEPTOR", mensaje.IDReceptor);
                datos.agregarParametro("@FECHAHORA", mensaje.fechaHora);
                datos.agregarParametro("@IDRECLAMO", mensaje.IDReclamo);
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
