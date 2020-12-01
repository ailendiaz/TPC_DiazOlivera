using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Mensaje
    {
        public Int64 ID { get; set; }
        public string asunto { get; set; }
        public string detalle { get; set; }
        public Int64 IDEmisor { get; set; }
        public Int64 IDReceptor { get; set; }
        public Int64 IDReclamo { get; set; }
        public DateTime fechaHora { get; set; }

        public Mensaje() { }
        public Mensaje(Int64 I, Int64 IDEmi, Int64 IDRecep,string asu,string det,DateTime FH,Int64 IDRec)
        {
            ID = I;
            IDEmisor = IDEmi;
            IDReceptor = IDRecep;
            asunto = asu;
            detalle = det;
            fechaHora = FH;
            IDReclamo = IDRec;
        }
    }
}
