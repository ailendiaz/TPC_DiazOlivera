<%@ Page Title="Inquilino" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inquilino.aspx.cs" Inherits="TPC_DiazOlivera.About" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="Stylesheets" runat="server">
     <link rel="stylesheet" href="../Estilo/Inquilino.css" type="text/css" />
    

    <h2 style="color:lavender; padding:1%">Bienvenido:<% =inquilino.nombre +" "+inquilino.apellido %>.</h2>


<%--    <div class="wrapper">
        
        <%foreach (Dominio.Opciones item in listaOpciones)
            {%>
        <%if (item.tipo.ID == 2)
            { %>

        
  <div class="cols col-4">
			<div class="col" ontouchstart="this.classList.toggle('hover');">
				<div class="containerInq">
					<div class="front" style="background-image: url(https://unsplash.it/500/500/)">
						<div class="inner">
							<p><%=item.nombre %></p>
						</div>
					</div>
					<div class="back">
						<div class="inner">
                            <%--<asp:Button />--%>
						<%--</div>
					</div>
				</div>
			</div>

      </div>--%>


 
        <% %>

        <%  %>
            
  <%--  </div>--%>
    

    <div class="wrapper">

        <div class="cols">
			<div class="col" ontouchstart="this.classList.toggle('hover');">
				<div class="containerInq">
					<div class="front" style="background-image: url(https://unsplash.it/500/500/)">
						<div class="inner">
							<p>Novedades</p>
						</div>
					</div>
					<div class="back">
						<div class="inner">
                            <a href="NovedadesInquilino.aspx" class="btn btn-secondary">Ingresar</a>
						</div>
					</div>
					</div>
				</div>


					<div class="col" ontouchstart="this.classList.toggle('hover');">
				<div class="containerInq">

					<div class="front" style="background-image: url(https://unsplash.it/500/500/)">
						<div class="inner">
							<p>Reclamos</p>
						</div>
					</div>
					<div class="back">
						<div class="inner">
                            <a href="ReclamosInquilino.aspx" class="btn btn-secondary">Ingresar</a>
						</div>
					</div>
					</div>
					</div>

					<div class="col" ontouchstart="this.classList.toggle('hover');">
				<div class="containerInq">
					<div class="front" style="background-image: url(https://unsplash.it/500/500/)">
						<div class="inner">
							<p>Estado de Cuenta</p>
						</div>
					</div>
					<div class="back">
						<div class="inner">
                            <a href="ExpensasInquilino.aspx" class="btn btn-secondary">Ingresar</a>
						</div>
					</div>
					</div>
					</div>

				</div>
			</div>

      


</asp:Content>

