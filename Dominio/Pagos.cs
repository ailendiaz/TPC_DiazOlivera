using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Pagos
    {
        public Int64 ID { get; set; }
        public DateTime fecha { get; set; }
        public SqlMoney importe { get; set; }
        public Estado estado { get; set; }
        public string nombre { get; set; }
    }
}
