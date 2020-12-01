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
    public partial class NovedadesAdm : System.Web.UI.Page
    {

        Administrador admin = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                admin = (Administrador)Session["Usuario"];
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                Session.Add("MensajeError", "No cuenta con el permiso para Ingresar a esta seccion");
                Response.Redirect("ErrorInquilino.aspx");
            }




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
            Page.Validate();
            if (!Page.IsValid)
                return;
            Response.Redirect("Administrador.aspx");
        }
    }
}