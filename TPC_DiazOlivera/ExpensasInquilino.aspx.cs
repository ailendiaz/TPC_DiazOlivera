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
            if (Session["Usuario"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            try
            {
                
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
                
                    if (Request.QueryString["ID"] != null && Request.QueryString["estado"] != null)
                {
                    int ID = Convert.ToInt32(Request.QueryString["ID"]);
                    string estadoExp = Request.QueryString["estado"];

                    ExpensaIndividualNegocio negocioExp = new ExpensaIndividualNegocio();
                    ExpensaIndividual expensaInd = new ExpensaIndividual();
                    expensaInd.transaccion = txtOperacion.Text;
                    negocioExp.CargarTransaccion(expensaInd, ID);
                    negocioExp.ModificarEstado(ID, estadoExp.ToLower());
                }
                
                
                ExpensaIndividualNegocio negocio = new ExpensaIndividualNegocio();               
                if (Request.QueryString["ver"] == "impagas")
                {
                    listaExpensas = negocio.Listar(inquilino.departamento.ID).FindAll(x=>x.estado.estado.ToLower()!="paga".ToLower());
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