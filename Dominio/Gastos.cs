using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Gastos
    {
        public int ID { get; set; }
        public DateTime fechaHora { get; set; }

        public SqlMoney importe { get; set; }
        public Tipo tipo { get; set; }
    }
}
