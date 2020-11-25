<%@ Page Title="Inquilino" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inquilino.aspx.cs" Inherits="TPC_DiazOlivera.About" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="Stylesheets" runat="server">
     <link rel="stylesheet" href="../Estilo/Inquilino.css" type="text/css" />
    

    <h2 style="color:antiquewhite"><%: Title %>.</h2>


    <div class="row">
        <%foreach (Dominio.Opciones item in listaOpciones)
            {%>
        <%if (item.tipo.ID == 2)
            { %>
        <div class="container-Inquilino">
<div class="row row-cols-1 row-cols-md-4">

    
  <div class="col mb-4">
    <div class="flip-card-container" style="--hue: 100">
  <div class="flip-card">

    <div class="card-front">
      <figure>
        <div class="img-bg"></div>
        <img src="https://images.unsplash.com/photo-1486162928267-e6274cb3106f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" alt="Novedades">
        <figcaption><%=item.nombre %></figcaption>
      </figure>
    </div>

    <div class="card-back">
      <figure>
        <div class="img-bg"></div>
        <img src="https://images.unsplash.com/photo-1486162928267-e6274cb3106f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" alt="Novedades">
      </figure>

        <button >Ingresar</button>
      <%--<a href="<%item.ingreso%>" class="button">Ingresar</a>--%> <%--agregar a la base de datos cuando estem terminads las paginas--%>
   </div>

  </div>
</div>
      </div>

    </div>
            </div>
        <%} %>

        <% } %>
    </div>


</asp:Content>

