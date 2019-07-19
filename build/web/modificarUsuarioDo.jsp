<%-- 
    Document   : modificarUsuarioForm
    Created on : Jun 27, 2019, 5:06:17 PM
    Author     : Luis_Lopez
--%>

<%@page import="mx.com.develop.objects.Usuario"%>
<%@page import="mx.com.develop.model.MbdUsuarios"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ include file="menu.jsp" %>
<%
    String pIdUsuario = request.getParameter("idUsuario");
    int idUsuario = Integer.parseInt(pIdUsuario);
    String nombre = request.getParameter("Idnombre");
    String login = request.getParameter("login");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    
    Usuario usuario = new Usuario();
    usuario.setIdUsuario(idUsuario);
    usuario.setIdnombre(nombre);
    usuario.setLogin(login);
    usuario.setPassword(password);
    usuario.setEmail(email);
    boolean exito = new MbdUsuarios().actualizaUsuario(usuario);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Se ha modificado un usuario</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%if(exito){%>
        <div class="jumbotron">
            <h1>Se ha modificado un usuario</h1>
            <p>&nbsp;</p>
            <p><b>Nombre:</b> <%=nombre%></p>
            <p><b>Login:</b> <%=login%></p>
            <p><b>Correo:</b> <%=email%></p>
            <p><a class="btn btn-primary btn-lg" href="usuarios.jsp" role="button">Regresar</a></p>
        </div>
        <%}else{%>
        <div class="jumbotron">
            <h1>Ha ocurrido un error al modificar el usuario</h1>
            <p><a class="btn btn-primary btn-lg" href="usuarios.jsp" role="button">Regresar</a></p>
        </div>
        <%}%>
    </body>
</html>
<%@ include file="base.jsp" %>