using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlTypes;

namespace Dominio
{
    public class Depto:UnidadFuncional
    {
        public int torre { get; set; }
        public int piso { get; set; }

        public Depto() { }
        public Depto(Int64 i, int n, int t, int p)
        {
            torre = t;
            piso = p;
            ID = i;
            numero = n;
        }
        public Depto(Int64 i, int n,int t, int p,int imp, SqlMoney s)
        {
            torre = t;
            piso = p;
            ID = i;
            numero = n;
            saldo = s;
            impagas = imp;
        }
    }
}
