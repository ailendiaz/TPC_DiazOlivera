<%@ Page Title="Inquilino" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inquilino.aspx.cs" Inherits="TPC_DiazOlivera.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    

    <div class="card" style="width: 18rem;">
  <img src="..." class="card-img-top" alt="...">
  <div class="card-body">
    <h3 class="card-title">Novedades</h3>
    <p class="card-text">En novedades podrá encontrar notificaciones sobre su edificio.</p>
    <a href="#" class="btn btn-primary">Ingresar!</a>
  </div>
</div>
    
  

      <div class="card" style="width: 18rem;">
  <img src="..." class="card-img-top" alt="...">
  <div class="card-body">
    <h3 class="card-title">Estado de Cuenta</h3>
    <p class="card-text">Podrá encontrar información sobre su cuenta..</p>
    <a href="#" class="btn btn-primary">Ingresar!</a>
  </div>
</div>
        
<%--    Vamos a necesitar que las opciones de las cards tengan nombre, descripcion e imagen asi podemos armar un un foreach con una card 
    y no tantas cards--%>

</asp:Content>

