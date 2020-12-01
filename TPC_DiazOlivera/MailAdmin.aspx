<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="MailAdmin.aspx.cs" Inherits="TPC_DiazOlivera.Mail" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Stylesheet" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainAdm" runat="server">
    <h2 style="color:#393D42; padding:1%">Reportes</h2>
    <br />
    <%if (Request.QueryString["ID"] != null && Request.QueryString["Reclamo"]!=null)
        { %>
    <div class="container" style="margin-left:5px">
        <h3> Comunicar Estado de Reclamo: </h3>

        Emisor: <asp:textbox id="txtAdmin" runat="server" /><br>
        Destinatario: <asp:textbox id="txtDestinatario" runat="server" /><br>
        Reclamo: <asp:TextBox id="txtReclamo" runat="server" /> <br />
        Asunto: <asp:textbox id="txtAsunto" runat="server" /><br>
        Texto del mensaje:<br/>
        <asp:textbox id="txtMensaje" runat="server" height="150px" textmode="multiline" /><br>
        <asp:button id="EnviarMensaje" runat="server" onclick="EnviarMensaje_Click" text="Enviar" /><br>
        <br />
    </div>
    <%} %>
    <%else
        { %>
    <div class="conteiner">
        <table class="table table-dark">
            <thead>
                <tr>
<%--      <th scope="col">ID</th>--%>
                    <th scope="col">Fecha y Hora</th>
                    <th scope="col">Inquilino</th>
                    <th scope="col">Reclamo</th>
                    <th scope="col">Titulo</th>
                    <th scope="col">Detalle</th>
<%--                    <th scope="col">Accion</th>--%>
                </tr>
            </thead>

            <tbody>
                <%foreach (Dominio.Mensaje item in listaMensajes)
                    { %>
                <tr>  
                        <td style="font-size:15px"><% =item.fechaHora %> </td>
                        <td style="font-size:15px"><% =item.IDReceptor %> </td>
                        <td style="font-size:15px"><% =item.IDReclamo %> </td>
                        <td style="font-size:15px"><% =item.asunto %> </td>
                        <td style="font-size:15px"><% =item.detalle %> </td>
                </tr>
<%--                        <a class="btn btn_secondary" href="MailAdmin.aspx?ID=<% =item.IDEmisor %>&Reclamo=<%=item.IDReclamo %>">Responder</a>--%>
                <%} %>
            </tbody>
        </table>      
        <%} %>
        <br />
        <a class="btn btn-secondary" href="Reclamos.aspx">Volver</a>
     </div>
</asp:Content>
