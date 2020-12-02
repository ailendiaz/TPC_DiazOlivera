<%@ Page Title="Administrador" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Administrador.aspx.cs" Inherits="TPC_DiazOlivera.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Stylesheet" runat="server">
 <link rel="stylesheet" href="../Estilo/Administrador.css" type="text/css" />

    <h2 style="color:#393D42; padding:1%; text-shadow: 2px 2px 5px white;">Administrador </h2>
   
    <br />
    <br />
  
    <div class="container align-content-center">
        <div class="row row-cols-2 row-cols-3">
            <div class="col mb-4" style="text-align: center;">
                <div class="card border-secondary mb-3" style="max-width: 18rem;">
                <div class="card-header text-secondary" style="font-weight:bold;">Reclamos</div>
                <div class="card-body text-secondary bg-light">
                <a href="Reclamos.aspx" class="btn btn-secondary">Ingresar</a>
                </div>
                </div>
            </div>
            <div class="col mb-4" style="text-align: center;">
                <div class="card border-success mb-3" style="max-width: 18rem;">
                <div class="card-header text-success" style="font-weight:bold;">Expensas</div>
                <div class="card-body text-success bg-light">
                    <a href="ExpensasAdmin.aspx" class="btn btn-secondary">Ingresar</a>
                </div>
                </div>
            </div>
            <div class="col mb-4" style="text-align: center;">
                <div class="card border-primary mb-3" style="max-width: 18rem;">
                <div class="card-header text-primary" style="font-weight:bold;">Novedades</div>
                <div class="card-body text-primary bg-light">
                    <a href="NovedadesAdm.aspx" class="btn btn-secondary">Ingresar</a>
                </div>
                </div>
            </div>
            <div class="col mb-4" style="text-align: center;">
                <div class="card border-danger mb-3" style="max-width: 18rem;">
                <div class="card-header text-danger" style="font-weight:bold;">Gestion de Usuarios</div>
                <div class="card-body text-danger bg-light">
                    <a href="AltaUsuario.aspx" class="btn btn-secondary">Ingresar</a>
                </div>
                </div>
            </div>
            <div class="col mb-4" style="text-align: center;">
                <div class="card border-warning mb-3" style="max-width: 18rem;">
                <div class="card-header text-warning" style="font-weight:bold;">Unidad Funcional</div>
                <div class="card-body text-warning bg-light">
                <a href="UnidadFuncionalAdmin.aspx" class="btn btn-secondary">Ingresar</a>
                </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
