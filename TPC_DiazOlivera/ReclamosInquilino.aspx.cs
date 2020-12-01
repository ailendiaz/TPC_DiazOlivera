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
        public Inquilino inquilino { get; set; }
        public Dominio.Reclamos reclamo { get; set; }
        public List<Dominio.Reclamos> listaReclamos=null;
        public List<Mensaje> listaMensajes = null;
        public string ver = null;
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
            ReclamoNegocio negocio = new ReclamoNegocio();
            reclamo = new Dominio.Reclamos();


            if (ver == "Reclamos")
            {
                try
                {
                    listaReclamos = new List<Dominio.Reclamos>();
                    listaReclamos = negocio.Listar().FindAll(x => x.inquilino.ID == inquilino.ID);
                    if (listaReclamos == null)
                    {
                        listaReclamos= new List<Dominio.Reclamos>();
                    }

                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
            else if (ver== "Reportes")
            {
                try
                {
                    //listaMensajes = new List<Mensaje>();
                    MensajeNegocio negocioMensaje = new MensajeNegocio();
                    listaMensajes = negocioMensaje.ListarPropios(inquilino.ID);
                    if (listaMensajes == null)
                    {
                        listaMensajes = new List<Mensaje>();
                    }
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }

        protected void btCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inquilino.aspx");
        }

        protected void btEnviar_Click(object sender, EventArgs e)
        {
            Dominio.Persona persona = new Persona();
            ReclamoNegocio negocio = new ReclamoNegocio();
            persona = (Dominio.Persona)Session["Usuario"];
            reclamo.estado = new Estado();
            reclamo.estado.ID = 1;
            reclamo.inquilino = new Inquilino();
            reclamo.inquilino.ID = persona.ID;
            reclamo.titulo = txtAsunto.Text;
            reclamo.detalle = txtDetalle.Text;
            
            negocio.Guardar(reclamo);
            Response.Redirect("/Inquilino.aspx");

        }
    }
}