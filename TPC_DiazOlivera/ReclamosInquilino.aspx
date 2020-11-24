<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReclamosInquilino.aspx.cs" Inherits="TPC_DiazOlivera.ReclamosInquilino" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
    <link rel="stylesheet" href="../Estilo/ReclamosInquilino.css" type="text/css" />

    <h3 class="text-left">Realizar Reclamos:</h3>

    <div id="page" class="container" style="border:solid">
 
  <div class="row">
    <div class="col-md-6 col-md-offset-3 text-center">
      <div class="form-group">
       
          <label for="lblAsunto" class="label">Asunto</label>  
            <asp:TextBox ID="txtAsunto" runat="server" CssClass="txtAsunto"></asp:TextBox>
        
      </div>
      <div class="form-group">
       
            <% DateTime ahora = DateTime.Now; %>
           <label for="lblFechaHora" class="label">Fecha y Hora: <% =ahora %></label>
      
      </div>
        <div class="form-group">
       
           <label for="lblDetalle"  class="label">Detalle:</label>
            <asp:TextBox ID="txtDetalle" runat="server" CssClass="txtDetalle" TextMode="MultiLine"></asp:TextBox>
    
      </div>
        <div class="form-group">
      
            <asp:Button ID="btEnviar" runat="server" Text="Enviar" OnClick="btEnviar_Click" Class="btn btn-secondary" />
            <asp:Button ID="btCancelar" runat="server" Text="Cancelar" OnClick="btCancelar_Click" Class="btn btn-secondary" />
       
      </div>
    </div>
  </div>
</div>

</asp:Content>
