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
        public List<Tipo>listaABM { get; set; }
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
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                Session.Add("MensajeError", "No cuenta con el permiso para Ingresar a esta seccion");
                Response.Redirect("ErrorInquilino.aspx"); ;
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

                    TipoNegocio negocioABM = new TipoNegocio();
                    listaABM= new List<Tipo>();
                    listaABM = negocioABM.ListarTipoABM();
                    ddlABM.DataSource = listaABM;
                    ddlABM.DataTextField = "tipo";
                    ddlABM.DataValueField = "ID";
                    ddlABM.DataBind();
                    
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
                if (ddlABM.SelectedValue == "1")
                {
                    //txtDNI.Text = "";
                    //txtApellidos.Text = "";
                    //txtNombres.Text = "";
                    //txtNacimiento.Text = "";
                    //txtMail.Text = "";

                }
                    


                

            }
            catch (Exception ex)
            {

                throw ex;
            }
            

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
                return;
            try
            {
                
                if (ddlABM.SelectedValue == "1")
                {
                    
                    
                    if (ddlTipos.SelectedValue == "2")
                    {
                        Inquilino inquilino = new Inquilino();
                        InquilinoNegocio negocio = new InquilinoNegocio();
                        inquilino.departamento = new Depto();
                        inquilino.departamento.torre = Convert.ToInt32(txtTorre.Text);
                        inquilino.departamento.piso = Convert.ToInt32(txtPiso.Text);
                        inquilino.departamento.numero = Convert.ToInt32 (txtNumero.Text);
                        inquilino.DNI = txtDNI.Text;
                        inquilino.nombre = txtNombres.Text;
                        inquilino.apellido = txtApellidos.Text;
                        inquilino.email = txtMail.Text;
                        inquilino.genero = Convert.ToString(txtGenero.Text);
                        //inquilino.genero = 'F';
                        inquilino.telefonos = new List<Telefono>();
                        Telefono aux = new Telefono();
                        aux.telefono = txtTelefono.Text;
                        inquilino.telefonos.Add(aux);
                        inquilino.fechaNac = Convert.ToDateTime(txtNacimiento.Text);
                        inquilino.tipoUsuario = new Tipo();
                        inquilino.tipoUsuario.ID = 2;
                        negocio.AltaInquilino(inquilino);
                        negocio.AsignarDepto(inquilino);
                        
                    }
                    else
                    {
                        Administrador administrador = new Administrador();
                        administrador.DNI = txtDNI.Text;
                        administrador.nombre = txtNombres.Text;
                        administrador.apellido= txtApellidos.Text;
                        administrador.email = txtMail.Text;
                        administrador.fechaNac = Convert.ToDateTime(txtNacimiento.Text);
                        administrador.genero = Convert.ToString(txtGenero.Text);
                        //administrador.genero = 'F'; //CAMBIAR A TEXTBOX

                        administrador.telefonos = new List<Telefono>();
                        Telefono aux = new Telefono();
                        aux.telefono = txtTelefono.Text;
                        administrador.telefonos.Add(aux);
                        administrador.tipoUsuario = new Tipo();
                        administrador.tipoUsuario.ID = 1;
                        AdministradorNegocio negocio = new AdministradorNegocio();
                        negocio.AltaAdministrador(administrador);

                    }
 
                }
                else if (ddlABM.SelectedValue == "2")
                {
                    Persona persona = new Persona();
                    PersonaNegocio negocio = new PersonaNegocio();
                    persona.DNI = txtDNI.Text;
                    negocio.BajaUsuario(persona);
                    Response.Redirect("Administrador.aspx");
                }

                        else
                        {
                          Persona persona = new Persona();
                          PersonaNegocio negocio = new PersonaNegocio();
                          persona.DNI = txtDNI.Text;
                          persona.apellido = txtApellidos.Text;
                          persona.nombre = txtNombres.Text;
                          persona.email = txtMail.Text;
                          persona.genero = Convert.ToString(txtGenero.Text); 
                          persona.telefonos = new List<Telefono>();
                          Telefono aux = new Telefono();
                          aux.telefono = txtTelefono.Text;
                          persona.telefonos.Add(aux);
                          persona.fechaNac = Convert.ToDateTime(txtNacimiento.Text);
                          negocio.ModificacionUsuario(persona);
                          Response.Redirect("Administrador.aspx");

                         }

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

        protected void txtDNI_TextChanged(object sender, EventArgs e)
        {
            Persona persona = new Persona();
            PersonaNegocio negocio = new PersonaNegocio();
            if (txtDNI.Text !=""&& ddlABM.SelectedValue!="1" )
            { 
            persona = negocio.BuscarPersonaXDNI(txtDNI.Text);
            txtApellidos.Text = persona.apellido;
            txtNombres.Text = persona.nombre;
            txtMail.Text = persona.email;
            txtNacimiento.Text = persona.fechaNac.ToShortDateString();
            txtTelefono.ReadOnly = true;
            txtPiso.ReadOnly = true;
            txtTorre.ReadOnly = true;
            txtNumero.ReadOnly = true;
            txtPiso.Text = "";
            txtTorre.Text = "";
            txtNumero.Text = "";
            }
        

    }

        //protected void ddlTipos_SelectedIndexChanged1(object sender, EventArgs e)
        //{

        //}
    }
}