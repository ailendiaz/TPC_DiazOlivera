<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="UnidadFuncionalAdmin.aspx.cs" Inherits="TPC_DiazOlivera.UnidadFuncionalAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheet" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainAdm" runat="server">
    <h1 style="color:#393D42; text-shadow: 2px 2px 5px white;">Unidad Funcional</h1>
    <br /> 
    <h3 style="color:white;">Elija una Operacion</h3>
    <br /> 
    <div class="form-group col-md-4">
        <div class="form-group">
            <asp:DropDownList ID="ddlOpcion" cssclass="form-control" runat="server" AutoPostBack="true">
            <asp:ListItem text="Alta" value="1" />
            <asp:ListItem text="Baja" value="2" />
            <asp:ListItem text="Listar" value="3" />
            </asp:DropDownList>
        </div>
    </div>
    <br /> 
    <%if (ddlOpcion.SelectedValue == "1")%>
       <% { %>
        <h3 style="color:white;">Alta</h3>
        <div class="form-group col-md-4"> 
            <asp:TextBox ID="txtTorreAlta" Class="form-control" placeholder="Torre" runat="server" />  
            <br /> 
             <asp:TextBox ID="txtPisoAlta" Class="form-control" placeholder="Piso" runat="server" />  
            <br /> 
             <asp:TextBox ID="txtNumeroAlta" Class="form-control" placeholder="Numero" runat="server" /> 
        </div>
         <br />
         <br />
            <asp:Button class="btn btn-secondary" ID="btnAceptarAlta" Text="Aceptar" style="margin:5px;" OnClick="btnAceptarAlta_Click" runat="server" />
    <% } %>
     <%else if (ddlOpcion.SelectedValue == "2"){%>
         <h3 style="color:white;">Baja</h3>
        <div class="form-group col-md-4"> 
            <asp:TextBox ID="txtTorreBaja" Class="form-control" placeholder="Torre" runat="server" />  
         <br /> 
             <asp:TextBox ID="txtPisoBaja" Class="form-control" placeholder="Piso" runat="server" />  
         <br /> 
             <asp:TextBox ID="txtNumeroBaja" Class="form-control" placeholder="Numero" runat="server" /> 
         </div>
         <br />
         <br />
            <asp:Button class="btn btn-secondary" style="margin:5px;" ID="btnAceptarBaja" Text="Aceptar" OnClick="btnAceptarBaja_Click" runat="server" />
       
    <%} %>
   
    <%else if (ddlOpcion.SelectedValue == "3"){%>
        <h3 style="color:white;">Lista de Unidad Funcionales</h3>
        <br />
    <div class="form-group col-md-4">
        <asp:Label ID="lblIDUF" style="color:white;font-weight:bold" Text="ID de Unidad Funcional" runat="server" />
        <asp:TextBox ID="txtBuscar" Class="form-control" runat="server" OnTextChanged="txtBuscar_TextChanged"/>
    </div>
        <asp:Button ID="btnBuscar" Class="btn btn-secondary" Text="Buscar" runat="server" OnClick="btnBuscar_Click"/>
        <br />
        <table class="table table-dark">
             <thead>
               <tr>
                 <th scope="col">ID</th>
                 <th scope="col">Torre</th>
                 <th scope="col">Piso</th>
                 <th scope="col">Numero</th>
                 <th scope="col">Expensas Impagas</th>
                 <th scope="col">Saldo</th>
               </tr>
             </thead>
             <tbody>
             <% foreach (Dominio.Depto item in listaDepto)
                 {%>
                 <tr>
                     <th scope="row"><%=item.ID %></th>
                     <td><%=item.torre %></td>
                     <td><%=item.piso %></td>
                     <td><%=item.numero %></td>
                     <td><%=item.impagas %></td>
                     <td><%=item.saldo %></td>
                 </tr>
                 <%} %>
             </tbody>
        </table>
    <%} %>
    <a class="btn btn-secondary" style="margin:5px;" href="Administrador.aspx">Atras</a>

  

</asp:Content>
