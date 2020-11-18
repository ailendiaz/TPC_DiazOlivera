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
        public string detalleErro { get; set; }
        public Inquilino inquilino { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            try
            {
                inquilino = (Inquilino)Session["Usuario"];
            }
            catch (Exception)
            {
                Response.Redirect("Administrador.aspx");
            }

            string error;
            error = Request.QueryString["Error"];
            lblError.Text = error;
        }
    }
}