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
    public partial class Login : System.Web.UI.Page
    {
        public Persona user = null;
        public Administrador admin { get; set; }
        public Inquilino inquilino { get; set; }
        public bool PrimerLogin { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Usuario"] != null) 
            //{ 
            //    try
            //    {
            //        admin = (Administrador)Session["Usuario"];
            //        Response.Redirect("Administrador.aspx");
            //    }
            //    catch (Exception ex)
            //    {
            //        inquilino = (Inquilino)Session["Usuario"];
            //        Response.Redirect("Inquilino.aspx");
            //    }
            //}
            
            if (Request.QueryString["Logout"] == "1")
            {
                Session["Usuario"] = null;
            }

            else if (Convert.ToBoolean(Request.QueryString["PrimerLogin"]))
            {
                PrimerLogin = true;
                try
                {
                    user = (Persona)Session["Usuario"];
                    txtDNIPrimerLogin.Text = user.DNI;
                    txtDNIPrimerLogin.ReadOnly = true;
                }
                catch (Exception)
                {
                    Session["Usuario"] = null;
                    Response.Redirect("Login.aspx");
                }
            }
            else
            {
                PrimerLogin = false;
            }

        }

       protected void btnIngresar (object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
                return;

            user = new Persona();
            PersonaNegocio negocio = new PersonaNegocio();
            user.tipoUsuario = new Tipo();
            user.DNI = txtUsuario.Text;
            user.contraseña = txtContraseña.Text;

            user = negocio.Login(user);
            if (user.ID == 0)
            {
                //Insertar mensaje de que no encontro el usuario
                Response.Redirect("Login.aspx");
            }
            string DNIencriptado = negocio.EncriptarDNI(user.ID);
            if (DNIencriptado == user.contraseña)
            {
                Session.Add("Usuario", user);
                Response.Redirect("Login.aspx?PrimerLogin=true");
            }


            if (user.tipoUsuario.ID == 1 || user.tipoUsuario.ID == 3)
            {
                Administrador admin = new Administrador();
                AdministradorNegocio negocioAdmin = new AdministradorNegocio();
                admin = negocioAdmin.BuscarAdmin(user.ID);
                Session.Add("Usuario", admin);

                Response.Redirect("Administrador.aspx");
            }
            else if (user.tipoUsuario.ID == 2 || user.tipoUsuario.ID == 3)
            {
                Inquilino inquilino = new Inquilino();
                InquilinoNegocio negocioInquilino = new InquilinoNegocio();
                inquilino = negocioInquilino.BuscarInquilino(user.ID);
                Session.Add("Usuario", inquilino);

                Response.Redirect("Inquilino.aspx");
            }
            else
                Response.Redirect("Login.aspx");

        }

        protected void btnAceptarNuevaContraseña_Click(object sender, EventArgs e)
        {
            if(txtContraseñaPrimerLogin.Text == txtConfirmarContraseña.Text)
            {
                user.contraseña = txtContraseñaPrimerLogin.Text;
                if (user.DNI == user.contraseña)
                {
                    Response.Redirect("Login.aspx?PrimerLogin=true");
                }
                PersonaNegocio negocio = new PersonaNegocio();
                negocio.ModificarContraseña(user);
                Session["Usuario"] = null;
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx?PrimerLogin=true");
            }
        }

        protected void ValidarUsuario_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            user = new Persona();
            PersonaNegocio negocio = new PersonaNegocio();
            user.tipoUsuario = new Tipo();
            user.DNI = txtUsuario.Text;
            user.contraseña = txtContraseña.Text;

            user = negocio.Login(user);
            if (user.ID == 0)
            {
                args.IsValid = false;
            }
            else 
                args.IsValid = true;


        }

    }




}