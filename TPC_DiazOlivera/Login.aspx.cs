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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Logout"] == "1")
            {
                Session["Usuario"] = null;
            }
        }

       protected void btnIngresar (object sender, EventArgs e)
        {
            
            
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

            if (user.DNI == user.contraseña)
            {
                //Response.Redirect("Registrar_Contraseña.aspx");
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
    }
}