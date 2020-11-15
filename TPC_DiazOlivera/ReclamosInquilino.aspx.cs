using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_DiazOlivera
{
    public partial class ReclamosInquilino : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Persona p = new Persona();
            p = (Dominio.Persona)Session["Usuario"];
            
            if ( p.tipoUsuario.ID!= 1)
            {
                string error = "Solo los usuarios de tipo inquilino pueden ingresar a esta seccion";
                Response.Redirect("ErrorInquilino.aspx?Error="+error);
                
            }
        }

        protected void btCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inquilino.aspx");
        }

        protected void btEnviar_Click(object sender, EventArgs e)
        {
            Dominio.Reclamos reclamo = new Dominio.Reclamos();
            Dominio.Persona persona = new Persona();
         
            ReclamoNegocio negocio = new ReclamoNegocio();

            reclamo.estado.ID = Convert.ToInt32(1);
            reclamo.IDUsuario = persona.ID;
            reclamo.titulo = txtAsunto.Text;
            reclamo.detalle = txtDetalle.Text;
            
            negocio.cargar(reclamo);

        }
    }
}