using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Instalaciones
    {
        public int ID { get; set; }
        public string nombre { get; set; }
        public DateTime apertura { get; set; }
        public DateTime cierre { get; set; }
        public int horasDisponibles { get; set; }
        public Estado estado { get; set; }
    }
}
