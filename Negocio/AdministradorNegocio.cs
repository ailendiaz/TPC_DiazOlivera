using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
namespace Negocio
{
    public class AdministradorNegocio
    {
        
        public Administrador BuscarAdmin(Int64 ID)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                Administrador aux = new Administrador();
                TelefonoNegocio negocio = new TelefonoNegocio();
                datos.setearQuery("select u.ID,u.IDTipo,tp.Nombre,dp.Nombres,dp.Apellidos,dp.Genero,dp.DNI,dp.mail,dp.Nacimiento from Usuarios as u inner join datos_personales as dp on dp.IDUsuario = u.ID inner join tipo_Usuario as tp on tp.id = u.idtipo where u.ID=@ID");
                datos.agregarParametro("@ID", ID);
                datos.ejecutarReader();
                datos.reader.Read();

               
                aux.ID = Convert.ToInt64(datos.reader[0]);
                aux.tipoUsuario = new Tipo();
                aux.tipoUsuario.ID = Convert.ToInt32(datos.reader[1]);
                aux.tipoUsuario.tipo = Convert.ToString(datos.reader[2]);
                aux.nombre = Convert.ToString(datos.reader[3]);
                aux.apellido = Convert.ToString(datos.reader[4]);
                aux.genero = Convert.ToString(datos.reader[5]);
                aux.DNI = Convert.ToString(datos.reader[6]);
                aux.email = Convert.ToString(datos.reader[7]);
                aux.fechaNac = Convert.ToDateTime(datos.reader[8]);
                aux.telefonos = new List<Telefono>();
                aux.telefonos = negocio.Listar(aux.ID);

                return aux;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void AltaAdministrador(Administrador administrador)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearSP("sp_AltaUsuario");
                datos.agregarParametro("@IDTipo", administrador.tipoUsuario.ID);
                datos.agregarParametro("@Mail", administrador.email);
                datos.agregarParametro("@Nombre", administrador.nombre);
                datos.agregarParametro("@Apellido", administrador.apellido);
                datos.agregarParametro("@DNI", administrador.DNI);
                datos.agregarParametro("@Genero", administrador.genero);
                datos.agregarParametro("@Nacimiento", administrador.fechaNac);
                datos.agregarParametro("@Telefono", administrador.telefonos[0].telefono);

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
