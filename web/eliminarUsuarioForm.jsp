<%-- 
    Document   : eliminarUsuarioForm
    Created on : Jun 27, 2019, 5:08:04 PM
    Author     : Luis_Lopez
--%>

<%@page import="mx.com.develop.model.MbdUsuarios"%>
<%@page import="mx.com.develop.objects.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pIdUsuario = request.getParameter("idUsuario");
    int idUsuario = Integer.parseInt(pIdUsuario);
    Usuario usuario = new MbdUsuarios().buscaUsuario(idUsuario);
    new MbdUsuarios().eliminaUsuario(idUsuario);
%>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Se ha eliminado un usuario</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="jumbotron">
            <h1>Se ha eliminado un usuario</h1>
            <p>&nbsp;</p>
            <p><b>Nombre:</b> <%=usuario.getIdnombre()%></p>
            <p><b>Login:</b> <%=usuario.getLogin()%></p>
            <p><b>Correo:</b> <%=usuario.getEmail()%></p>
            <p><a class="btn btn-primary btn-lg" href="usuarios.jsp" role="button">Regresar</a></p>
        </div>
    </body>
</html>
<%@ include file="base.jsp" %>