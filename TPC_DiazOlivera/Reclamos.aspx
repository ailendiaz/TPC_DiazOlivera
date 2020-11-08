<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reclamos.aspx.cs" Inherits="TPC_DiazOlivera.Reclamos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table class="table table-dark">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Fecha y Hora</th>
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
         
            <td style="font-size:20px"><% =item.fechaHora %> </td>
            <td style="font-size:20px"><% =item.titulo %> </td>
            <td style="font-size:20px"><% =item.detalle %> </td>

        </tr>

        <%} %>
  </tbody>
</table>

</asp:Content>
