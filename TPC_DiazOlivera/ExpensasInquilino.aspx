<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExpensasInquilino.aspx.cs" Inherits="TPC_DiazOlivera.ExpensasInquilino" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="headInquilino" runat="server">

</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="Stylesheets" runat="server">
    

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <h2 style="color:lavender;">Expensas</h2>
    <br /> 
    <a  href="ExpensasInquilino.aspx?ver=todas" class="btn btn-secondary">Todas</a>
    <a  href="ExpensasInquilino.aspx?ver=impagas" class="btn btn-secondary">Impagas</a>
    <br />  
   <div class="Container"> 
    <% if (Request.QueryString["ID"] != null && Request.QueryString["estado"] != null)
        {%>
            <h4 style="color:lavender">Ingrese el Numero de Transaccion:</h4>
            <br />
            <div class="form-group col-md-4">
            <asp:TextBox ID="txtOperacion" Class="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="validacionOperacion" runat="server" ControlToValidate="txtOperacion"  ErrorMessage= "Debe ingresar un número de transaccion" ForeColor="Red" display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="validaOperacion" runat="server" ControlToValidate="txtOperacion" ValidationExpression="^[0-9]*$" ErrorMessage="El valor debe ser numerico"  display="Dynamic" ForeColor="Red"/>
            </div>
            <span class="input-group-btn">
            <asp:Button ID="btnIngresarTransferencia" CssClass="btn btn-secondary" OnClick="btnIngresarTransferencia_Click" Text="Ingresar" runat="server" />  
            </span>

            <br />
       <%} %>
        <%else
            {%>
              <div class="row">  
            <%foreach (Dominio.ExpensaIndividual item in listaExpensas)
                {%>  
                    <div class="card-deck text-white bg-dark mb-3" style="margin:5px; width:180px;" >
                        <%--max-width: 18rem;--%>
                        <div class="card-header" style="text-align:center;">Expensa ID: <%=item.ID %>
                            <div class="card-body" style="text-align:center;">
                                <h5 class="card-title"  style="text-align:center;"><% =item.fecha.Date.ToShortDateString() %></h5>
                                <p class="card-text" style="font-weight:bold; text-align:center;">$<% =item.total%></p>
                        <%if (item.estado.estado == "Paga")
                          { %>
                                <p class="card-text"  style="text-align:center; font-size:15px;background-color:darkseagreen;color:white;font-weight:bold"><% =item.estado.estado%></p>
                        <%}
                            else if (item.estado.estado == "Informada")
                             {%>
                                 <p class="card-text" style="text-align:center;font-size:15px;background-color:#FFFFCC;color:black;font-weight:bold"><% =item.estado.estado%></p>
                             <%} %>
                          <%else if (item.estado.estado == "Impaga")
                             {%>
                                <p class="card-text" style="text-align:center;font-size:15px;background-color:indianred;color:white;font-weight:bold"><% =item.estado.estado%></p>                                     
                                <a class="btn btn-secondary" href="ExpensasInquilino.aspx?ID=<%=item.ID %>&estado=<%="Informado" %>">Informar Pago</a>
                            <%} %>
                        </div>
                    </div>
                </div>
             <%} %>
        </div>
       <%}%>
          
    </div>
     <a class="btn btn-secondary" <%--style="position:absolute; bottom:40px;"--%> href="Inquilino.aspx">Atras</a>
    


</asp:Content>
