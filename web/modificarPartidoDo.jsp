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
    int equipo_local = Integer.parseInt(request.getParameter("idEquipo1"));
    int equipo_visitante = Integer.parseInt(request.getParameter("idEquipo2"));
    String estatus = request.getParameter("estatus");
    int Estatus = Integer.parseInt(estatus);
    int marcador_global = Integer.parseInt(request.getParameter("marcador_global"));
    int marcador_visitante = Integer.parseInt(request.getParameter("marcador_visitante"));
    String Cancha = request.getParameter("cancha");
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'kk:mm");
    java.util.Date fecha = formatter.parse(request.getParameter("fecha"));

    Partido partido = new Partido();
    partido.setIdPartido(idPartido);
    partido.setEquipoLocal(equipo_local);
    partido.setEquipoVisitante(equipo_visitante);
    partido.setEstatus(Estatus);
    partido.setMarcadorGlobal(marcador_global);
    partido.setMarcadorVisitante(marcador_visitante);
    partido.setCancha(Cancha);
    partido.setFecha(new Date(fecha.getTime()));
    boolean exito = new MbdPartidos().actualizaPartido(partido);
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
            <p><b>Equipo local:</b> <%=equipo_local%></p>
            <p><b>Equipo visitante:</b> <%=equipo_visitante%></p>
            <p><b>Estatus:</b> <%=partido.getEs()%></p>
            <p><b>Marcador local:</b> <%=marcador_global%></p>
            <p><b>Marcador visitante:</b> <%=marcador_visitante%></p>
            <p><b>Fecha:</b> <%=fecha%></p>
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