<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AltaUsuario.aspx.cs" Inherits="TPC_DiazOlivera.AltaUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheet" runat="server">
    <link rel="stylesheet" href="../Estilo/ABMUsuario.css" type="text/css" />

     <h3 style="color:lavender;">Ingreso de Usuario</h3>
    <br />
    <div class="contenedor">
   <div id="page" class="container" style="align-content:center">
       <div>
        <asp:Label ID="lblFecha"  style="color:white; font-weight: bold" Text="Fecha" runat="server" />
    <br />  
           </div>
       <div>
        <asp:Label ID="lblTipoUsuario" style="color:white; font-weight: bold" Text="Tipo de Usuario" runat="server" />
          
                <%--<div class="form-group" >--%>
                     
                <%--<asp:DropDownList ID="ddlTipos" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTipos_SelectedIndexChanged">--%>
                <asp:DropDownList ID="ddlTipos" runat="server" AutoPostBack="true">
                </asp:DropDownList>
                              
                </div>
        <div>
    <asp:Label ID="lblABM" style="color:white; font-weight: bold" Text="Tipo de Operación" runat="server" />
    <%-- <div class="form-group" >--%>
                     
                <%--<asp:DropDownList ID="ddlTipos" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTipos_SelectedIndexChanged">--%>
                <asp:DropDownList ID="ddlABM" runat="server" AutoPostBack="true">
                </asp:DropDownList>
                              
                </div>
            
    <div <%--class="form-group"--%>>
        <asp:Label ID="lblDNI" style="color:white; font-weight: bold" Text="DNI" runat="server" />
        <asp:TextBox ID="txtDNI" AutoPostBack="true" OnTextChanged="txtDNI_TextChanged" runat ="server" /> 
        </div>
    
    <div <%--class="form-group"--%>>
        <asp:Label ID="lblNombres" style="color:white; font-weight: bold" Text="Nombre" runat="server" />
        <asp:TextBox ID="txtNombres" runat="server" /> 
        </div>
    
    <div <%--class="form-group"--%>>
        <asp:Label ID="lblApellidos" style="color:white; font-weight: bold" Text="Apellido" runat="server" />
        <asp:TextBox ID="txtApellidos" runat="server" /> 
        </div>
    <div <%--class="form-group"--%>>
        <asp:Label ID="lblGenero" style="color:white; font-weight: bold" Text="Genero" runat="server" />
         <asp:TextBox ID="txtGenero" runat="server" />
        </div>
    
    <div <%--class="form-group"--%>>
        <asp:Label ID="lblNacimiento" style="color:white; font-weight: bold" Text="Fecha Nacimiento" runat="server" />
        <asp:TextBox ID="txtNacimiento" runat="server" /> 
        </div>
    
    <div <%-- class="form-group"--%>>
        <asp:Label ID="lblMail" style="color:white; font-weight: bold"  Text="@mail" runat="server" />
        <asp:TextBox ID="txtMail" runat="server" /> 
        </div>
    <div <%-- class="form-group"--%>>
        <asp:Label ID="lblTelefono" style="color:white; font-weight: bold" Text="Telefono" runat="server" />
        <asp:TextBox ID="txtTelefono" runat="server" /> 
    </div>
   <div <%-- class="form-group"--%>>
        <asp:Label ID="lblTorre" style="color:white; font-weight: bold" Text="Torre" runat="server" />
        <asp:TextBox ID="txtTorre" runat="server" /> 
         </div>
    
    <div <%-- class="form-group"--%>>
        <asp:Label ID="lblPiso" style="color:white; font-weight: bold" Text="Piso" runat="server" />
        <asp:TextBox ID="txtPiso"   runat="server" /> 
         </div>
    
     <div <%-- class="form-group"--%>>
        <asp:Label ID="lblNumero" style="color:white; font-weight: bold" Text="Numero" runat="server" />
        <asp:TextBox ID="txtNumero"  runat="server" /> 
          </div>
    <br />

     <div>
        <asp:Button ID="btnAceptar" Text="Aceptar" onclick="btnAceptar_Click" CssClass="btn btn-secondary" runat="server" />
        <asp:Button ID="btnCancelar" Text="Cancelar" OnClick="btnCancelar_Click" CssClass="btn btn-secondary" runat="server" />
         </div>
    <%-- <br />--%>
      
       </div>

    </div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainAdm" runat="server">
   
</asp:Content>
