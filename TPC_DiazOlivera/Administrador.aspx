<%@ Page Title="Administrador" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Administrador.aspx.cs" Inherits="TPC_DiazOlivera.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Estilo" runat="server">
 

    <h2><%: Title %>.</h2>


<%--     <div class="row">
        <%foreach (Dominio.Opciones item in listaOpciones)
            {%>
        <%if (item.tipo.ID == 1)
            { %>

         <div class="container-Administrador">
<div class="row row-cols-1 row-cols-md-3">
 
  <div class="col mb-4">
    <div class="card h-100">
      <img src="https://cdn-3.expansion.mx/dims4/default/876d712/2147483647/strip/true/crop/659x462+0+0/resize/800x561!/quality/90/?url=https%3A%2F%2Fcdn-3.expansion.mx%2F6d%2F6d4780ee2af353708f3d239c4f555227%2Fadministracion-inmobiliaria20180503102327.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title"><%=item.nombre %></h5>
        <a href="#" class="btn btn-primary">Ingresar</a>
      </div>
    </div>
  </div>
    </div>
            </div>
             
        <%} %>

        <% } %>
    </div>--%>

   
 <div class="container-Administrador">
<div class="row row-cols-1 row-cols-md-3">
 
  <div class="col mb-4">
    <div class="card h-100">
      <img src="https://obsbusiness.school/sites/default/files/styles/blog_post/public/post/istock-518311294_1.jpg?itok=LJ3Jd_Kz" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Reclamos</h5>
        <a href="Reclamos.aspx" class="btn btn-primary">Ingresar</a>
      </div>
    </div>
  </div>

    <div class="col mb-4">
    <div class="card h-100">
      <img src="https://obsbusiness.school/sites/default/files/styles/blog_post/public/post/istock-518311294_1.jpg?itok=LJ3Jd_Kz" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Expensas</h5>
        <a href="ExpensasAdmin.aspx" class="btn btn-primary">Ingresar</a>
      </div>
    </div>
  </div>

    <div class="col mb-4">
    <div class="card h-100">
      <img src="https://obsbusiness.school/sites/default/files/styles/blog_post/public/post/istock-518311294_1.jpg?itok=LJ3Jd_Kz" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">ABM Usuario</h5>
        <a href="AltaUsuario.aspx" class="btn btn-primary">Ingresar</a>
      </div>
    </div>
  </div>

     <div class="col mb-4">
    <div class="card h-100">
      <img src="https://obsbusiness.school/sites/default/files/styles/blog_post/public/post/istock-518311294_1.jpg?itok=LJ3Jd_Kz" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Novedades</h5>
        <a href="#" class="btn btn-primary">Ingresar</a>
      </div>
    </div>
  </div>

     <div class="col mb-4">
    <div class="card h-100">
      <img src="https://obsbusiness.school/sites/default/files/styles/blog_post/public/post/istock-518311294_1.jpg?itok=LJ3Jd_Kz" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Unidad Funcional</h5>
        <a href="#" class="btn btn-primary">Ingresar</a>
      </div>
    </div>
  </div>

<%--      <div class="col mb-4">
    <div class="card h-100">
      <img src="https://obsbusiness.school/sites/default/files/styles/blog_post/public/post/istock-518311294_1.jpg?itok=LJ3Jd_Kz" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">ABM Inquilino</h5>
        <a href="#" class="btn btn-primary">Configuracion</a>
      </div>
    </div>
  </div>

     <div class="col mb-4">
    <div class="card h-100">
      <img src="https://obsbusiness.school/sites/default/files/styles/blog_post/public/post/istock-518311294_1.jpg?itok=LJ3Jd_Kz" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Clasificados</h5>
        <a href="#" class="btn btn-primary">Configuracion</a>
      </div>
    </div>
  </div>--%>
       

    </div>
   
     </div>
</asp:Content>
