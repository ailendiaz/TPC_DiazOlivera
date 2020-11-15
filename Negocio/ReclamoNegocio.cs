using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Resources;
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
                //datos.setearQuery("select r.ID, r.IDUsuario, r.FechaHora, r.Asunto, r.Detalle, er.ID, er.Nombre, dat.Nombres + dat.Apellidos as 'Nombre y Apellido' from reclamos as r inner join Estado_Reclamo as er on er.ID = r.IDEstado inner join Datos_Personales as dat ON r.IDUsuario = dat.IDUsuario");
                datos.ejecutarReader();

                while (datos.reader.Read())
                {
                    Reclamos aux = new Reclamos();
                    aux.inquilino = new Inquilino();
                    InquilinoNegocio auxNegocio = new InquilinoNegocio();
                    //Persona auxper = new Persona();
                    aux.ID = Convert.ToInt64(datos.reader[0]);
                    aux.inquilino = auxNegocio.Buscar(Convert.ToInt64(aux.ID));
                    //aux.IDUsuario = Convert.ToInt64(datos.reader[1]);
                    aux.fechaHora = Convert.ToDateTime(datos.reader[2]);
                    aux.titulo = Convert.ToString(datos.reader[3]);
                    aux.detalle = Convert.ToString(datos.reader[4]);
                    aux.estado = new Estado();
                    aux.estado.ID = Convert.ToInt32(datos.reader[5]);
                    aux.estado.estado = Convert.ToString(datos.reader[6]);
                    //auxper.nombre= Convert.ToString(datos.reader[7]); 
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

        public void Guardar (Reclamos reclamos)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearSP("sp_GuardarReclamo");
                //datos.setearQuery("Insert into RECLAMOS(IDEstado, IDUsuario,Asunto, Detalle)values (@IDEstado, @IDUsuario, @Asunto, @Detalle)");
                datos.agregarParametro("@IDEstado", reclamos.estado.ID);
                datos.agregarParametro("@IDUsuario", reclamos.inquilino.ID);
                datos.agregarParametro("@Asunto", reclamos.titulo);
                datos.agregarParametro("@Detalle", reclamos.detalle);
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
