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

                datos.setearQuery("select u.ID,u.Contraseña,u.IDTipo,tp.Nombre,dp.Nombres,dp.Apellidos,dp.Genero,dp.DNI,dp.Mail,dp.Nacimiento from Usuarios as u inner join datos_personales as dp on dp.IDUsuario = u.ID inner join tipo_Usuario as tp on tp.id = u.idtipo");
                datos.ejecutarReader();

                while (datos.reader.Read())
                {
                    Persona aux = new Persona();
                    aux.ID = Convert.ToInt64(datos.reader[0]);
                    aux.contrasenia = (string)datos.reader[1];
                    aux.tipoUsuario = new TipoUsuario();
                    aux.tipoUsuario.ID = (int)datos.reader[2];
                    aux.tipoUsuario.tipoUsuario = (string)datos.reader[3];
                    aux.nombre = (string)datos.reader[4];
                    aux.apellido = (string)datos.reader[5];
                    aux.genero = (char)datos.reader[6];
                    aux.DNI = Convert.ToInt32(datos.reader[7]);
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

        
        public Persona login (Persona user)
        {
            
            try
            {
                AccesoDatos datos = new AccesoDatos();
                    
                datos.setearQuery("select u.ID,u.Contraseña,u.IDTipo,dp.Mail from Usuarios as u inner join datos_personales as dp on dp.IDUsuario = u.ID inner join tipo_Usuario as tp on tp.id = u.idtipo");
                datos.ejecutarReader();

                
                datos.cerrarConexion();
                return user;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
