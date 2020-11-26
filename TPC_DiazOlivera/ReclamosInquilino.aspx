<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReclamosInquilino.aspx.cs" Inherits="TPC_DiazOlivera.ReclamosInquilino" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
    <link rel="stylesheet" href="../Estilo/ReclamosInquilino.css" type="text/css" />
    <h1 style="color:white;">Reclamos</h1>
    <br />
    <a class="btn btn-secondary" href="/ReclamosInquilino.aspx?ver=Reclamos">Ver Reclamos</a>
    <a class="btn btn-secondary" href="/ReclamosInquilino.aspx">Realizar Reclamo</a>
    <br />
    <div class="row">
    <%if (ver == "Reclamos")
        { %>
            <% foreach (Dominio.Reclamos item in listaReclamos)
                {%>
             
                    <div class="card text-white bg-dark mb-3" style="max-width: 18rem;">
                      <div class="card-header"><%=item.fechaHora.ToShortDateString() %></div>
                        <div class="card-body">
                         <h4 style="font-weight:bold" class="card-title"><%=item.titulo %></h4>
                         <p class="card-text"><%=item.detalle %></p>
                            <%if (item.estado.ID == 1)
                                { %>
                                 <p style="font-size:15px;background-color:darkred;color:white;font-weight:bold" class="card-text"><%=item.estado.estado %></p>

                          <%} %>
                             <%else if (item.estado.ID == 2)
                                 {%>
                                 <p style="font-size:15px;background-color:yellow;color:black;font-weight:bold" class="card-text"><%=item.estado.estado %></p>
                                  <%} %>
                               <%else
                                   { %>
                                 <p style="font-size:15px;background-color:green;color:white;font-weight:bold" class="card-text"><%=item.estado.estado %></p>
                            <%} %>
                     </div>
                    </div>
                   
              <% } %>
            </div>
      
    <%} %>
        
    <%else
        { %>
    <div id="page" class="container" style="border:solid">
 
     <div class="row">
         <div class="col-md-6 col-md-offset-3 text-center">
             <div class="form-group">
       
                 <label for="lblAsunto" class="label">Asunto</label>  
                 <asp:TextBox ID="txtAsunto" runat="server" CssClass="txtAsunto"></asp:TextBox>
            </div>
         <div class="form-group">
            <% DateTime ahora = DateTime.Now; %>
           <label for="lblFechaHora" class="label">Fecha y Hora: <% =ahora %></label>
        </div>
        <div class="form-group">
           <label for="lblDetalle"  class="label">Detalle:</label>
            <asp:TextBox ID="txtDetalle" runat="server" CssClass="txtDetalle" TextMode="MultiLine"></asp:TextBox>
      </div>
        <div class="form-group">
      
            <asp:Button ID="btEnviar" runat="server" Text="Enviar" OnClick="btEnviar_Click" Class="btn btn-secondary" />
            <asp:Button ID="btCancelar" runat="server" Text="Cancelar" OnClick="btCancelar_Click" Class="btn btn-secondary" />
       
      </div>
    </div>
  </div>
</div>
<%} %>

</asp:Content>
