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
            catch (Exception)
            {
                Response.Redirect("Inquilino.aspx");
            }

            string aux = Request.QueryString["ID"];
            if (aux == "Pendientes")
            {
                listaReclamos = new List<Dominio.Reclamos>();
                ReclamoNegocio negocio = new ReclamoNegocio();
                List<Dominio.Reclamos> listaAux = new List<Dominio.Reclamos>();
                listaAux = negocio.Listar();
                listaReclamos= listaAux.FindAll(x=> x.estado.estado=="Sin revisar"||x.estado.estado== "En proceso" );

            }
            else if (aux == "Finalizados")
            {
                listaReclamos = new List<Dominio.Reclamos>();
                ReclamoNegocio negocio = new ReclamoNegocio();
                List<Dominio.Reclamos> listaAux = new List<Dominio.Reclamos>();
                listaAux = negocio.Listar();
                listaReclamos = listaAux.FindAll(x => x.estado.estado == "Solucionado");
            }
            else
            {
                listaReclamos = new List<Dominio.Reclamos>();
                ReclamoNegocio negocio = new ReclamoNegocio();
                listaReclamos = negocio.Listar();
            }

          
        }

        protected void btnPendientes(object sender, EventArgs e)
        {
            Response.Redirect("/Reclamos.aspx?ID=Pendientes");
            //aca lista todo, hay que filtrar
        }

        protected void btnFinalizados(object sender, EventArgs e)
        {
            Response.Redirect("/Reclamos.aspx?ID=Finalizados");
            // aca lista todo, hay que filtrar
        }

        protected void btnAceptar(object sender, EventArgs e)
        {
            
            //hacer funcion para que cambie de estado
        }

        protected void btnCancelar(object sender, EventArgs e)
        {

            Response.Redirect("Administrador.aspx");
        }

        protected void Modificar_Click(object sender, EventArgs e)
        {

            if (CheckBox1.Checked)
            {
                
                //List<Dominio.Reclamos> aux = new List<Dominio.Reclamos>();
                //aux = listaReclamos;
                //foreach (Dominio.Reclamos items in aux)
                //{
                //    if (items.ID ==)
                //    {
                //        items.estado.ID = 1;
                //    }
                //}
            }
        }
    }
}