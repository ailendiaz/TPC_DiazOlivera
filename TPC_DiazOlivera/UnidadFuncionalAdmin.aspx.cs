﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TPC_DiazOlivera
{
    public partial class UnidadFuncionalAdmin : System.Web.UI.Page
    {
        public Administrador admin = null;
        public Depto depto { get; set; }
        public string ver{ get; set; }
        public List<Depto> listaDepto = null;
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
                DeptoNegocio negocio = new DeptoNegocio();
                //ver = Request.QueryString["ver"];
                ver = ddlOpcion.SelectedValue;
                listaDepto = negocio.ListarDepto();
            }
            catch (Exception ex)
            {

                throw ex;
            }
           
        }

        protected void btnAceptarAlta_Click(object sender, EventArgs e)
        {
            try
            {
                DeptoNegocio negocioDepto = new DeptoNegocio();
                Inquilino inquilino = new Inquilino();
                InquilinoNegocio negocioInquilino = new InquilinoNegocio();

                //inquilino = negocioInquilino.BuscarInquilinoXDNI(txtDNIAlta.Text);
                inquilino.departamento = new Depto();
                inquilino.departamento.torre = Convert.ToInt32(txtTorreAlta.Text);
                inquilino.departamento.piso = Convert.ToInt32(txtPisoAlta.Text);
                inquilino.departamento.numero = Convert.ToInt32(txtNumeroAlta.Text);
                negocioDepto.Guardar(inquilino.departamento);
                //negocioDepto.Guardar(inquilino);

                //negocioInquilino.AsignarDepto(inquilino);

                Response.Redirect("Administrador.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
            
        }

        protected void btnAceptarBaja_Click(object sender, EventArgs e)
        {
            try
            {
                DeptoNegocio negocio = new DeptoNegocio();
                depto = new Depto();
                depto.torre = Convert.ToInt32(txtTorreBaja.Text);
                depto.piso = Convert.ToInt32(txtPisoBaja.Text);
                depto.numero = Convert.ToInt32(txtNumeroBaja.Text);
                negocio.Eliminar(depto);

                Response.Redirect("Administrador.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DeptoNegocio Negocio = new DeptoNegocio();
            listaDepto = Negocio.ListarDepto().FindAll(x => x.ID == Convert.ToInt64(txtBuscar.Text));
        }
    }
}