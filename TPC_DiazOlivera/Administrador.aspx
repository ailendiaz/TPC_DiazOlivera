<%@ Page Title="Administrador" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Administrador.aspx.cs" Inherits="TPC_DiazOlivera.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
   

      <div class="card" style="width: 18rem;">
  <img src="..." class="card-img-top" alt="...">
  <div class="card-body">
    <h3 class="card-title">Gestión</h3>
    <p class="card-text">En gestión se realizan las...</p>
    <a href="#" class="btn btn-primary">Ingresar!</a>
  </div>
</div>
    

      <div class="card" style="width: 18rem;">
  <img src="..." class="card-img-top" alt="...">
  <div class="card-body">
    <h3 class="card-title">Estados de cuenta</h3>
    <p class="card-text">Estados de cuenta de los inquilinos.</p>
    <a href="#" class="btn btn-primary">Ingresar!</a>
  </div>
</div>

    <%--    Vamos a necesitar que las opciones de las cards tengan nombre, descripcion e imagen asi podemos armar un un foreach con una card 
    y no tantas cards--%>
    <%--Aca podemos tener la barra de navegacion con el nombre del inquilino, menu y logo--%>
</asp:Content>
