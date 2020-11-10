<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reclamos.aspx.cs" Inherits="TPC_DiazOlivera.Reclamos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1 style="color:antiquewhite">Gestión de Reclamos</h1>
    <asp:Button ID="Pendientes" runat="server" Text="Pendientes" OnClick="btnPendientes" class="btn btn-primary" BorderColor="" />
    <asp:Button ID="Finalizados" runat="server" Text="Finalizados" OnClick="btnFinalizados" class="btn btn-primary" BorderColor="" />

    <table class="table table-dark">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Fecha y Hora</th>
      <%--<th scope="col">Nombre y Apellido</th>--%>
      <th scope="col">Titulo</th>
      <th scope="col">Detalle</th>
    </tr>
  </thead>

  <tbody>
        <%int con = 0; %>
    <%foreach (Dominio.Reclamos item in listaReclamos)
             
        {%>
        <%con++;%>
        
        <tr>
          <th scope="row"><%=item.ID %></th>
         
            <td style="font-size:15px"><% =item.fechaHora %> </td>  
            <td style="font-size:15px"><% =item.titulo %> </td>
            <td style="font-size:15px"><% =item.detalle %> </td>
            <td style="font-size:15px">
                
                <asp:CheckBox ID="CheckBox1" runat="server" /><asp:Label ID="Label1" runat="server" Text="Sin Revisar"></asp:Label>   
                <asp:CheckBox ID="CheckBox2" runat="server" /><asp:Label ID="Label2" runat="server" Text="En Proceso"></asp:Label>    
                <asp:CheckBox ID="CheckBox3" runat="server" /><asp:Label ID="Label3" runat="server" Text="Solucionado"></asp:Label>
            </td>
        </tr>

        <%} %>
  </tbody>
</table>
    <asp:Button ID="Aceptar" runat="server" Text="Aceptar" OnClick="btnAceptar" class="btn btn-primary" BorderColor="" />
    <asp:Button ID="Cancelar" runat="server" Text="Cancelar" OnClick="btnCancelar" class="btn btn-primary" BorderColor="" />
</asp:Content>
