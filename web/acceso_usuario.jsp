<%-- 
    Document   : acceso_usuario
    Created on : Jun 25, 2019, 4:26:01 PM
    Author     : Luis_Lopez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idnombre = request.getParameter("idnombre");
    String login = request.getParameter("login");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
%>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <p><b>Nombre del usuario:</b><%=idnombre%></p>
        <p><b>Usuario:</b><%=login%></p>
        <p><b>Contraseña:</b><%=password%></p>
        <p><b>Correo:</b><%=email%></p>
        <form action="Agregar_Usuario.jsp" method="POST">
            <button type="submit" class="btn btn-primary">Regresar a la pagina anterior</button>
        </form>
    </body>
</html>
<%@ include file="base.jsp" %>