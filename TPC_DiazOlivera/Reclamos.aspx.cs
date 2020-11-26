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
    public partial class Reclamos : System.Web.UI.Page
    {
        
        public List<Dominio.Reclamos> listaReclamos = null;
        public List<Telefono> listaTelefonos = null;
        public Administrador admin = null;
        public string ver;
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

            //SE MODIFICA EL ESTADO DEL RECLAMO SELECCIONADO
            ver = Request.QueryString["ver"];
            ReclamoNegocio negocio = new ReclamoNegocio();
            if (Request.QueryString["ID"]!=null && Request.QueryString["Estado"]!=null)
            {
                Dominio.Reclamos reclamo = new Dominio.Reclamos();
                reclamo = negocio.Listar().Find(x => x.ID == Convert.ToInt64(Request.QueryString["ID"]));
                
                if (Request.QueryString["Estado"] == "EnProceso")
                {
                    negocio.Modificar(reclamo, 2);
                }
                else if(Request.QueryString["Estado"] == "Solucionado")
                {
                    negocio.Modificar(reclamo, 3);
                }
            }

            //SE LISTAN LOS RECLAMO SEGUN FILTRANDO POR PENDIENTES O SOLUCIONADOS
            listaReclamos = new List<Dominio.Reclamos>();
            List<Dominio.Reclamos> listaAux = new List<Dominio.Reclamos>();
            if (ver == "Pendientes")
            {
                listaAux = negocio.Listar();
                listaReclamos= listaAux.FindAll(x=> x.estado.estado=="Sin revisar"||x.estado.estado== "En proceso" );
            }
            else if (ver == "Finalizados")
            {
                listaAux = negocio.Listar();
                listaReclamos = listaAux.FindAll(x => x.estado.estado == "Solucionado");
            }
            else
            {
                listaReclamos = negocio.Listar();
            }

          
        }

    }
}