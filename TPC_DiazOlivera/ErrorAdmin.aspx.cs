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
    public partial class ErrorAdmin : System.Web.UI.Page
    {
        public string mensajeError { get; set; }
        public Exception exception = null;
        public Administrador admin = null;
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
            Error a;

            exception = (Exception)Session["Error"];
            mensajeError = (string)Session["MensajeError"];
        }
    }
}