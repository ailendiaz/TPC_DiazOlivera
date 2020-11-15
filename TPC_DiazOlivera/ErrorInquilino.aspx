<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ErrorInquilino.aspx.cs" Inherits="TPC_DiazOlivera.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headInquilino" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Stylesheets" runat="server">
    <tbody>
    <div> 
        <asp:Label Text="Error: <%=error %>" runat="server" /> <p> </p>
    </div>
    </tbody>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div> 
        <asp:Label Text="<% =detalleError %>" runat="server" />
    </div>
</asp:Content>
<%--<a href="ErrorInquilino.aspx.designer.cs">ErrorInquilino.aspx.designer.cs</a>--%>