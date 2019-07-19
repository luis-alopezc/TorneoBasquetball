<%-- 
    Document   : eliminarUsuarioForm
    Created on : Jun 27, 2019, 5:08:04 PM
    Author     : Luis_Lopez
--%>

<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdPartido = request.getParameter("idPartido");
    int idPartido = Integer.parseInt(pIdPartido);
    Partido partido = new MbdPartidos().buscaPartido(idPartido);
    
    new MbdPartidos().eliminaPartido(idPartido);
%>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Se ha eliminado un partido</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="jumbotron">
            <h1>Se ha eliminado un partido</h1>
            <p>&nbsp;</p>
            <p><b>Equipo local:</b> <%=partido.getEquipoLocal()%></p>
            <p><b>Equipo visitante:</b> <%=partido.getEquipoVisitante()%></p>
            <p><b>Fecha del partido:</b> <%=partido.getFecha()%></p>
            <p><a class="btn btn-primary btn-lg" href="partidos.jsp" role="button">Regresar</a></p>
        </div>
    </body>
</html>
<%@ include file="base.jsp" %>