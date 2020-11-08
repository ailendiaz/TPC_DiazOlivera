using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class ReclamoNegocio
    {
        public List<Reclamos> Listar()
        {
            try
            {
                List<Reclamos> lista = new List<Reclamos>();
                AccesoDatos datos = new AccesoDatos();

                datos.setearQuery("select r.ID, r.IDUsuario,r.FechaHora, r.Asunto, r.Detalle,er.ID, er.Nombre from reclamos as r inner join Estado_Reclamo as er on er.ID = r.IDEstado");
                datos.ejecutarReader();

                while (datos.reader.Read())
                {
                    Reclamos aux = new Reclamos();
                    aux.ID = Convert.ToInt64(datos.reader[0]);
                    aux.IDUsuario = Convert.ToInt64(datos.reader[1]);
                    aux.fechaHora = Convert.ToDateTime(datos.reader[2]);
                    aux.titulo = Convert.ToString(datos.reader[3]);
                    aux.detalle = Convert.ToString(datos.reader[4]);
                    aux.estado = new Estado();
                    aux.estado.ID = Convert.ToInt32(datos.reader[5]);
                    aux.estado.estado = Convert.ToString(datos.reader[6]);
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
    }
}
