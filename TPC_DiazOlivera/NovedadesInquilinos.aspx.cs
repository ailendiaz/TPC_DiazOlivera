using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TPC_DiazOlivera
{
    public partial class NovedadesInquilinos : System.Web.UI.Page
    {
        public List<Dominio.Novedades> listaNovedades = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Dominio.Novedades> lista = new List<Dominio.Novedades>();

            //listaNovedades = new List<Dominio.Novedades>();
            NovedadesNegocio negocio = new NovedadesNegocio();
            lista = negocio.listar();
            listaNovedades = negocio.listar();
        }
    }
}