<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExpensasInquilino.aspx.cs" Inherits="TPC_DiazOlivera.ExpensasInquilino" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headInquilino" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Stylesheets" runat="server">
    

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <h1 style="color:white;">Expensas</h1>
    <br /> 
    <a  href="ExpensasInquilino.aspx?ver=todas" class="btn btn-secondary">Todas</a>
    <a  href="ExpensasInquilino.aspx?ver=impagas" class="btn btn-secondary">Impagas</a>
    <br />  
   <div class="Container"> 
       <div class="row">
    <%foreach (Dominio.ExpensaIndividual item in listaExpensas)
        {%>
            
              
             <div class="card text-white bg-dark mb-3" style="max-width: 18rem;">
                 <div class="card-header">Expensa ID: <%=item.ID %>
                    <div class="card-body">
                       <h5 class="card-title"><% =item.fecha.Date %></h5>
                         <p class="card-text">$<% =item.total%></p>
                        <%if (item.estado.estado == "Paga")
                            { %>
                             <p class="card-text"  style="text-align:center; font-size:15px;background-color:green;color:white;font-weight:bold"><% =item.estado.estado%></p>

                        <%}
                            else if (item.estado.estado == "Informada")
                             {%>
                             <p class="card-text" style="text-align:center;font-size:15px;background-color:yellow;color:black;font-weight:bold"><% =item.estado.estado%></p>
                             <%} %>
                          <%else if (item.estado.estado == "Impaga")
                             {%>
                              <p class="card-text" style="text-align:center;font-size:15px;background-color:indianred;color:white;font-weight:bold"><% =item.estado.estado%></p>
                              <a class="btn btn-secondary" href="ExpensasInquilino.aspx?ID=<%=item.ID %>&estado=<%="Informado" %>">Informar Pago</a>
                            <%}
                                %>
                        
                    </div>
                </div>
            </div>
        <%} %>
            </div>
       <a class="btn btn-secondary" href="Inquilino.aspx">Atras</a>
    </div>
</asp:Content>
