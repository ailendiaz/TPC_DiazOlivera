﻿<%@ Page Title="Inquilino" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inquilino.aspx.cs" Inherits="TPC_DiazOlivera.About" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="Stylesheets" runat="server">
     <link rel="stylesheet" href="../Estilo/Inquilino.css" type="text/css" />
    

    <h2 style="color:lavender; padding:1%">Bienvenido/a: <% =inquilino.nombre +" "+inquilino.apellido %>.</h2>


    <div class="wrapper">

        <div class="cols">
			<div class="col" ontouchstart="this.classList.toggle('hover');">
				<div class="containerInq">
					<div class="front" style="background-image: url(https://verfachadasdecasas.com/wp-content/uploads/2017/05/Fachada-angosta-y-alta-con-rejas.jpg)">
						<div class="inner">
							<p>Estado de Cuenta</p>
						</div>
					</div>
					<div class="back">
						<div class="inner">
                            <a href="ExpensasInquilino" class="btn btn-secondary">Ingresar</a>
						</div>
					</div>
					</div>
				</div>


					<div class="col" ontouchstart="this.classList.toggle('hover');">
				<div class="containerInq">

					<div class="front" style="background-image: url(https://verfachadasdecasas.com/wp-content/uploads/2017/05/Fachada-angosta-y-alta-con-rejas.jpg)">
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
					<div class="front" style="background-image: url(https://verfachadasdecasas.com/wp-content/uploads/2017/05/Fachada-angosta-y-alta-con-rejas.jpg)">
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

				</div>
			</div>

      


</asp:Content>

