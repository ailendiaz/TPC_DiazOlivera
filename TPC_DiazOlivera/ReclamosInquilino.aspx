<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReclamosInquilino.aspx.cs" Inherits="TPC_DiazOlivera.ReclamosInquilino" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
      <link rel="stylesheet" href="../Estilo/ReclamosInquilino.css" type="text/css" />

    
    <h1 style="color:antiquewhite">Realizar Reclamos:</h1>
   

    <div class="form-group">
    <asp:Label ID="lblAsunto" runat="server" Text="Asunto:" CssClass="label">
    </asp:Label> <asp:TextBox ID="txtAsunto" runat="server"></asp:TextBox>
         </div> 
    <div class="form-group">
    <asp:Label ID="lblFechaHora" runat="server" Text="Fecha y Hora:" CssClass="label"></asp:Label>
         </div>
<div class="form-group">
    <asp:Label ID="lblDetalle" runat="server" Text="Detalle:" CssClass="label"> </asp:Label> 
    <asp:TextBox ID="txtDetalle" runat="server" CssClass="txtDetalle"></asp:TextBox>
      </div>
  
    <div class="form-group row">
    <asp:Button ID="btEnviar" runat="server" Text="Enviar" Onclick="btEnviar_Click" CssClass="boton" />
    <asp:Button ID="btCancelar" runat="server" Text="Cancelar" Onclick="btCancelar_Click" CssClass="boton" />
          </div>
      
</asp:Content>
