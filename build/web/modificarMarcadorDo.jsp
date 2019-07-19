<%-- 
    Document   : modificarUsuarioForm
    Created on : Jun 27, 2019, 5:06:17 PM
    Author     : Luis_Lopez
--%>
<%@page import="java.sql.Date"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ include file="menu.jsp" %>
<%
    String IdPartido = request.getParameter("idPartido");
    int idPartido = Integer.parseInt(IdPartido);
    String estatus = request.getParameter("estatus");
    int Estatus = Integer.parseInt(estatus);
    int es=Estatus;
    int marcador_global = Integer.parseInt(request.getParameter("marcador_global"));
    int marcador_visitante = Integer.parseInt(request.getParameter("marcador_visitante"));

    Partido partido = new Partido();
    partido.setIdPartido(idPartido);
    partido.setEstatus(Estatus);
    partido.setMarcadorGlobal(marcador_global);
    partido.setMarcadorVisitante(marcador_visitante);
    boolean exito = new MbdPartidos().actualizaMarcador(partido);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Se ha modificado un partido</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%if(exito){%>
        <div class="jumbotron">
            <h1>Se ha modificado un partido</h1>
            <p>&nbsp;</p>
            <p><b>Estatus:</b> <%=partido.getEs()%></p>
            <p><b>Marcador local:</b> <%=marcador_global%></p>
            <p><b>Marcador visitante:</b> <%=marcador_visitante%></p>
            <p><a class="btn btn-primary btn-lg" href="partidos.jsp" role="button">Regresar</a></p>
        </div>
        <%}else{%>
        <div class="jumbotron">
            <h1>Ocurrio un error al modificar el jugador</h1>
            <p><a class="btn btn-primary btn-lg" href="partidos.jsp" role="button">Regresar</a></p>
        </div>
        <%}%>
    </body>
</html>
<%@ include file="base.jsp" %>