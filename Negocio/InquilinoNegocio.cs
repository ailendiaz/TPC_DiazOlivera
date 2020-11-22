using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class InquilinoNegocio
    {
        public Inquilino BuscarInquilino(Int64 ID)
        {
            AccesoDatos datos = new AccesoDatos();
            Inquilino aux = new Inquilino();
            aux.tipoUsuario = new Tipo();
            TelefonoNegocio negocioTelefono = new TelefonoNegocio();
            DeptoNegocio negocioDepto = new DeptoNegocio();

            try
            {
                datos.setearQuery("Select u.ID,u.IDTipo,tp.Nombre,dp.Nombres,dp.Apellidos,dp.Genero,dp.DNI,dp.mail,dp.Nacimiento,uf.ID,uf.Numero,uf.torre,uf.Piso from Usuarios as u inner join datos_personales as dp on dp.IDUsuario = u.ID inner join Usuarios_x_UnidadFuncional as uxu on uxu.IDUsuario = dp.IDUsuario inner join Unidad_Funcional as uf on uf.ID = uxu.IDUF inner join tipo_Usuario as tp on tp.id = u.idtipo where u.ID=@ID");
                datos.agregarParametro("@ID", ID);
                
                datos.ejecutarReader();
                datos.reader.Read();

                aux.tipoUsuario = new Tipo();
                aux.ID = Convert.ToInt64(datos.reader[0]);
                aux.tipoUsuario.ID = Convert.ToInt32(datos.reader[1]);
                aux.tipoUsuario.tipo = Convert.ToString(datos.reader[2]);
                aux.nombre = Convert.ToString(datos.reader[3]);
                aux.apellido = Convert.ToString(datos.reader[4]);
                aux.genero = Convert.ToChar(datos.reader[5]);
                aux.DNI = Convert.ToString(datos.reader[6]);
                aux.email = Convert.ToString(datos.reader[7]);
                aux.fechaNac = Convert.ToDateTime(datos.reader[8]);
                aux.telefonos = negocioTelefono.Listar(aux.ID);
                aux.departamento = negocioDepto.BuscarxUsuario(aux.ID);

                datos.cerrarConexion();
                return aux;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }

        public void AltaInquilino (Inquilino inquilino)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearSP("sp_AltaUsuario");
                datos.agregarParametro("@IDTipo", inquilino.tipoUsuario.ID);
                datos.agregarParametro("@Mail", inquilino.email);
                datos.agregarParametro("@Nombre", inquilino.nombre);
                datos.agregarParametro("@Apellido", inquilino.apellido);
                datos.agregarParametro("@DNI", inquilino.DNI);
                datos.agregarParametro("@Nacimiento", inquilino.fechaNac);
                datos.agregarParametro("@Genero", inquilino.genero);
                datos.agregarParametro("@Telefono", inquilino.telefonos[0].telefono);

                datos.ejecutarAccion();
                datos.cerrarConexion();  
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
       
        public Inquilino BuscarInquilinoXDNI(string DNI)
        {
            AccesoDatos datos = new AccesoDatos();
            Inquilino aux = new Inquilino();
            aux.tipoUsuario = new Tipo();
            TelefonoNegocio negocioTelefono = new TelefonoNegocio();
            DeptoNegocio negocioDepto = new DeptoNegocio();

            try
            {
                datos.setearQuery("Select u.ID,u.IDTipo,tp.Nombre,dp.Nombres,dp.Apellidos,dp.Genero,dp.DNI,dp.mail,dp.Nacimiento,uf.ID,uf.Numero,uf.torre,uf.Piso from Usuarios as u inner join datos_personales as dp on dp.IDUsuario = u.ID inner join Usuarios_x_UnidadFuncional as uxu on uxu.IDUsuario = dp.IDUsuario inner join Unidad_Funcional as uf on uf.ID = uxu.IDUF inner join tipo_Usuario as tp on tp.id = u.idtipo where dp.DNI=@DNI");
                datos.agregarParametro("@DNI",DNI );

                datos.ejecutarReader();
                datos.reader.Read();

                aux.tipoUsuario = new Tipo();
                aux.ID = Convert.ToInt64(datos.reader[0]);
                aux.tipoUsuario.ID = Convert.ToInt32(datos.reader[1]);
                aux.tipoUsuario.tipo = Convert.ToString(datos.reader[2]);
                aux.nombre = Convert.ToString(datos.reader[3]);
                aux.apellido = Convert.ToString(datos.reader[4]);
                aux.genero = Convert.ToChar(datos.reader[5]);
                aux.DNI = Convert.ToString(datos.reader[6]);
                aux.email = Convert.ToString(datos.reader[7]);
                aux.fechaNac = Convert.ToDateTime(datos.reader[8]);
                aux.telefonos = negocioTelefono.Listar(aux.ID);
                aux.departamento = negocioDepto.BuscarxUsuario(aux.ID);

                datos.cerrarConexion();
                return aux;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public void AsignarDepto(Inquilino inquilino)
        {
            
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearSP("sp_AsignarDepto");
                datos.agregarParametro("@TORRE", inquilino.departamento.torre);
                datos.agregarParametro("@PISO", inquilino.departamento.piso);
                datos.agregarParametro("@NUMERO", inquilino.departamento.numero);
                datos.agregarParametro("@DNI", inquilino.DNI);
                datos.ejecutarAccion();
                datos.cerrarConexion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }










        //public List<Inquilino> Listar()
        //{
        //    try
        //    {
        //        List<Inquilino> lista = new List<Inquilino>();
        //        TelefonoNegocio negocio = new TelefonoNegocio();
        //        AccesoDatos datos = new AccesoDatos();

        //        datos.setearQuery("select u.ID,u.Contraseña,u.IDTipo,tp.Nombre,dp.Nombres,dp.Apellidos,dp.Genero,dp.DNI,dp.Mail,dp.Nacimiento,uf.id,uf. from Usuarios as u inner join datos_personales as dp on dp.IDUsuario = u.ID inner join Unidad_Funcional as uf on uf.IDUsuario=u.ID inner join tipo_Usuario as tp on tp.id = u.idtipo");
        //        datos.ejecutarReader();

        //        while (datos.reader.Read())
        //        {
        //            Persona aux = new Persona();
        //            aux.ID = Convert.ToInt64(datos.reader[0]);
        //            aux.contrasenia = (string)datos.reader[1];
        //            aux.tipoUsuario = new TipoUsuario();
        //            aux.tipoUsuario.ID = (int)datos.reader[2];
        //            aux.tipoUsuario.tipoUsuario = (string)datos.reader[3];
        //            aux.nombre = (string)datos.reader[4];
        //            aux.apellido = (string)datos.reader[5];
        //            aux.genero = (char)datos.reader[6];
        //            aux.DNI = Convert.ToInt32(datos.reader[7]);
        //            aux.email = (string)datos.reader[8];
        //            aux.fechaNac = Convert.ToDateTime(datos.reader[9]);
        //            aux.telefonos = new List<Telefono>();
        //            aux.telefonos = negocio.Listar(aux.ID);

        //            lista.Add(aux);
        //        }
        //        datos.cerrarConexion();
        //        return lista;
        //    }
        //    catch (Exception ex)
        //    {

        //        throw ex;
        //    }

        //}


    }
}
