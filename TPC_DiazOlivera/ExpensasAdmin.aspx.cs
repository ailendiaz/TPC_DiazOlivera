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
        public List<Gastos> listaGastos = null;
        public List<ExpensaIndividual> listaExpensas=null;
        public Administrador admin = null;
        public string ver = null;
        public void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            try
            {
                admin = (Administrador)Session["Usuario"];
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                Session.Add("MensajeError", "No cuenta con el permiso para Ingresar a esta seccion");
                Response.Redirect("ErrorInquilino.aspx");
            }

            if (Session["listaGastos"] == null)
            {
                listaGastos = new List<Gastos>();
                
            }
            else 
            { 
                listaGastos = (List<Gastos>)Session["listaGastos"];
            }

            ver = Request.QueryString["ver"];

            if (ver=="pagos")
            {
                listaExpensas = new List<ExpensaIndividual>();
                ExpensaIndividualNegocio negocioExpensa = new ExpensaIndividualNegocio();

                if (Request.QueryString["ID"]!=null && Request.QueryString["estado"] != null)
                {
                    
                    try
                    {
                        negocioExpensa.ModificarEstado(Convert.ToInt32(Request.QueryString["ID"]), Request.QueryString["estado"].ToLower());


                    }
                    catch (Exception ex)
                    {

                        throw ex;
                    }

                }
                listaExpensas = negocioExpensa.Listar();
            }
            else { 
                Gastos aux = new Gastos();
                List<Tipo> tiposGasto = new List<Tipo>();
                TipoNegocio negocio = new TipoNegocio();
                tiposGasto = negocio.ListarTipoGasto();
            


            if (!IsPostBack) 
            { 
                txtFecha.Text = Convert.ToString(DateTime.Now);
                ddlTipoGasto.DataSource = tiposGasto;
                ddlTipoGasto.DataTextField = "tipo";
                ddlTipoGasto.DataValueField = "ID";
                ddlTipoGasto.DataBind();
            }
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Gastos aux= new Gastos();
            aux.tipo = new Tipo();
            aux.fechaHora = Convert.ToDateTime(txtFecha.Text);
            aux.importe = Convert.ToDecimal(txtImporte.Text);

            aux.tipo.ID = Convert.ToInt32(ddlTipoGasto.SelectedItem.Value);
            aux.tipo.tipo = ddlTipoGasto.SelectedItem.Text;
            

            listaGastos.Add(aux);

            if (listaGastos != null)
            {
                Session["listaGastos"] = listaGastos;
            }

            Response.Redirect("ExpensasAdmin?ver=gestion");

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

        protected void Confeccionar_Click(object sender, EventArgs e)
        {
            try
            {
                if (listaGastos == null)
                {
                    Response.Redirect("/ExpensasAdmin.aspx");
                }
                //GUARDAMOS LA EXPENSA
                ExpensasNegocio negocioExpensas = new ExpensasNegocio();
                Expensas expensa = new Expensas();
                SqlMoney acuExpensa = 0;
                foreach (Gastos item in listaGastos)
                {
                    acuExpensa += item.importe;
                }
                expensa.fecha = Convert.ToDateTime(txtFecha.Text);
                expensa.total = acuExpensa;
                negocioExpensas.GuardarExpensa(expensa);
                Int64 IDExpensa = negocioExpensas.UltimoID();
                expensa.ID = IDExpensa;

                //GUARDAMOS LOS GASTOS
                foreach (Gastos item in listaGastos)
                {
                    GastosNegocio negocioGastos = new GastosNegocio();
                    negocioGastos.GuardarGastos(item, IDExpensa);
                }

                //GENERAMOS LA EXPENSA INDIVIDUAL
                UnidadFuncionalNegocio UFNegocio = new UnidadFuncionalNegocio();
                List<UnidadFuncional> listaUF = new List<UnidadFuncional>();
                listaUF = UFNegocio.ListarUF();
                foreach (UnidadFuncional item in listaUF)
                {
                    negocioExpensas.GuardarExpensaIndividual(expensa,item.ID);
                }

                Session["listaGastos"] = null;
                Response.Redirect("Administrador.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
            
            
        }
    }
}