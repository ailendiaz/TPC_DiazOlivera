﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPC_DiazOlivera.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inicio</title>
    <link rel="stylesheet" href="Estilo/Login.css" />
    
    <!-- CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <!-- jQuery and JS bundle w/ Popper.js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>

<body>
    <%--<form id="form1" runat="server">--%>
        <header>
        <div class="container-header">
            <div class="logo-title">
                <img src="https://image.freepik.com/vector-gratis/isometrica-3d-edificio-icono-vector_95561-31.jpg" />
                <h4>HabitApp</h4>
            </div>

        </div>
   <%-- </form>--%>
     </header>
    <div class="container-portada" >
        <div class="capa-gradient">
            <div class="container-details">
                <div class="details">
                    <h1>BIENVENIDO</h1>
                     <form id="form1"  runat="server">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                    <label for="NombredeUsuario" style="font-weight:bold;">DNI</label>
                                     <asp:TextBox ID="txtUsuario" class="form-control"  runat="server" placeholder="DNI..."></asp:TextBox>
                             <div>
                        </div>
                    
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                     <label for="ContraseñaUsuario" style="font-weight:bold;">Contraseña</label>
                                    <asp:TextBox ID="txtContraseña" TextMode="Password" class="form-control" runat="server" placeholder="Contraseña..."></asp:TextBox>
                            </div>
                        </div>
                        <asp:Button ID="Button1" runat="server" Text="Ingresar" OnClick="btnIngresar" class="btn btn-primary" BorderColor="" />
                        
                    </form>
                </div>

            </div>

        </div>

    </div> 
</body>
</html>
 
