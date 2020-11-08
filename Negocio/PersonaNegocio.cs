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
            List<Persona> lista = new List<Persona>();
            TelefonoNegocio negocio = new TelefonoNegocio();
            AccesoDatos datos = new AccesoDatos();
            
            datos.setearQuery("La query que devuelve los datos para Persona");
            datos.ejecutarReader();
            
            while (datos.reader.Read())
            {
                Persona aux = new Persona();
                aux.ID = Convert.ToInt64(datos.reader[0]);
                aux.contrasenia = (string)datos.reader[1];
                aux.tipoUsuario = (string)datos.reader[2];
                aux.nombre = (string)datos.reader[3];
                aux.apellido = (string)datos.reader[4];
                aux.genero = (char)datos.reader[4];
                aux.DNI = Convert.ToInt32(datos.reader[5]);
                aux.email = (string)datos.reader[6];
                aux.fechaNac = Convert.ToDateTime(datos.reader[7]);
                aux.telefonos = new List<Telefono>();
                aux.telefonos = negocio.Listar(aux.ID);
              
                lista.Add(aux);
            }
            datos.cerrarConexion();
            return lista;
        }
    }
}
