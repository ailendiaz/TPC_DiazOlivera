<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ErrorInquilino.aspx.cs" Inherits="TPC_DiazOlivera.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headInquilino" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Stylesheets" runat="server">


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
   <h1 style="color:white;">Error!</h1>
    <hr />
    <div>
        <h3 style="color:white;">Mensaje: <%=mensajeError %></h3>
    </div>
    <br />
    <br />
    <div>        
        <a class="btn btn-primary" href="inquilino.aspx" style="color:white;font-weight:bold;" >volver</a>        
    </div>   
    <br />
    <br />   
    <div>
        <p style="color:white;font-weight:bold"><% ="ERROR: "+exception.ToString() %></p>
    </div>
</asp:Content>