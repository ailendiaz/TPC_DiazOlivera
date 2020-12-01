using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using Dominio;
using Negocio;

namespace TPC_DiazOlivera
{
    public partial class Mail : System.Web.UI.Page
    {
        public Persona persona { get; set; }
        public Administrador admin = null;
        public Inquilino inquilino { get; set; }
        public Mensaje mensaje { get; set; }
        public List<Mensaje> listaMensajes = null;
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

            try
            {
                if (Request.QueryString["ID"] != null && Request.QueryString["Reclamo"]!=null)
                {
                    InquilinoNegocio negocio = new InquilinoNegocio();
                    inquilino = negocio.BuscarInquilino(Convert.ToInt64(Request.QueryString["ID"]));
                    txtDestinatario.Text = inquilino.email;
                    txtAdmin.Text = admin.email;
                    txtReclamo.Text = Request.QueryString["Reclamo"];
                    txtDestinatario.ReadOnly = true;
                    txtAdmin.ReadOnly = true;
                    txtReclamo.ReadOnly = true;
                }
                else
                {
                    MensajeNegocio negocio = new MensajeNegocio();
                    listaMensajes = negocio.ListarPropios(admin.ID);
                    if (listaMensajes==null)
                    {
                        listaMensajes = new List<Mensaje>();
                    }
                }
                
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
            
        }

        protected void EnviarMensaje_Click(object sender, EventArgs e)
        {
            mensaje = new Mensaje();
            mensaje.asunto = txtAsunto.Text;
            mensaje.detalle = txtMensaje.Text;
            mensaje.IDEmisor = admin.ID;
            mensaje.IDReceptor = inquilino.ID;
            mensaje.fechaHora = DateTime.Now;
            mensaje.IDReclamo = Convert.ToInt64(txtReclamo.Text);
            MensajeNegocio negocio = new MensajeNegocio();
            negocio.Guardar(mensaje);
            Response.Redirect("Reclamos.aspx");
            
            //MailMessage mensaje = new MailMessage();
            

            //mensaje.From = new MailAddress("dirección@dominio.com", txtAdmin.Text);
            //mensaje.To.Add(new MailAddress(" destino@dominio.com ", txtDestinatario.Text));
            
            //mensaje.Subject = txtAsunto.Text;
            //mensaje.Body = txtMensaje.Text;
            //mensaje.IsBodyHtml = true;
            //mensaje.Priority = MailPriority.High;
            //SmtpClient cliente = new SmtpClient("mailserver.domain.com");
            //cliente.Send(mensaje);

        }
    }
}
    