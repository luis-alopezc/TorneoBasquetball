<%-- 
    Document   : acceso_jugador
    Created on : Jun 25, 2019, 4:26:22 PM
    Author     : Luis_Lopez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idnombre = request.getParameter("idnombre");
    String direccion = request.getParameter("direccion");
    String fechadenacimiento = request.getParameter("fechadenacimiento");
    String foto = request.getParameter("foto");
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
        <p><b>Direccion:</b><%=direccion%></p>
        <p><b>Fecha de nacimkento:</b><%=fechadenacimiento%></p>
        <p><b>Foto:</b><%=foto%></p>
        <form action="Agregar_jugador.jsp" method="POST">
            <button type="submit" class="btn btn-primary">Regresar a la pagina anterior</button>
        </form>
    </body>
</html>
<%@ include file="base.jsp" %>