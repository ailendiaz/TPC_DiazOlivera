using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using Dominio;

namespace TPC_DiazOlivera
{
    public partial class Mail : System.Web.UI.Page
    {
        public Administrador admin = null;
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
                Response.Redirect("ErrorInquilino.aspx");
            }
        }

        protected void EnviarMensaje_Click(object sender, EventArgs e)
        {
           
            MailMessage mensaje = new MailMessage();
            

            mensaje.From = new MailAddress("dirección@dominio.com", txtAdmin.Text);
            mensaje.To.Add(new MailAddress(" destino@dominio.com ", txtDestinatario.Text));
            
            mensaje.Subject = txtAsunto.Text;
            mensaje.Body = txtMensaje.Text;
            mensaje.IsBodyHtml = true;
            mensaje.Priority = MailPriority.High;
            SmtpClient cliente = new SmtpClient("mailserver.domain.com");
            cliente.Send(mensaje);


        }
    }
}
    