<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPC_DiazOlivera.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Incio</title>
    <link rel="stylesheet" href="Estilo/Login.css" />
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
                        <div class="form-group-nombre">
                            <label for="NombredeUsuario">Usuario</label>
                            <asp:TextBox ID="txtUsuario" runat="server" placeholder="Usuario"></asp:TextBox> 
                           
                        </div>
                        <div class="form-group">
                            <label for="ContraseñaUsuario">Contraseña</label>
                            <asp:TextBox ID="txtContraseña" runat="server" placeholder="Usuario"></asp:TextBox>
                        </div>
                        <asp:Button ID="Button1" runat="server" Text="Ingresar" OnClick="btnIngresar" class="btn btn-primary" BorderColor="" />
                        <%--<button type="submit" class="btnIngresar">Ingresar</button>--%>
                    </form>
                </div>

            </div>

        </div>

    </div> 
</body>
</html>
 
