﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Tipo
    {
        public int ID { get; set; }
        public string tipo { get; set; }
        public Tipo() { }
        public Tipo(int id,string t)
        {
            ID = id;
            tipo = t;
        }
    }
}
