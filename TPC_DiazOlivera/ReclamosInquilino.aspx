<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReclamosInquilino.aspx.cs" Inherits="TPC_DiazOlivera.ReclamosInquilino" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
      <%-- <link rel="stylesheet" href="../Estilo/ReclamosInquilino.css" type="text/css" />--%>


    <h1 style="color:antiquewhite">Realizar Reclamos:</h1>
    
    <div>
    <asp:Label ID="lblReclamos" runat="server" Text="Asunto:"></asp:Label> <asp:TextBox ID="txtReclamo" runat="server"></asp:TextBox>
        </div>
  <div>
    <asp:Label ID="lblFechaHora" runat="server" Text="Fecha y Hora:"></asp:Label> 
      </div>
    <div>
    <asp:Label ID="lblDetalle" runat="server" Text="Detalle:"></asp:Label> <asp:TextBox ID="txtDetalle" runat="server"></asp:TextBox>
         </div>

    <asp:Button ID="btEnviar" runat="server" Text="Enviar" Onclick="btEnviar_Click" />
    <asp:Button ID="btCancelar" runat="server" Text="Cancelar" Onclick="btCancelar_Click" />
         
</asp:Content>
