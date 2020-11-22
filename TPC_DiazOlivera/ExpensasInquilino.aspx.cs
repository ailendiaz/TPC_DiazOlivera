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
    public partial class ExpensasInquilino : System.Web.UI.Page
    {
        public Inquilino inquilino { get; set; }
        public List<ExpensaIndividual> listaExpensas = null;
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

            try
            {
                ExpensaIndividualNegocio negocio = new ExpensaIndividualNegocio();
                if (Request.QueryString["ver"] == "impagas")
                {
                    listaExpensas = negocio.Listar(inquilino.departamento.ID).FindAll(x=>x.estado.estado.ToLower()=="impaga".ToLower());
                }
                else 
                {
                    listaExpensas = negocio.Listar(inquilino.departamento.ID);
                }


            }
            catch (Exception ex)
            {

                throw ex;
            }
            

        }
    }
}