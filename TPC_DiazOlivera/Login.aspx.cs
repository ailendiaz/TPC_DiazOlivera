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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       protected void btnIngresar (object sender, EventArgs e)
        {
            Persona user = new Persona();
            PersonaNegocio negocio = new PersonaNegocio();
            user.email = txtUsuario.Text;
            user.contrasenia = txtContraseña.Text;

            user = negocio.login(user);

            if (user.tipoUsuario.ID == 1)
                Response.Redirect("Inquilino.aspx");
                    else if (user.tipoUsuario.ID == 2)
                Response.Redirect("Administrador.aspx");
            else
                Response.Redirect("Login.aspx");




        }
    }
}