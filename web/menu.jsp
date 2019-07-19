<%-- 
    Document   : menu
    Created on : Jul 4, 2019, 12:00:50 AM
    Author     : Luis_Lopez
--%>

<%@page import="mx.com.develop.objects.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usuarioEnSesion = (Usuario)session.getAttribute("usuarioEnSesion");
    if(usuarioEnSesion!=null){
        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Torneo de Basquetbol</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="nav nav-pills nav-justified">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="equipos.jsp">Equipos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="partidos.jsp">Partidos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="usuarios.jsp">Usuarios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="jugadores.jsp">Jugadores</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Resultados.jsp">Resultados y Partidos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="TablaDePosiciones.jsp">Tabla de posiciones </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="bitacoraForm.jsp">Bitacora </a>
                    </li>
                </ul>
            </div>
        </nav>
