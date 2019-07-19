<%-- 
    Document   : eliminarUsuarioForm
    Created on : Jun 27, 2019, 5:08:04 PM
    Author     : Luis_Lopez
--%>

<%@page import="mx.com.develop.model.MbdJugadores"%>
<%@page import="mx.com.develop.objects.Jugador"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>
<%    String pIdEquipo = request.getParameter("idEquipo");
    int idEquipo = Integer.parseInt(pIdEquipo);
    int idEquipoV = idEquipo;
    int jugadores = 0;
    int partidosL = 0;
    int partidosV = 0;
    boolean exito = true;
    ArrayList<Partido> listaPartidos = new MbdPartidos().traerTodosLosPartidos();

    for (Partido partido : listaPartidos) {
        //int a = partido.getEstatus();
        //if (a == 1) {
            if (idEquipo == partido.getEquipoLocal()) {
                partidosL++;
            }
            if (idEquipo == partido.getEquipoVisitante()) {
                partidosV++;
            }
        //}
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Se ha eliminado un equipo</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%
            ArrayList<Jugador> listaJugadores = new MbdJugadores().traerTodosLosJugadores();
            for (Jugador jugador : listaJugadores) {
                if (idEquipo == jugador.getIdEquipo()) {
                    jugadores++;
                }
            }
            if (jugadores == 0 && partidosV == 0 && partidosL == 0) {
                Equipo equipo = new MbdEquipo().buscaEquipo(idEquipo);
                new MbdEquipo().eliminaEquipo(idEquipo);

        %>
        <div class="jumbotron">
            <h1>Se ha eliminado un equipo</h1>
            <p>&nbsp;</p>
            <p><b>Nombre:</b> <%=equipo.getNombre()%></p>
            <p><b>Logotipo:</b> <%=equipo.getLogotipo()%></p>
            <p><b>Correo Primario:</b> <%=equipo.getColorPrimario()%></p>
            <p><b>Correo Secundario:</b> <%=equipo.getColorPrimario()%></p>
            <p><a class="btn btn-primary btn-lg" href="equipos.jsp" role="button">Regresar</a></p>
        </div>

        <%
        } else {
        %>
        <div class="jumbotron">
            <h1>No se puede eliminar este equipo</h1>
            <p><b>Tiene :</b> <%=jugadores%><b> jugadores</b> </p>
            <p><b>Tiene :</b> <%=partidosL%><b> partidos de local</b></p>
            <p><b>Tiene :</b> <%=partidosV%><b> partidos de visitante</b></p>
            <p><a class="btn btn-primary btn-lg" href="equipos.jsp" role="button">Regresar</a></p>
        </div>
        <%
            }
        %>
    </body>
</html>
<%@ include file="base.jsp" %>