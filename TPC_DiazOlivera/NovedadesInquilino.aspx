<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NovedadesInquilino.aspx.cs" Inherits="TPC_DiazOlivera.NovedadesInquilino" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
      
   
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
     <%int con = 0; %>
  <%foreach (Dominio.Novedades item in listaNovedades)     
        {%>
        <%con++;%>

    <div class="card text-white bg-secondary mb-3" style="max-width: 18rem;">
        <div class="card-header"><%=item.fechaHora%></div>
        <div class="card-body">
            <%--<h5 class="card-title"><%item.titulo%></h5>--%>
            <p class="card-text"><%=item.detalle%></p>
        </div>
    </div>
   <%} %>
    

</asp:Content>
