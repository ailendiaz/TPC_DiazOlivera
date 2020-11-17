<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="NovedadesAdm.aspx.cs" Inherits="TPC_DiazOlivera.NovedadesAdm" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Estilo" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainAdm" runat="server">
  <h3 style="color:antiquewhite">Cargar Novedades: </h3>

    <div class="container-center">
      <div class="form-group col-md-2">
        <asp:Label ID="Label1"  Text="Fecha y Hora:" runat="server" style="color:antiquewhite"/>
        <asp:TextBox ID="txtFechaHora" Class="form-control" runat="server" />  
    </div>
    <div class="form-group col-md-4 ">
        <asp:Label ID="lblDetalle"  Text="Detalle:" runat="server" style="color:antiquewhite" />
        <asp:TextBox ID="txtDetalle" Class="form-control" runat="server" />  
    </div>
   
         <asp:Button ID="btnPublicar" Text="Publicar" runat="server" Onclick="btnPublicar_Click" class="btn btn-primary"/>
         <asp:Button ID="btnCancelar" Text="Cancelar" runat="server" Onclick="btnCancelar_Click" class="btn btn-primary"/>

        </div>

  
        
</asp:Content>
