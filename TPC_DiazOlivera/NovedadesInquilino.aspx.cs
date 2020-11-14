using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace TPC_DiazOlivera
{
    public partial class NovedadesInquilino : System.Web.UI.Page
    {
        //public List<Dominio.Novedades> listaNovedades = null;
        public List<Dominio.Novedades> listaNovedades { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

            
            listaNovedades = new List<Dominio.Novedades>();
            NovedadesNegocio negocio = new NovedadesNegocio();
            listaNovedades=negocio.listar();
        }
    }
}