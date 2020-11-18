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
    public partial class AltaUsuario : System.Web.UI.Page
    {
        Administrador admin = null;
        public List<Tipo> listaTipos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            try
            {
                admin = (Administrador)Session["Usuario"];
            }
            catch (Exception)
            {
                Response.Redirect("Inquilino.aspx");
            }
            
            try
            {
                if (!IsPostBack) 
                { 
                    TipoNegocio negocio = new TipoNegocio();
                    listaTipos = new List<Tipo>();
                    listaTipos = negocio.ListarTipoUsuario();
                    lblFecha.Text = Convert.ToString(DateTime.Now);
                    ddlTipos.DataSource = listaTipos;
                    ddlTipos.DataTextField = "tipo";
                    ddlTipos.DataValueField = "ID";
                    ddlTipos.DataBind();
                    txtPiso.ReadOnly = true;
                    txtTorre.ReadOnly = true;
                    txtNumero.ReadOnly = true;

                }
                if (ddlTipos.SelectedItem.Value == "2")
                {
                    txtPiso.ReadOnly = false;
                    txtTorre.ReadOnly = false;
                    txtNumero.ReadOnly = false;
                }
                else
                {
                    txtPiso.ReadOnly = true;
                    txtTorre.ReadOnly = true;
                    txtNumero.ReadOnly = true;
                    txtPiso.Text = "";
                    txtTorre.Text = "";
                    txtNumero.Text = "";
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Inquilino inquilino= new Inquilino();
                inquilino.tipoUsuario = new Tipo();
                inquilino.tipoUsuario.ID =Convert.ToInt32(ddlTipos.SelectedValue);
                inquilino.DNI = txtDNI.Text;
                inquilino.nombre = txtNombres.Text;
                inquilino.apellido = txtApellidos.Text;
                inquilino.email = txtMail.Text;
                inquilino.fechaNac = Convert.ToDateTime(txtNacimiento.Text);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Administrador.aspx");
        }

        protected void ddlTipos_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string a = ddlTipos.SelectedItem.Value;
            //if (a == "1")
            //{

            //}
        }

        //protected void ddlTipos_SelectedIndexChanged1(object sender, EventArgs e)
        //{

        //}
    }
}