<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NovedadesInquilino.aspx.cs" Inherits="TPC_DiazOlivera.NovedadesInquilino" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
      

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="row">
     <%int con = 0; %>
  <%foreach (Dominio.Novedades item in listaNovedades)     
        {%>
        <%con++;%>
     <div class="col-md-4">
        
    <div class="card text-white bg-secondary mb-3" style="max-width: 18rem;">
        <div class="card-header"><%=con %> <%=item.fechaHora%></div>
        <div class="card-body">
            <p class="card-text"><%=item.detalle%></p>
        </div>
    </div>
            
        </div>
   <%} %>
    </div>

</asp:Content>
