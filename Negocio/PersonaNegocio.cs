using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;
using System.Net.Configuration;

namespace Negocio
{
    public class PersonaNegocio
    {
        public List<Persona> Listar()
        {
            try
            {
                List<Persona> lista = new List<Persona>();
                TelefonoNegocio negocio = new TelefonoNegocio();
                AccesoDatos datos = new AccesoDatos();

                datos.setearQuery("select u.ID,u.Contraseña,u.IDTipo,tp.Nombre,dp.Nombres,dp.Apellidos,dp.Genero,dp.DNI,dp.email,dp.Nacimiento from Usuarios as u inner join datos_personales as dp on dp.IDUsuario = u.ID inner join tipo_Usuario as tp on tp.id = u.idtipo");
                datos.ejecutarReader();

                while (datos.reader.Read())
                {
                    Persona aux = new Persona();
                    aux.ID = Convert.ToInt64(datos.reader[0]);
                    aux.contraseña = (string)datos.reader[1];
                    aux.tipoUsuario = new Tipo();
                    aux.tipoUsuario.ID = (int)datos.reader[2];
                    aux.tipoUsuario.tipo = (string)datos.reader[3];
                    aux.nombre = (string)datos.reader[4];
                    aux.apellido = (string)datos.reader[5];
                    aux.genero = (string)datos.reader[6];
                    aux.DNI = Convert.ToString(datos.reader[7]);
                    aux.email = (string)datos.reader[8];
                    aux.fechaNac = Convert.ToDateTime(datos.reader[9]);
                    aux.telefonos = new List<Telefono>();
                    aux.telefonos = negocio.Listar(aux.ID);

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
        public Persona BuscarPersonaXDNI(string DNI)
        {
            AccesoDatos datos = new AccesoDatos();
            Persona aux = new Persona();
            aux.tipoUsuario = new Tipo();
            TelefonoNegocio negocioTelefono = new TelefonoNegocio();

            try
            {
                datos.setearQuery("Select u.ID,u.IDTipo,tp.Nombre,dp.Nombres,dp.Apellidos,dp.Genero,dp.DNI,dp.mail,dp.Nacimiento from Usuarios as u inner join datos_personales as dp on dp.IDUsuario = u.ID inner join tipo_Usuario as tp on tp.id = u.idtipo where dp.DNI = @DNI");
                datos.agregarParametro("@DNI", DNI);

                datos.ejecutarReader();
                datos.reader.Read();

                aux.tipoUsuario = new Tipo();
                aux.ID = Convert.ToInt64(datos.reader[0]);
                aux.tipoUsuario.ID = Convert.ToInt32(datos.reader[1]);
                aux.tipoUsuario.tipo = Convert.ToString(datos.reader[2]);
                aux.nombre = Convert.ToString(datos.reader[3]);
                aux.apellido = Convert.ToString(datos.reader[4]);
                aux.genero = Convert.ToString(datos.reader[5]);
                aux.DNI = Convert.ToString(datos.reader[6]);
                aux.email = Convert.ToString(datos.reader[7]);
                aux.fechaNac = Convert.ToDateTime(datos.reader[8]);
                aux.telefonos = negocioTelefono.Listar(aux.ID);

                datos.cerrarConexion();
                return aux;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public Persona Login (Persona user)
        {

            try
            {
                AccesoDatos datos = new AccesoDatos();
                Persona aux = new Persona();
                string p ="admin'";
                
                datos.setearQuery("select dp.DNI, u.Contraseña,u.IDTipo ,u.ID  from Usuarios as u inner join Datos_Personales as dp on dp.IDUsuario = u.ID where dp.DNI = @DNI and u.Contraseña = Convert(varchar(100),HashBytes('MD5','"+user.contraseña+"'), 2)");
                datos.agregarParametro("@DNI", user.DNI);
                datos.agregarParametro("@PASS", user.contraseña);
                datos.ejecutarReader();

                if (!datos.reader.Read())
                {
                    datos.cerrarConexion();
                    return aux;
                }
                aux.DNI = Convert.ToString(datos.reader[0]);
                aux.contraseña = Convert.ToString(datos.reader[1]);
                aux.tipoUsuario = new Tipo();
                aux.tipoUsuario.ID = Convert.ToInt32(datos.reader[2]);
                aux.ID = Convert.ToInt32(datos.reader[3]);

                datos.cerrarConexion();
                return aux;

            }
            catch (Exception ex)
            { 
               throw ex;
            }
            

        }


        public void BajaUsuario (Persona persona)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearSP("sp_BajaUsuario");
                datos.agregarParametro("@DNI", persona.DNI);
                datos.ejecutarAccion();
                datos.cerrarConexion();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public void ModificacionUsuario(Persona persona)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearSP("sp_ModificarUsuario");
                datos.agregarParametro("@Mail", persona.email);
                datos.agregarParametro("@Apellido", persona.apellido);
                datos.agregarParametro("@Nombre", persona.nombre);
                datos.agregarParametro("@DNI", persona.DNI);
                datos.agregarParametro("@Genero", persona.genero);
                datos.agregarParametro("@Nacimiento", persona.fechaNac);
                datos.ejecutarAccion();
                datos.cerrarConexion();

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public void ModificarContraseña(Persona User)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearSP("sp_Modificarcontraseña");
                datos.agregarParametro("@DNI", User.DNI);
                datos.agregarParametro("@CONTRASEÑA", User.contraseña);
                datos.ejecutarAccion();
                datos.cerrarConexion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public string EncriptarDNI(Int64 ID)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearQuery("select CONVERT(varchar(100), Hashbytes('MD5',DNI),2) from Datos_Personales where IDUsuario=@ID");
                datos.agregarParametro("@ID",ID);
                datos.ejecutarReader();
                datos.reader.Read();
                string aux = Convert.ToString(datos.reader[0]);
                datos.cerrarConexion();
                return aux;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
