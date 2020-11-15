using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
using System.Data.SqlTypes;

namespace TPC_DiazOlivera
{
    public partial class ExpensasAdmin : System.Web.UI.Page
    {
        List<Gastos> listaGastos = null;
        public void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["listaGastos"] == null)
            {
                listaGastos = new List<Gastos>();
                
            }
            else 
            { 
                listaGastos = (List<Gastos>)Session["listaGastos"];
            }

            
                Gastos aux = new Gastos();
                List<Tipo> tiposGasto = new List<Tipo>();
                TipoNegocio negocio = new TipoNegocio();
                tiposGasto = negocio.ListarTipoGasto();


            txtFecha.Text = Convert.ToString(DateTime.Now);
            ddlTipoGasto.DataSource = tiposGasto;
            ddlTipoGasto.DataTextField = "tipo";
            ddlTipoGasto.DataValueField = "ID";
            ddlTipoGasto.DataBind();
            txtImporte.Text = "Importe";

            aux.fechaHora = Convert.ToDateTime(txtFecha.Text);
            aux.tipo.ID = Convert.ToInt32(ddlTipoGasto.SelectedValue);
            aux.importe = Convert.ToDecimal(txtImporte.Text);
            
            

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (listaGastos != null)
            {
                Session["listaGastos"] = listaGastos;
            }
            Response.Redirect("ExpensasAdmin.aspx");

            //Session.Add("listagastos", listaGastos);

        }

        protected void btnAgregarTipoGasto_Click(object sender, EventArgs e)
        {
            Tipo aux = new Tipo();
            TipoNegocio negocio = new TipoNegocio();

            aux.tipo = txtAgregarTipoGasto.Text;
            negocio.AgregarTipoGasto(aux);

            Response.Redirect("ExpensasAdmin.aspx");
            

        }
    }
}