using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class TelefonoNegocio
    {
        public List<Telefono> Listar(Int64 IDUsuario)
        {
            AccesoDatos datos = new AccesoDatos();
            List<Telefono> lista = new List<Telefono>();
            datos.setearQuery("select * from telefonos");
            datos.ejecutarReader();
            while (datos.reader.Read())
            {
                if (IDUsuario == Convert.ToInt64(datos.reader[1]))
                {
                    Telefono aux = new Telefono();
                    aux.ID = Convert.ToInt64(datos.reader[0]);
                    aux.IDUsuario = Convert.ToInt64(datos.reader[1]);
                    aux.telefono = (string)datos.reader[2];
                    lista.Add(aux);
                }
            }
            return lista;
        }
    }
}
