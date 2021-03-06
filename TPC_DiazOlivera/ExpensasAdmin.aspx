﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="ExpensasAdmin.aspx.cs" Inherits="TPC_DiazOlivera.ExpensasAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheet" runat="server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainAdm" runat="server">
    <h3 style="color:#393D42; padding:1%; text-shadow: 2px 2px 5px white;">Expensas</h3>
    <br />
    <%if (ver == null)
        { %>
        <a href="ExpensasAdmin.aspx?ver=pagos" class="btn btn-secondary">Verificacion de pagos</a>
        <a href="ExpensasAdmin.aspx?ver=gestion" class="btn btn-secondary">Gestion de expensas</a>
        
    <br />  
    <%} %>
    <% if (ver == "pagos")
        {%>
    <div class="form-group">
        <div class="form-group col-md-2">
        <asp:Label ID="lblEstado" Text="Estado de Expensa" runat="server" style="color:#393D42"/>
        <asp:DropDownList ID="ddlEstadoExpensa" AutoPostBack="true" CssClass="form-control" runat="server">
            
        </asp:DropDownList>
       </div>
    </div>
        <div class="Container"> 
            <div class="row">
     <%foreach (Dominio.ExpensaIndividual item in listaExpensas)
         {%>
            
          
                <div class="col">
             <div class="card text-white bg-dark mb-3" style="max-width: 18rem;">
                 <div class="card-header">Expensa ID: <%=item.ID %></div>
                    <div class="card-body">
                       <p class="card-text"><% =item.fecha.ToShortDateString() %></p>
                        <p class="card-text" style="font-weight:bold;">ID UF: <% =item.depto.ID %></p>
                       <p class="card-text" style="font-weight:bold;">$<% =item.total %></p>
                       
                        <%if (item.estado.estado != "Impaga")
                            { %>
                                <p class="card-text">Nro. de transaccion:
                                <br />
                                <% =item.transaccion%> 
                                </p>                        
                        <%} %>
                        
                        
                        <%if (item.estado.estado == "Informada")
                            { %>
                            <a class="btn btn-secondary" href="ExpensasAdmin.aspx?ID=<%=item.ID %>&estado=<%="Impaga" %>&ver=pagos">Rechazar Pago</a>
                            <br />
                            <br />
                            <a class="btn btn-secondary" href="ExpensasAdmin.aspx?ID=<%=item.ID %>&estado=<%="Paga" %>&ver=pagos">Confirmar Pago</a>
                        <%} %>
                    </div>
                  </div>
            </div>
         
        <%} %>
        </div>
            
            <br />
            <a href="ExpensasAdmin.aspx" class="btn btn-secondary">Atras</a>
    </div>
    <%} %>
    <%else if (ver == "Incorporar"||ver=="gestion")
        { %>
    <div class="contenedor">
    <h5 style="color:#393D42; text-shadow: 2px 2px 5px white;">Confeccion de Gastos</h5>
        </div>
    <br />
    <%--INPUTS PARA INGRESAR LOS GASTOS--%>
    <div class="form-row">
    <div class="form-group col-md-2">
        <asp:Label ID="lblFecha"  Text="Fecha" runat="server" style="color:#393D42"/>
        <asp:TextBox ID="txtFecha" ReadOnly="true" Class="form-control" runat="server" />  
    </div>
    
    <div class="form-group">
        <asp:Label ID="lblTipo" Text="Tipo de Gasto" runat="server" style="color:#393D42"/>
        <asp:DropDownList ID="ddlTipoGasto" CssClass="form-control" runat="server">
            
        </asp:DropDownList>
    </div>
    <div class="form-group col-md-2">
      <asp:Label ID="lblImporte" Text="Importe" runat="server" style="color:#393D42" />
      <asp:TextBox ID="txtImporte" Class="form-control" runat="server" />
      <asp:RangeValidator ID="validacionImporte" runat="server" ControlToValidate="txtImporte" ErrorMessage="El valor ingresado debe ser numerico" MaximumValue = "100000"  MinimumValue = "0"  Type="Double" />

    </div>
  </div>
    <div class="form-group col-md-2">
        <asp:Button ID="btnAgregar" Text="Cargar" runat="server" Onclick="btnAgregar_Click" class="btn btn-secondary"/>
    </div>


<%--    INPUT PARA INGRESAR UN NUEVO TIPO DE GASTO--%>

    <div class="form-row">   
        <div class="form-group col-md-2">
             <asp:Label ID="lblAgregarTipoGasto" Text="Tipo de Gasto" runat="server" style="color:#393D42"/>
             <asp:TextBox ID="txtAgregarTipoGasto" Class="form-control" runat="server" />
             <asp:RegularExpressionValidator ID="validarTipoGasto" runat="server" ControlToValidate="txtAgregarTipoGasto" ValidationGroup="regexptest" ValidationExpression="^[a-z & A-Z]*$" ErrorMessage="El valor ingresado debe ser alfabetico"/>

         </div>
     </div>
    <div class="form-group col-md-2">
        <asp:Button ID="btnAgregarTipoGasto" Text="Agregar" runat="server" OnClick="btnAgregarTipoGasto_Click" class="btn btn-secondary"/>
    </div>

<%--LISTA DE GASTOS INGRESADOS--%>
    <asp:Label Text="Lista de gastos" runat="server" style="color:#393D42;font-weight:bold;font-size:large;"></asp:Label>
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
                  <td><%=item.tipo.tipo%></td>
                  <td><%=item.importe %></td>
             </tr>
      
                <% acu += item.importe;%>
            

        <%} %>
        <th colspan="3" style="text-align:right"> Total: $</th>
        <th><%=acu.ToString()%></th>
     </tbody>
    </table>
    <a href="ExpensasAdmin.aspx" class="btn btn-secondary">Volver</a>

    <a class="btn btn-secondary" href="ExpensasAdmin.aspx?ver=Confeccionar">Siguiente</a>
    <br />  
    <% }%>
    <%else if (ver == "Confeccionar")
        { %>
     <asp:Label Text="Lista de gastos" runat="server" style="color:lavender"></asp:Label>
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
                  <td><%=item.tipo.tipo%></td>
                  <td><%=item.importe %></td>
             </tr>
      
                <% acu += item.importe;%>
            

        <%} %>
        <th colspan="3" style="text-align:right"> Total: $</th>
        <th><%=acu.ToString()%></th>
     </tbody>
    </table>
    <a class="btn btn-secondary" href="ExpensasAdmin.aspx?ver=Incorporar">Atras</a>
     <asp:Button ID="Confeccionar" Text="Confeccionar Expensa" runat="server" Onclick="Confeccionar_Click" class="btn btn-secondary"/>
    
    <br />  
    <% }%>


    

</asp:Content>
