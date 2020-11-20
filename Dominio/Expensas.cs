using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlTypes;
namespace Dominio
{
    public class Expensas
    {
        public Int64 ID { get; set; }
        public SqlMoney total { get; set; }
        public DateTime fecha { get; set; }
    }
}
