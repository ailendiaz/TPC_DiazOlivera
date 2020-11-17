using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace TPC_DiazOlivera
{
    public partial class NovedadesAdm : System.Web.UI.Page
    {
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
           



        }

        protected void btnPublicar_Click(object sender, EventArgs e)
        {
            Dominio.Novedades novedades = new Dominio.Novedades();
            NovedadesNegocio negocio = new NovedadesNegocio();

            novedades.detalle = txtDetalle.Text;
            novedades.fechaHora = Convert.ToDateTime(txtFechaHora.Text);
            negocio.Guardar(novedades);
            Response.Redirect("NovedadesAdm.aspx");

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Administrador.aspx");
        }
    }
}