<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPC_DiazOlivera.Login" %>

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
<header>
    <nav class="navbar navbar-light black  justify-content-end">
        <a class="navbar-brand" href="#" style="color:gray; padding:0%"> HabitApp
        </a>
    </nav>

</header>
    <div class="container-portada" >
        <div class="capa-gradient">
            <div class="container-details">
                <div class="details">
                    <h1 style="color:white; text-shadow: 2px 2px 5px black;">BIENVENIDO</h1>
                    <% if (!PrimerLogin)
                        {%>
                        <div class="contenedorAcceso" id="contenedorlogin">
                            <form id="form1" runat="server">
                                <div id="page" class="container" style="align-content:center">
                                    <div>
                                        <label for="NombredeUsuario" style="font-weight:bold;">DNI</label>
                 
                                        <asp:TextBox ID="txtUsuario" class="form-control"  runat="server" placeholder="DNI..." CssClass="textbox "></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="validacionUsuario" ErrorMessage = "Ingresar Usuario" runat="server" ControlToValidate="txtUsuario"></asp:RequiredFieldValidator>
<%--                                        <asp:CustomValidator ID= "validarUsuario" ErrorMessage="Usuario o contraseña incorrecta."  ControlToValidate="txtUsuario" OnServerValidate="ValidarUsuario_ServerValidate" runat="server" />--%>

                                    </div>
                                    <div>
                                        <label for="ContraseñaUsuario" style="font-weight:bold;">Contraseña</label>
                                        <asp:TextBox ID="txtContraseña" TextMode="Password" class="form-control" runat="server" placeholder="Contraseña..." CssClass="textbox "></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="validacionContraseña" ErrorMessage = "Ingresar contraseña" runat="server" ControlToValidate="txtContraseña" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                                              
                                    </div>
                                    <div >
                                        <asp:Button ID="Button1" runat="server" Text="Ingresar" OnClick="btnIngresar" class="btn btn-secondary" BorderColor="" />
                                    </div>
                                </div>
                            </form>
                        </div>
                    <%} %>
                    <% else
                       { %>
                          <div class="contenedorAcceso" id="contenedorPrimerLogin">
                            <form id="formPrimerLogin" runat="server">
                                <div id="PrimerLogin" class="container" style="align-content:center">
                                    <div>
                                        <label for="NombredeUsuario" style="font-weight:bold;">DNI</label>
                                        <asp:TextBox ID="txtDNIPrimerLogin" class="form-control"  runat="server" readonly="true" CssClass="textbox "></asp:TextBox>
                                    </div>
                                    <div >
                                        <label for="ContraseñaUsuario" style="font-weight:bold;">Nueva Contraseña</label>
                                        <asp:TextBox ID="txtContraseñaPrimerLogin" TextMode="Password" class="form-control" runat="server" placeholder="Nueva Contraseña..." CssClass="textbox "></asp:TextBox>
                                    </div>
                                    <div >
                                        <label for="ConfirmarContraseña" style="font-weight:bold;">Confirme Contraseña</label>
                                        <asp:TextBox ID="txtConfirmarContraseña" TextMode="Password" class="form-control" runat="server" placeholder="Confirme Contraseña..." CssClass="textbox "></asp:TextBox>
                                    </div>

                                    <div class="row" >
                                        <asp:Button ID="btnAceptarNuevaContraseña" style="margin:5px;" runat="server" Text="Confirmar" OnClick="btnAceptarNuevaContraseña_Click" class="btn btn-secondary" BorderColor="" />
                                        <a class="btn btn-secondary" style="margin:5px;" href="Login.aspx">Volver</a>
                                    </div>
                                </div>
                            </form>
                        </div>  
                     <%} %>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
 
