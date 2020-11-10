using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace TPC_DiazOlivera
{
    public partial class Reclamos : System.Web.UI.Page
    {
        public List<Dominio.Reclamos> listaReclamos = null;
        public List<Telefono> listaTelefonos = null;
        
        protected void Page_Load(object sender, EventArgs e)
        {

            listaReclamos = new List<Dominio.Reclamos>();
            ReclamoNegocio negocio = new ReclamoNegocio();
            listaReclamos = negocio.Listar();
        }

        protected void btnPendientes(object sender, EventArgs e)
        {
            listaReclamos = new List<Dominio.Reclamos>();
            ReclamoNegocio negocio = new ReclamoNegocio(); 
            listaReclamos = negocio.Listar();
            //aca lista todo, hay que filtrar
        }

        protected void btnFinalizados(object sender, EventArgs e)
        {
            listaReclamos = new List<Dominio.Reclamos>();
            ReclamoNegocio negocio = new ReclamoNegocio();
            listaReclamos = negocio.Listar();
            // aca lista todo, hay que filtrar
        }

        protected void btnAceptar(object sender, EventArgs e)
        {
            
            //hacer funcion para que cambie de estado
        }

        protected void btnCancelar(object sender, EventArgs e)
        {

            Response.Redirect("Administrador.aspx");
        }


    }
}