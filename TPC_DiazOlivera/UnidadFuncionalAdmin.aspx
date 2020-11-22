<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="UnidadFuncionalAdmin.aspx.cs" Inherits="TPC_DiazOlivera.UnidadFuncionalAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Estilo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainAdm" runat="server">
    <h1 style="color:white;">Unidad Funcional</h1>
    <br /> 
    <h3 style="color:white;">Elija una Operacion</h3>
    <br />       
    <a class="btn btn-secondary" href="UnidadFuncionalAdmin.aspx?ver=Alta">Alta</a>
    <a class="btn btn-secondary" href="UnidadFuncionalAdmin.aspx?ver=Baja">Baja</a>
    <a class="btn btn-secondary" href="UnidadFuncionalAdmin.aspx?ver=Listar">Listar</a>
    <br />
    <%--<a class="btn btn-secondary" href="UnidadFuncionalAdmin.aspx?ver=Modificacion">Modificacion</a>--%>
    <br /> 
    <%if (ver == "Alta")
        { %>
        <h3 style="color:white;">Alta</h3>  
            <asp:TextBox ID="txtTorreAlta" placeholder="Torre" runat="server" />  
         <br /> 
             <asp:TextBox ID="txtPisoAlta" placeholder="Piso" runat="server" />  
         <br /> 
             <asp:TextBox ID="txtNumeroAlta" placeholder="Numero" runat="server" /> 
         <br />
             <asp:TextBox ID="txtDNIAlta" placeholder="DNI del Inquilino" runat="server" /> 
         <br />
            <asp:Button class="btn btn-secondary" ID="btnAceptarAlta" Text="Aceptar" OnClick="btnAceptarAlta_Click" runat="server" />
    <% } %>
    <% else if (ver == "Baja")
    { %>
        <h3 style="color:white;">Baja</h3>
             <asp:TextBox ID="txtTorreBaja" placeholder="Torre" runat="server" />  
         <br /> 
             <asp:TextBox ID="txtPisoBaja" placeholder="Piso" runat="server" />  
         <br /> 
             <asp:TextBox ID="txtNumeroBaja" placeholder="Numero" runat="server" /> 
         <br />
            <asp:Button class="btn btn-secondary" ID="btnAceptarBaja" Text="Aceptar" OnClick="btnAceptarBaja_Click" runat="server" />

    <%} %>
   
    <% else if (ver == "Listar")
    { %>
        <h3 style="color:white;">Lista de Unidad Funcionales</h3>
    <br />
    <asp:Label ID="lblIDUF" style="color:white;font-weight:bold" Text="ID de Unidad Funcional" runat="server" />
    <asp:TextBox ID="txtBuscar" runat="server" OnTextChanged="txtBuscar_TextChanged"/>
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
  

</asp:Content>
