<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="NovedadesAdm.aspx.cs" Inherits="TPC_DiazOlivera.NovedadesAdm" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheet" runat="server">
<link rel="stylesheet" href="../Estilo/NovedadesAdm.css" type="text/css" />

 <h3 style="color:#393D42; text-shadow: 2px 2px 5px white;">Cargar Novedades </h3>

<div class="contenedorAdm">
   <div id="page" class="container" style="align-content:center">
   

      <div>
        <asp:Label ID="Label1"  Text="Fecha y Hora:" runat="server" style="color:white"/>
        <asp:TextBox ID="txtFechaHora" Class="form-control" runat="server" /> 
        <asp:RequiredFieldValidator ID="validacionFecha" ErrorMessage= "Debe ingresar una fecha" runat="server" ControlToValidate="txtFechaHora"></asp:RequiredFieldValidator>
          <asp:RangeValidator id="validarFecha" runat="server" ControlToValidate="txtFechaHora" MaximumValue="31/12/2050" MinimumValue= "30/11/2020" Type="Date" Display="Dynamic" ErrorMessage="*Fecha invalida"></asp:RangeValidator>
    </div>
    <div>
        <asp:Label ID="lblDetalle"  Text="Detalle:" runat="server" style="color:white" />
        <asp:TextBox ID="txtDetalle" Class="form-control" runat="server" height="150px" textmode="multiline"/>  
        <asp:RequiredFieldValidator ID="ValidacionDetalle" ErrorMessage= "Debe ingresar un detalle" runat="server" ControlToValidate="txtDetalle"></asp:RequiredFieldValidator>
        

    </div>
   <div>
       <br />
         <asp:Button ID="btnPublicar" Text="Publicar" runat="server" Onclick="btnPublicar_Click" class="btn btn-secondary "/>
       <a class="btn btn-secondary" href="Administrador.aspx">Cancelar</a>
       </div>
        </div>
       
  </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainAdm" runat="server">
 
        
</asp:Content>
