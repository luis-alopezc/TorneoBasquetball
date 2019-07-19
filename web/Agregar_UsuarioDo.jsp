<%-- 
    Document   : AgregarEquipoDo
    Created on : Jun 27, 2019, 4:30:31 PM
    Author     : Luis_Lopez
--%>

<%@page import="mx.com.develop.objects.Usuario"%>
<%@page import="mx.com.develop.model.MbdUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>
<%
    String nombre = request.getParameter("Idnombre");
    String login = request.getParameter("login");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    
    Usuario usuario = new Usuario();
    usuario.setIdnombre(nombre);
    usuario.setLogin(login);
    usuario.setPassword(password);
    usuario.setEmail(email);
    boolean exito = new MbdUsuarios().insertaUsuario(usuario);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Se ha agregado un usuario</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%if(exito){%>
        <div class="jumbotron">
            <h1>Se ha agregado un usuario</h1>
            <p>&nbsp;</p>
            <p><b>Nombre:</b> <%=nombre%></p>
            <p><b>Login:</b> <%=login%></p>
            <p><b>Correo:</b> <%=email%></p>
            <p><a class="btn btn-primary btn-lg" href="usuarios.jsp" role="button">Regresar</a></p>
        </div>
        <%}else{%>
        <div class="jumbotron">
            <h1>Ocurrió un error al agregar el usuario</h1>
            <p><a class="btn btn-primary btn-lg" href="usuarios.jsp" role="button">Regresar</a></p>
        </div>
        <%}%>
    </body>
</html>
<%@ include file="base.jsp" %>