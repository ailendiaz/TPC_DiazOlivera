using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebGrease;
using Dominio;

namespace TPC_DiazOlivera
{
    public partial class Error : System.Web.UI.Page
    {
        public Exception exception = null;
        public Inquilino inquilino = null;

        public string mensajeError { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                inquilino = (Inquilino)Session["Usuario"];
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                Session.Add("MensajeError", "No cuenta con el permiso para Ingresar a esta seccion");
                Response.Redirect("ErrorAdmin.aspx");
                
            }
            exception = (Exception)Session["Error"];
            mensajeError = (string)Session["MensajeError"];
        }
    }
}