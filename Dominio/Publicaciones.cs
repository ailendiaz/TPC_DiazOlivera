using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Publicaciones
    {
        public Int64 ID { get; set; }
        public Int64 IDUsuario  { get; set; }
        public string titulo { get; set; }
        public string detalle { get; set; }
        public DateTime fechaHora { get; set; }
        public Estado estado { get; set; }
    }
}
