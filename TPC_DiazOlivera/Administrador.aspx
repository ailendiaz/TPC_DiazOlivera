<%@ Page Title="Administrador" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Administrador.aspx.cs" Inherits="TPC_DiazOlivera.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
       <link rel="stylesheet" href="Estilo/Administrador.css" type="text/css" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 
    <ul class="nav justify-content-center">
  <li class="nav-item">
    <a class="nav-link active" href="Reclamos.aspx">Reclamos</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Expensas</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Link</a>
  </li>
</ul>

    <h2><%: Title %>.</h2>
   
 <div class="container-Administrador">
<div class="row row-cols-1 row-cols-md-3">
 
  <div class="col mb-4">
    <div class="card h-100">
      <img src="https://obsbusiness.school/sites/default/files/styles/blog_post/public/post/istock-518311294_1.jpg?itok=LJ3Jd_Kz" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Gestion</h5>
        <a href="Reclamos.aspx" class="btn btn-primary">Ingresar</a>
      </div>
    </div>
  </div>

    <div class="col mb-4">
    <div class="card h-100">
      <img src="https://obsbusiness.school/sites/default/files/styles/blog_post/public/post/istock-518311294_1.jpg?itok=LJ3Jd_Kz" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Estado de Cuenta</h5>
        <a href="#" class="btn btn-primary">Ingresar</a>
      </div>
    </div>
  </div>

    <div class="col mb-4">
    <div class="card h-100">
      <img src="https://obsbusiness.school/sites/default/files/styles/blog_post/public/post/istock-518311294_1.jpg?itok=LJ3Jd_Kz" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">ABM Inquilino</h5>
        <a href="#" class="btn btn-primary">Ingresar</a>
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
        <h5 class="card-title">ABM Inquilino</h5>
        <a href="#" class="btn btn-primary">ABM Reserva</a>
      </div>
    </div>
  </div>

      <div class="col mb-4">
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
  </div>
       

    </div>
   
     </div>
</asp:Content>
