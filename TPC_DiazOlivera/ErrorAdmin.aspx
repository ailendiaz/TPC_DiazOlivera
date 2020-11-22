<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="ErrorAdmin.aspx.cs" Inherits="TPC_DiazOlivera.ErrorAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Estilo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainAdm" runat="server">
    <h1 style="color:white;">Error!</h1>
    <hr />
    <div>
        <h3 style="color:white;">Mensaje: <%=mensajeError %></h3>
    </div>
    <br />
    <br />
    <div>        
        <a class="btn btn-primary" href="Administrador.aspx" style="color:white;font-weight:bold;" >volver</a>        
    </div>   
    <br />
    <br />   
    <div>
        <p style="color:white;font-weight:bold"><% ="ERROR: "+exception.ToString() %></p>
    </div>
    
</asp:Content>
