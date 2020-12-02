using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;



namespace TPC_DiazOlivera
{
    public partial class NovedadesInquilino : System.Web.UI.Page
    {
        public string ver { get; set; }
        public List<Dominio.Novedades> listaNovedades { get; set; }
        public Inquilino inquilino { get; set; }
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
            ver = Request.QueryString["ver"];
            listaNovedades = new List<Dominio.Novedades>();
            NovedadesNegocio negocio = new NovedadesNegocio();
            if (ver == "Todas")
            {
                listaNovedades = negocio.listar();
            }
            else
            {
                listaNovedades = negocio.listar().FindAll(x => x.fechaHora.Year == DateTime.Now.Year && x.fechaHora.Month == DateTime.Now.Month);
            }

        }
    }
}