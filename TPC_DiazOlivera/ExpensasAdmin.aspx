<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="ExpensasAdmin.aspx.cs" Inherits="TPC_DiazOlivera.ExpensasAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Estilo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainAdm" runat="server">
    <asp:Label ID="lblTitulo" Text="Gestion de expensas" runat="server" />
        <table class="table table-dark">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Fecha</th>
      <th scope="col">Tipo de Gasto</th>
      <th scope="col">Importe</th>
    </tr>
  </thead>
            <tbody>
  
    
    <% int con = 0;%>
    <% System.Data.SqlTypes.SqlMoney acu = 0;%>

    <% foreach (Dominio.Gastos item in listaGastos)
        {%>
            <% con++;%>
            
            
              <tr>
              <th scope="row"><%=con %></th>
             
                  <td><%=item.fechaHora %></td>
                  <td><%= item.tipo.ID%></td>
                  <td><%=item.importe %></td>
             </tr>
      
                <% acu+= item.importe;%>
            

        <%} %>
        <th colspan="3" style="text-align:right"> Total: $</th>
        <th><%=acu.ToString()%></th>
     </tbody>
    </table>
    <br />  
    
    <%--INPUTS PARA INGRESAR LOS GASTOS--%>
    <div class="form-row">
    <div class="form-group col-md-2">
        <asp:Label ID="lblFecha"  Text="Fecha" runat="server" />
        <asp:TextBox ID="txtFecha" ReadOnly="true" Class="form-control" runat="server" />  
    </div>
    <div class="form-group col-md-4">
        <asp:Label ID="lblTipo" Text="Tipo de Gasto" runat="server" />
        <asp:DropDownList ID="ddlTipoGasto" CssClass="form-control" runat="server">
            
        </asp:DropDownList>
    </div>
    <div class="form-group col-md-2">
      <asp:Label ID="lblImporte" Text="Importe" runat="server" />
      <asp:TextBox ID="txtImporte" Class="form-control" runat="server" />
    </div>
  </div>
    <div class="form-group col-md-2">
        <asp:Button ID="btnAgregar" Text="Agregar" runat="server" Onclick="btnAgregar_Click"/>
    </div>

<%--    INPUT PARA INGRESAR UN NUEVO TIPO DE GASTO--%>
    <div class="container">   
        <div class="form-group col-md-2">
             <asp:Label ID="lblAgregarTipoGasto" Text="Tipo de Gasto" runat="server" />
             <asp:TextBox ID="txtAgregarTipoGasto" Class="form-control" runat="server" />
         </div>
     </div>
    <div class="form-group col-md-2">
        <asp:Button ID="btnAgregarTipoGasto" Text="Agregar" runat="server" OnClick="btnAgregarTipoGasto_Click"/>
    </div>

    


</asp:Content>
