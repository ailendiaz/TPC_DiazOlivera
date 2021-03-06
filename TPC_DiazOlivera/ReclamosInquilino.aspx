﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReclamosInquilino.aspx.cs" Inherits="TPC_DiazOlivera.ReclamosInquilino" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
    <link rel="stylesheet" href="../Estilo/ReclamosInquilino.css" type="text/css" />

    <h3 style="color:lavender; padding:1%">Reclamos</h3>
    <br />
    <div class="contenedorbotones" style="padding:2%">
     <%if (ver == null)
                      { %>
    <a class="btn btn-secondary" style="padding:1%" href="/ReclamosInquilino.aspx?ver=Reclamos">Ver Reclamos</a>
    <a class="btn btn-secondary" style="padding:1%" href="/ReclamosInquilino.aspx?ver=RealizarReclamo">Realizar Reclamo</a>
    <a class="btn btn-secondary" style="padding:1%" href="/ReclamosInquilino.aspx?ver=Reportes">Reportes</a>
    <br />  
    <%} %>
        </div>
    
    <div class="row" style="padding:1%;margin-left:3%;">
    <%if (ver == "Reclamos")
        { %>
            <% foreach (Dominio.Reclamos item in listaReclamos)
                {%>
             
                    <div class="card text-white bg-dark mb-3" style="width: 180px; text-align:center;margin:5px">
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

            <a href="ReclamosInquilino.aspx" style="margin-left:3%" class="btn btn-secondary">Atras</a>
    <%} %>
        
    <%else if (ver == "RealizarReclamo")
        { %>
   

    
           <div class="conteiner" style="padding-left:30%;margin-left:7%;align-content:center; border:solid">

            <div id="page"style="margin:auto;">
                <br />
                <div style="margin:auto">
                    <label for="lblAsunto" class="label" style="font-size:medium;">Asunto</label> 
                    <br />
                    <asp:TextBox ID="txtAsunto" runat="server" CssClass="txtAsunto" Height="30px" Width="300px" BorderColor="Black"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="validacionAsunto" ErrorMessage= "Debe ingresar un Asunto" runat="server" ControlToValidate="txtAsunto" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="validarAsunto" runat="server" ControlToValidate="txtAsunto" ValidationExpression="^[a-z & A-Z]*$" ErrorMessage="El valor ingresado debe ser alfabetico" ForeColor="Red"/>
                </div>
                <br />
            <div>
                <% DateTime ahora = DateTime.Now; %>
                <label for="lblFechaHora" class="label" style=font-size:medium>Fecha y Hora: <% =ahora %></label>
            </div>
                <br />
            <div>
                <label for="lblDetalle" class="label" style=font-size:medium >Detalle:</label>
                <br />
                <asp:TextBox ID="txtDetalle" runat="server" TextMode="MultiLine" Height="200px" Width="300px" BorderColor="Black"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ValidacionDetalle" ErrorMessage= "Debe ingresar un Detalle" runat="server" ControlToValidate="txtDetalle" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
                <br />
            <div style="align-content:center">
                <asp:Button ID="btEnviar" runat="server" Text="Enviar" OnClick="btEnviar_Click" Class="btn btn-secondary" />
                <asp:Button ID="btCancelar" runat="server" Text="Cancelar" OnClick="btCancelar_Click" Class="btn btn-secondary" />

            </div>
                <br />
    </div>
  </div>

<%} %>
    <%else if (ver=="Reportes")
        {%>
    <div class="conteiner">
        <table class="table table-dark">
            <thead>
                <tr>
                    <th scope="col">Fecha y Hora</th>
                    <th scope="col">Reclamo</th>
                    <th scope="col">Titulo</th>
                    <th scope="col">Detalle</th>
                </tr>
            </thead>

            <tbody>
                <%foreach (Dominio.Mensaje item in listaMensajes)
                    { %>
                    <tr>
                        <td style="font-size:15px"><% =item.fechaHora %> </td>
                        <td style="font-size:15px"><% =item.IDReclamo %> </td>
                        <td style="font-size:15px"><% =item.asunto %> </td>
                        <td style="font-size:15px"><% =item.detalle %> </td>
                    </tr>
                <%} %>
            </tbody>
        </table>   
        <br />
        <a class="btn btn-secondary" href="ReclamosInquilino.aspx">Atras</a>
    </div>
        <%} %>

</asp:Content>
