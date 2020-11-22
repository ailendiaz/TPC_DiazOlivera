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
                 <div class="card-header">Expensa ID: <%=item.ID %></div>
                    <div class="card-body">
                       <h5 class="card-title"><% =item.fecha.Date %></h5>
                         <p class="card-text">$<% =item.total %></p>

                        <%if (item.estado.estado == "Impaga")
                            {%>
                              <a href="ExpensasInquilino.aspx?ID=<%=item.ID %>&estado=<%="Informado" %>">Informar Pago</a>
                            <%}
                                %>
                        
                    </div>
                
            </div>
        <%} %>
            </div>
    </div>

</asp:Content>
