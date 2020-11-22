using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlTypes;

namespace Dominio
{
    public class UnidadFuncional
    {
        public Int64 ID { get; set; }
        //public Tipo tipo { get; set; }
        public int numero { get; set; }
        public int impagas { get; set; }
        public SqlMoney saldo { get; set; }

        public UnidadFuncional() { }
        public UnidadFuncional(Int64 i,int n,int imp,SqlMoney s) 
        {
            ID = i;
            numero = n;
            impagas = imp;
            saldo = s;
        }
    }
}
