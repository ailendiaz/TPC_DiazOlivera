﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Opciones
    {
        public int ID { get; set; }
        public string nombre { get; set; }
        public string URLImagen { get; set; }

        public Tipo tipo { get; set; }

    }
}
