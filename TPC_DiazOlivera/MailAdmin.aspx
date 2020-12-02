<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="MailAdmin.aspx.cs" Inherits="TPC_DiazOlivera.Mail" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Stylesheet" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainAdm" runat="server">
    <h2 style="color:#393D42; padding:1%; text-shadow: 2px 2px 5px white;">Reportes</h2>
    <br />
    <%if (Request.QueryString["ID"] != null && Request.QueryString["Reclamo"]!=null)
        { %>
    <div class="container" style="margin-left:5px">
        <h3> Comunicar Estado de Reclamo: </h3>

        <label for="Emisor" style="font-weight:bold;">Emisor:</label> 
        <div class="form-group col-md-4">
            <asp:textbox id="txtAdmin" Class="form-control" runat="server" />
        </div>
        <label for="Destinatario" style="font-weight:bold;">Destinatario:</label>
        <div class="form-group col-md-4">
            <asp:textbox id="txtDestinatario" Class="form-control" runat="server" />
        </div>
        <label for="Reclamo" style="font-weight:bold;">Reclamo:</label> 
        <div class="form-group col-md-1">
            <asp:TextBox id="txtReclamo" Class="form-control" runat="server" />
        </div>
        <label for="Asunto" style="font-weight:bold;">Asunto:</label> 
        <div class="form-group col-md-6">
            <asp:textbox id="txtAsunto" Class="form-control" runat="server" />
        </div>
        <label for="Mensaje" style="font-weight:bold;">Texto del mensaje:</label>
        <div class="form-group col-md-6">
            <asp:textbox id="txtMensaje" runat="server" Class="form-control" height="150px" textmode="multiline" />
        </div>
        <asp:button id="EnviarMensaje" CssClass="btn btn-secondary" runat="server" onclick="EnviarMensaje_Click" text="Enviar" /><br>
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
