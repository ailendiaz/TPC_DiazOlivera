using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class ExpensaIndividual:Expensas
    {
        public Depto depto { get; set; }
        public Int64 IDExpensa { get; set; }
        public Estado estado { get; set; }

    }
}
