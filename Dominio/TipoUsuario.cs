using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class TipoUsuario
    {
        public int ID { get; set; }
        public string tipoUsuario { get; set; }
        public TipoUsuario() { }

        public TipoUsuario(int id,string tipo)
        {
            ID = id;
            tipoUsuario = tipo;
        }
    }
}
