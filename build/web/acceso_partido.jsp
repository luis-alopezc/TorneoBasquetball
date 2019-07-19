<%-- 
    Document   : acceso_partido
    Created on : Jun 25, 2019, 4:26:37 PM
    Author     : Luis_Lopez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String equipoLocal = request.getParameter("equipoLocal");
    String equipoVisitante = request.getParameter("equipoVisitante");
    String estatus = request.getParameter("estatus");
    String marcadorLocal = request.getParameter("marcadorLocal");
    String marcadorVisitante = request.getParameter("marcadorVisitante");
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
        <p><b>Equipo local:</b><%=equipoLocal%></p>
        <p><b>Equipo visitante:</b><%=equipoVisitante%></p>
        <p><b>Estatura:</b><%=estatus%></p>
        <p><b>Marcador local:</b><%=marcadorLocal%></p>
        <p><b>Marcador visitante:</b><%=marcadorVisitante%></p>
        <form action="Agregar_partido.jsp" method="POST">
            <button type="submit" class="btn-primary">Regresar a la pagina anterior</button>
        </form>
    </body>
</html>
<%@ include file="base.jsp" %>