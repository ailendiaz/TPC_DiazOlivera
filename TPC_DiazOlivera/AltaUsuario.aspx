﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AltaUsuario.aspx.cs" Inherits="TPC_DiazOlivera.AltaUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Estilo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainAdm" runat="server">
    <h1 style="color:white;">Ingreso de Usuario</h1>
    <br />
   
        <asp:Label ID="lblFecha"  style="color:white; font-weight: bold" Text="Fecha" runat="server" />
    <br />  
        <asp:Label ID="lblTipoUsuario" style="color:white; font-weight: bold" Text="Tipo de Usuario" runat="server" />
          
                <div class="form-group" >
                     
                <%--<asp:DropDownList ID="ddlTipos" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTipos_SelectedIndexChanged">--%>
                <asp:DropDownList ID="ddlTipos" runat="server" AutoPostBack="true">
                </asp:DropDownList>
                              
                </div>
            
    <br />
        <asp:Label ID="lblDNI" style="color:white; font-weight: bold" Text="DNI" runat="server" />
        <asp:TextBox ID="txtDNI" runat="server" /> 
    <br />
        <asp:Label ID="lblNombres" style="color:white; font-weight: bold" Text="Nombre" runat="server" />
        <asp:TextBox ID="txtNombres" runat="server" /> 
    <br />
        <asp:Label ID="lblApellidos" style="color:white; font-weight: bold" Text="Apellido" runat="server" />
        <asp:TextBox ID="txtApellidos" runat="server" /> 
    <br />
        <asp:Label ID="lblGenero" style="color:white; font-weight: bold" Text="Genero" runat="server" />
        <p style="color:white; font-weight: bold" >radiobuttonlist para elegir entre femenino y masculino</p>
    <br />
        <asp:Label ID="lblNacimiento" style="color:white; font-weight: bold" Text="Fecha Nacimiento" runat="server" />
        <asp:TextBox ID="txtNacimiento" runat="server" /> 
    <br />
        <asp:Label ID="lblMail" style="color:white; font-weight: bold"  Text="@mail" runat="server" />
        <asp:TextBox ID="txtMail" runat="server" /> 
    <br />
        <asp:Label ID="lblTelefono" style="color:white; font-weight: bold" Text="Telefono" runat="server" />
        <asp:TextBox ID="txtTelefono" runat="server" /> 
    <br />
        <asp:Label ID="lblTorre" style="color:white; font-weight: bold" Text="Torre" runat="server" />
        <asp:TextBox ID="txtTorre" runat="server" /> 
    <br />
        <asp:Label ID="lblPiso" style="color:white; font-weight: bold" Text="Piso" runat="server" />
        <asp:TextBox ID="txtPiso" runat="server" /> 
    <br />
        <asp:Label ID="lblNumero" style="color:white; font-weight: bold" Text="Numero" runat="server" />
        <asp:TextBox ID="txtNumero" runat="server" /> 
    <br />

     
        <asp:Button ID="btnAceptar" Text="Aceptar" onclick="btnAceptar_Click" runat="server" />
        <asp:Button ID="btnCancelar" Text="Cancelar" OnClick="btnCancelar_Click" runat="server" />
    
</asp:Content>