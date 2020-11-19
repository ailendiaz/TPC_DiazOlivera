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
    public partial class Contact : Page
    {
        Administrador admin = null;
        public List<Dominio.Opciones> listaOpciones { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            try
            {
                admin = (Administrador)Session["Usuario"];
                listaOpciones = new List<Dominio.Opciones>();
                OpcionesNegocio negocio = new OpcionesNegocio();
                listaOpciones = negocio.listar();
            }
            catch (Exception)
            {
                Response.Redirect("Inquilino.aspx");
            }
        }
    }
}