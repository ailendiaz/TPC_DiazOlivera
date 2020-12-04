<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Reclamos.aspx.cs" Inherits="TPC_DiazOlivera.Reclamos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheet" runat="server">

    <h3 style="color:#393D42; padding:1%; text-shadow: 2px 2px 5px white;">Gestión de Reclamos</h3>
    <br />  
    <a class="btn btn-secondary" href="/Reclamos.aspx">Todos</a>
    <a class="btn btn-secondary" href="/Reclamos.aspx?ver=Pendientes">En proceso</a>
    <a class="btn btn-secondary" href="/Reclamos.aspx?ver=Finalizados">Solucionados</a>
    <a class="btn btn-secondary" href="/ReporteAdmin.aspx">Reportes</a>

    <br />
    <table class="table table-dark">
  <thead>
    <tr>
      <th scope="col">Fecha y Hora</th>
      <th scope="col">Nombre y Apellido</th>
      <th scope="col">Titulo</th>
      <th scope="col">Detalle</th>
      <th scope="col">Estado</th>
      <th scope="col">Accion</th>
      <th scope="col">Informar</th>

    </tr>
  </thead>

  <tbody>
        <%int con = 0; %>
    <%foreach (Dominio.Reclamos item in listaReclamos)
             
        {%>
        <%con++;%>
        
        <tr>
         
            <td style="font-size:15px"><% =item.fechaHora.ToShortDateString() %> </td>  
            <td style="font-size:15px"><% =item.inquilino.nombre+" "+item.inquilino.apellido %> </td>
            <td style="font-size:15px"><% =item.titulo %> </td>
            <td style="font-size:15px"><% =item.detalle %> </td>
            <%if (item.estado.ID == 1)
                { %>
                    <td style="font-size:15px;background-color:#ff6666;color:white;font-weight:bold;vertical-align:middle"> <%= item.estado.estado %></td>
                <%} %>
                <%else if (item.estado.ID == 2)
                    {%>
                        <td style="font-size:15px;background-color:#FFFFCC;color:black;font-weight:bold;vertical-align:middle;"> <%= item.estado.estado %></td>
                    <%} %>
                       <%else
                         { %>
                               <td style="font-size:15px;background-color:darkseagreen;color:white;font-weight:bold;vertical-align:middle;"> <%= item.estado.estado %></td>
                        <%} %>
            
             <td style="font-size:15px;text-align:center;">
                 <%if(item.estado.ID==1)
                { %>
                <a class="btn btn-secondary" href="Reclamos.aspx?ID=<%=item.ID %>&Estado=EnProceso&ver=<%= ver %>">En proceso</a>
                
            <%}%>
            <%else if (item.estado.ID == 2)
                { %>
                <a class="btn btn-secondary" href="Reclamos.aspx?ID=<%=item.ID %>&Estado=Solucionado&ver=<%= ver %>">Solucionado</a>

                <%} %>
             </td> 
            
          <td style="font-size:15px">

                <a class="btn btn-secondary" href="ReporteAdmin.aspx?ID=<%=item.inquilino.ID %>&Reclamo=<%=item.ID %>">Enviar Reporte</a>
            </td>
        </tr>

        <%} %>
  </tbody>
</table>
</asp:Content>
