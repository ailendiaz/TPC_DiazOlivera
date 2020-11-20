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
                    aux.genero = (char)datos.reader[6];
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

        
        public Persona Login (Persona user)
        {

            try
            {
                AccesoDatos datos = new AccesoDatos();
                Persona aux = new Persona();
                datos.setearQuery("select dp.DNI, u.Contraseña,u.IDTipo ,u.ID  from Usuarios as u inner join Datos_Personales as dp on dp.IDUsuario = u.ID where DNI = @DNI and u.Contraseña = @Contraseña");
                datos.agregarParametro("@DNI",user.DNI);
                datos.agregarParametro("@Contraseña", user.contraseña);
                datos.ejecutarReader();

                if (!datos.reader.Read())
                {
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
                datos.setearSP("sp_Modificar_Usuario");
                datos.agregarParametro("@Mail", persona.email);
                datos.agregarParametro("@Apellido", persona.apellido);
                datos.agregarParametro("@Nombre", persona.nombre);
                datos.agregarParametro("@DNI", persona.DNI);
                //datos.agregarParametro("@Genero", persona.genero);
                datos.agregarParametro("@Nacimiento", persona.fechaNac);
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
