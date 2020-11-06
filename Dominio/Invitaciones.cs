using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    class Invitaciones
    {
        public int ID { get; set; }
        public DateTime fechaHorario { get; set; }
        public Int64 IDUsuario { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public int DNI { get; set; }
    }
}
