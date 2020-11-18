using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
namespace TPC_DiazOlivera
{
    public partial class About : Page
    {
        Inquilino inquilino = null;
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


        }
    }
}