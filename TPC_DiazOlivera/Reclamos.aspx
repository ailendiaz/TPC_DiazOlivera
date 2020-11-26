<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Reclamos.aspx.cs" Inherits="TPC_DiazOlivera.Reclamos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheet" runat="server">

    <h3 style="color:antiquewhite">Gestión de Reclamos</h3>
    <br />  
    <a class="btn btn-secondary" href="/Reclamos.aspx">Todos</a>
    <a class="btn btn-secondary" href="/Reclamos.aspx?ver=Pendientes">En proceso</a>
    <a class="btn btn-secondary" href="/Reclamos.aspx?ver=Finalizados">Solucionados</a>
    <br />
    <table class="table table-dark">
  <thead>
    <tr>
<%--      <th scope="col">ID</th>--%>
      <th scope="col">Fecha y Hora</th>
      <th scope="col">Nombre y Apellido</th>
      <th scope="col">Titulo</th>
      <th scope="col">Detalle</th>
      <th scope="col">Estado</th>
      <th scope="col">Accion</th>

    </tr>
  </thead>

  <tbody>
        <%int con = 0; %>
    <%foreach (Dominio.Reclamos item in listaReclamos)
             
        {%>
        <%con++;%>
        
        <tr>
<%--            <th scope="row"><%=item.ID %></th>--%>
         
            <td style="font-size:15px"><% =item.fechaHora %> </td>  
            <td style="font-size:15px"><% =item.inquilino.nombre+item.inquilino.apellido %> </td>
            <td style="font-size:15px"><% =item.titulo %> </td>
            <td style="font-size:15px"><% =item.detalle %> </td>
            <%if (item.estado.ID == 1)
                { %>
                    <td style="font-size:15px;background-color:red;color:white;font-weight:bold"> <%= item.estado.estado %>
                <%} %>
                <%else if (item.estado.ID == 2)
                    {%>
                        <td style="font-size:15px;background-color:yellow;color:black;font-weight:bold"> <%= item.estado.estado %>
                    <%} %>
                       <%else
                         { %>
                               <td style="font-size:15px;background-color:green;color:white;font-weight:bold"> <%= item.estado.estado %>
                        <%} %>
               <%-- <asp:CheckBox ID="CheckBox1" runat="server" /><asp:Label ID="Label1" runat="server" Text="Sin Revisar"></asp:Label> 
                <br />  
                <asp:CheckBox ID="CheckBox2" runat="server" /><asp:Label ID="Label2" runat="server" Text="En Proceso"></asp:Label>  
                <br />  
                <asp:CheckBox ID="CheckBox3" runat="server" /><asp:Label ID="Label3" runat="server" Text="Solucionado"></asp:Label>--%>
            </td>
             <td style="font-size:15px">
                 <%if(item.estado.ID==1)
                { %>
                <a class="btn btn-secondary" href="Reclamos.aspx?ID=<%=item.ID %>&Estado=EnProceso&ver=<%= ver %>">En proceso</a>
            <%}%>
            <%else if (item.estado.ID == 2)
                { %>
                <a class="btn btn-secondary" href="Reclamos.aspx?ID=<%=item.ID %>&Estado=Solucionado&ver=<%= ver %>">Solucionado</a>

                <%} %>
<%--                <asp:Button ID="Modificar" Text="Modificar" OnClick="Modificar_Click" runat="server" class="btn btn-secondary"/>--%>
             </td> 
        </tr>

        <%} %>
  </tbody>
</table>
<%--    <asp:Button ID="Aceptar" runat="server" Text="Aceptar" OnClick="btnAceptar"  class="btn btn-secondary" BorderColor="" />--%>
<%--    <asp:Button ID="Cancelar" runat="server" Text="Cancelar" OnClick="btnCancelar"  class="btn btn-secondary" BorderColor="" />--%>
</asp:Content>
