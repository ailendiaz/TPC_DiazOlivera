﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Reclamos:Publicaciones
    {
        public Inquilino inquilino { get; set; }
    }
}
