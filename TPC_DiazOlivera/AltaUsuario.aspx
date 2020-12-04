<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="AltaUsuario.aspx.cs" Inherits="TPC_DiazOlivera.AltaUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheet" runat="server">
    <link rel="stylesheet" href="../Estilo/ABMUsuario.css" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainAdm" runat="server">
    <h3 style="color:#393D42; text-shadow: 2px 2px 5px white;">Ingreso de Usuario</h3>
    <br />
    <div class="contenedor">
        <div id="page" class="container" style="align-content:center">
            <div>
                <asp:Label ID="lblFecha" style="color:white; font-weight: bold" Text="Fecha" runat="server" />
                <br />  
           </div>
            <div class="form-group col-md-4">
                <asp:Label ID="lblTipoUsuario"  style="color:white; font-weight: bold" Text="Tipo de Usuario" runat="server" />
                <asp:DropDownList ID="ddlTipos" CssClass="form-control" runat="server" AutoPostBack="true">
                </asp:DropDownList>            
            </div>
            <div class="form-group col-md-4">
                <asp:Label ID="lblABM" style="color:white; font-weight: bold" Text="Tipo de Operación" runat="server" />                     
                <asp:DropDownList ID="ddlABM" CssClass="form-control" runat="server" AutoPostBack="true"></asp:DropDownList>                     
            </div>
            <br />
            <div class="form-group col-md-6">
            <div>
                <asp:Label ID="lblDNI" style="color:white; font-weight: bold" Text="DNI" runat="server" />
                <asp:TextBox ID="txtDNI" Class="form-control" AutoPostBack="true" OnTextChanged="txtDNI_TextChanged" runat ="server" /> 
                <asp:Label ID="lblErrorDNI" Text="" runat="server" />
                <asp:RequiredFieldValidator ID="validacionDNI" ErrorMessage= "Debe ingresar una DNI" runat="server" ControlToValidate="txtDNI"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="validaDNI" runat="server" ControlToValidate="txtDNI" ValidationExpression="^[0-9]*$" ErrorMessage="El valor ingresado debe ser numerico"/>
            </div>
    
            <div>
                <asp:Label ID="lblNombres" style="color:white; font-weight: bold" Text="Nombre" runat="server" />
                <asp:TextBox ID="txtNombres" Class="form-control" runat="server" /> 
                <asp:Label ID="lblErrorNombres" Text="" runat="server" />
                <asp:RequiredFieldValidator ID="validacionNombre" ErrorMessage= "Debe ingresar un Nombre" runat="server" ControlToValidate="txtNombres"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="validarNombre" runat="server" ControlToValidate="txtNombres" ValidationExpression="^[a-z & A-Z]*$" ErrorMessage="El valor ingresado debe ser alfabetico"/>

            </div>
    
            <div>
                <asp:Label ID="lblApellidos" style="color:white; font-weight: bold" Text="Apellido" runat="server" />
                <asp:TextBox ID="txtApellidos" Class="form-control" runat="server" /> 
                <asp:Label ID="lblErrorApellidos" Text="" runat="server" />
                <asp:RequiredFieldValidator ID="validacionapellido" ErrorMessage= "Debe ingresar un Apellido" runat="server" ControlToValidate="txtApellidos"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="validarapellido" runat="server" ControlToValidate="txtApellidos" ValidationExpression="^[a-z & A-Z]*$" ErrorMessage="El valor ingresado debe ser alfabetico"/>

            </div>
            <div>
                <asp:Label ID="lblGenero" style="color:white; font-weight: bold" Text="Genero" runat="server" />
                <asp:TextBox ID="txtGenero" Class="form-control" runat="server" />
                <asp:Label ID="lblErrorGenero" Text="" runat="server" />

            </div>
    
            <div>
                <asp:Label ID="lblNacimiento" style="color:white; font-weight: bold" Text="Fecha Nacimiento DD/MM/AAAA" runat="server" />
                <asp:TextBox ID="txtNacimiento" Class="form-control" runat="server" />
                <asp:Label ID="lblErrorNacimiento" Text="" runat="server" />
                 <asp:RequiredFieldValidator ID="validacionFechaNac" ErrorMessage= "Debe ingresar una fecha de nacimiento" runat="server" ControlToValidate="txtNacimiento"></asp:RequiredFieldValidator>
                 <asp:RangeValidator id="validarFechaNac" runat="server" ControlToValidate="txtNacimiento" MaximumValue="01/12/2002" MinimumValue= "01/12/1920" Type="Date" Display="Dynamic" ErrorMessage="*Fecha invalida"></asp:RangeValidator>

            </div>
    
            <div>
                <asp:Label ID="lblMail" style="color:white; font-weight: bold"  Text="@mail" runat="server" />
                <asp:TextBox ID="txtMail" Class="form-control" runat="server" /> 
                <asp:Label ID="lblErrorMail" Text="" runat="server" />
                <asp:RequiredFieldValidator ID="validacionMail" ErrorMessage= "Debe ingresar una mail" runat="server" ControlToValidate="txtMail"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="validarmail" runat="server" ErrorMessage= "Formato de mail incorrecto"  ControlToValidate="txtMail" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" /> 
            </div>
            <div>
                <asp:Label ID="lblTelefono" style="color:white; font-weight: bold" Text="Telefono" runat="server" />
                <asp:TextBox ID="txtTelefono" Class="form-control" runat="server" /> 
                <asp:Label ID="lblErrorTelefono" Text="" runat="server" />
                <asp:RequiredFieldValidator ID="validacionTel" ErrorMessage= "Debe ingresar una telefono" runat="server" ControlToValidate="txtTelefono"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="validatel" runat="server" ControlToValidate="txtTelefono" ValidationExpression="^[0-9]*$" ErrorMessage="El valor debe ser numerico"/>
            </div>

            <%if (ddlTipos.SelectedValue == "2")
                {%>
                <div >
                    <asp:Label ID="lblTorre" style="color:white; font-weight: bold" Text="Torre" runat="server" />
                    <asp:TextBox ID="txtTorre" Class="form-control" runat="server" /> 
                     <asp:RegularExpressionValidator ID="validartorre" runat="server" ControlToValidate="txtTorre" ValidationExpression="^[0-9]*$" ErrorMessage="El valor debe ser numerico"/>

                </div>
                <div>
                    <asp:Label ID="lblPiso" style="color:white; font-weight: bold" Text="Piso" runat="server" />
                    <asp:TextBox ID="txtPiso" Class="form-control" runat="server" /> 
                    <asp:RegularExpressionValidator ID="validarPiso" runat="server" ControlToValidate="txtPiso" ValidationExpression="^[0-9]*$" ErrorMessage="El valor debe ser numerico"/>
                </div>
    
                <div>
                    <asp:Label ID="lblNumero" style="color:white; font-weight: bold" Text="Numero" runat="server" />
                    <asp:TextBox ID="txtNumero" Class="form-control" runat="server" /> 
                    <asp:RegularExpressionValidator ID="validarnumero" runat="server" ControlToValidate="txtNumero" ValidationExpression="^[0-9]*$" ErrorMessage="El valor debe ser numerico"/>

                </div>
            <% }%>
            <br />
            <div>
                <asp:Button ID="btnAceptar" Text="Aceptar" onclick="btnAceptar_Click" CssClass="btn btn-secondary" runat="server" />
                <a class="btn btn-secondary" href="Administrador.aspx">Cancelar</a>
             </div>
         </div>
    </div>

    </div>


</asp:Content>
