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
    public partial class About : Page
    {
        Inquilino inquilino = null;
        public List<Dominio.Opciones> listaOpciones { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                inquilino = (Inquilino)Session["Usuario"];
                listaOpciones = new List<Dominio.Opciones>();
                OpcionesNegocio negocio = new OpcionesNegocio();
                listaOpciones = negocio.listar();
            }
            catch (Exception)
            {
                Response.Redirect("Administrador.aspx");
            }


        }
        
    }
}