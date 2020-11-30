using System;

namespace Dominio
{
    public class ExpensaIndividual : Expensas
    {
        public Depto depto { get; set; }
        public Int64 IDExpensa { get; set; }
        public Estado estado { get; set; }
        public string transaccion { get; set; }

    }

}

