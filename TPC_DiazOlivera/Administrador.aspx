﻿<%@ Page Title="Administrador" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Administrador.aspx.cs" Inherits="TPC_DiazOlivera.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Stylesheet" runat="server">
 <link rel="stylesheet" href="../Estilo/Administrador.css" type="text/css" />

    <h2 style="color: white">Administrador </h2>
   

    <%--<div class="row">
        <%foreach (Dominio.Opciones item in listaOpciones)
            {%>
        <%if (item.tipo.ID == 1)
            { %>
<%--           <div class="container-Administrador">
             <div class="row row-cols-1 row-cols-md-3">--%>
                <%--<div class="col mb-4">
                 <div class="card h-100">
                    <img src="https://www.muylinux.com/wp-content/uploads/2018/07/Komorebi.jpg" class="card-img-top" alt="...">
                     <div class="card-body">
                        <h5 class="card-title"><%=item.nombre %></h5>
                        <a href="#" class="btn btn-primary">Ingresar</a>
                      </div>
                     </div>
                 </div>--%>
<%--             </div>
           </div>   --%>
        <% %>

        <% %>     
    <%--</div>--%>
    <div class="container align-content-center">
<div class="row row-cols-2 row-cols-3">
    <div class="col mb-4">
   <div class="card border-secondary mb-3" style="max-width: 18rem;">
  <div class="card-header text-secondary">Reclamos</div>
  <div class="card-body text-secondary bg-light">
    <a href="Reclamos.aspx" class="btn btn-secondary">Ingresar</a>
  </div>
</div>
        </div>
    <div class="col mb-4">
    <div class="card border-success mb-3" style="max-width: 18rem;">
  <div class="card-header text-success">Expensas</div>
  <div class="card-body text-success bg-light">
      <a href="ExpensasAdmin.aspx" class="btn btn-secondary">Ingresar</a>
  </div>
</div>
    </div>
<div class="col mb-4">
<div class="card border-primary mb-3" style="max-width: 18rem;">
  <div class="card-header text-primary">Novedades</div>
  <div class="card-body text-primary bg-light">
    <a href="NovedadesAdm.aspx" class="btn btn-secondary">Ingresar</a>
  </div>
</div>
     </div>
<div class="col mb-4">
<div class="card border-danger mb-3" style="max-width: 18rem;">
  <div class="card-header text-danger">Gestion de Usuarios</div>
  <div class="card-body text-danger bg-light">
    <a href="AltaUsuario.aspx" class="btn btn-secondary">Ingresar</a>
  </div>
</div>
    </div>
</div>
        </div>



</asp:Content>
