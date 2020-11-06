using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Telefono
    {
        public Int64 ID { get; set; }
        public string telefono { get; set; }
        public Int64 IDUsuario { get; set; }//no se por que lo pusimos

        public Telefono() { }
        public Telefono(int IDTel,string numero, Int64 ID)
        {
            ID = IDTel;
            telefono = numero;
            IDUsuario= ID;
        }
        
        public override string ToString()
        {
            return telefono;
        }

    }
}
