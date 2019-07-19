<%-- 
    Document   : acceso
    Created on : Jun 24, 2019, 9:51:26 PM
    Author     : Luis_Lopez
--%>
<%@page import="mx.com.develop.model.MbdUsuarios"%>
<%@page import="mx.com.develop.objects.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String login = request.getParameter("login");
    String password = request.getParameter("password");
    Usuario usuario = new MbdUsuarios().buscaUsuario(login, password);
    session.setAttribute("usuarioEnSesion", usuario);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>Acceso</title>
    </head>
    <body>
        <%if(usuario!=null){%>
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
                        <a class="nav-link" href="Resultados.jsp">Resultados  y Partidos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="TablaDePosiciones.jsp">Tabla de posiciones </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="bitacoraForm.jsp">Bitacora </a>
                    </li>
</ul>
        <h1>Bienvenido <%=login%>!</h1>
        <%}else{%>
        <h1>Usuario no existe</h1>
        <%}%>
    </body>
</html>
