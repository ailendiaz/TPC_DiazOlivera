<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Mail.aspx.cs" Inherits="TPC_DiazOlivera.Mail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headAdministrador" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Stylesheet" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainAdm" runat="server">

    <h3> Comunicar Estado de Reclamo: </h3>

  Emisor: <asp:textbox id="txtAdmin" runat="server" /><br>
  Destinatario: <asp:textbox id="txtDestinatario" runat="server" /><br>
  Asunto: <asp:textbox id="txtAsunto" runat="server" /><br>
  Texto del mensaje:<br/>
 <asp:textbox id="txtMensaje" runat="server" height="150px" textmode="multiline" /><br>
 <asp:button id="EnviarMensaje" runat="server" onclick="EnviarMensaje_Click" text="Enviar" /><br>

</asp:Content>
