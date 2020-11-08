using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Persona
    {
        public Int64 ID { get; set; }
        public string contrasenia { get; set; }
        public TipoUsuario tipoUsuario { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public char genero { get; set; }
        public int DNI { get; set; }
        public string email { get; set; }
        public DateTime fechaNac { get; set; }
        public List<Telefono> telefonos { get; set; }
    }
}
