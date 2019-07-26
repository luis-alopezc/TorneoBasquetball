<%-- 
    Document   : partidos
    Created on : Jun 25, 2019, 7:00:10 PM
    Author     : Luis_Lopez
--%>

<%@page import="mx.com.develop.model.MbdCanchas"%>
<%@page import="mx.com.develop.objects.Cancha"%>
<%@page import="java.util.Hashtable"%>
<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>
<%
    ArrayList<Partido> listaPartidos = new MbdPartidos().traerTodosLosPartidos();
    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    Hashtable<Integer, Equipo> equipo = new MbdEquipo().getEquipos();
    Hashtable<Integer, Cancha> canchas = new MbdCanchas().getCanchas();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de partidos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Equipo Local</th>
                    <th scope="col">Equipo Visitante</th>
                    <th scope="col">Estatus</th>
                    <th scope="col">Marcador Local</th>
                    <th scope="col">Marcador Visitante</th>
                    <th scope="col">Cancha</th>
                    <th scope="col">Fecha y hora de juego</th>
                    <th scope="col">Equipo Ganador</th>
                </tr>
            </thead>
            
            <tbody>
                <%for(Partido partido : listaPartidos){%>
                <tr>              
                    <th scope="row"><%=partido.getIdPartido()%></th>
                    <td><%=equipo.get(partido.getEquipoLocal()).getNombre()%></td>
                    <td><%=equipo.get(partido.getEquipoVisitante()).getNombre()%></td>
                    <td><%=partido.getEs()%></td>
                    <td><%=partido.getMarcadorGlobal()%></td>
                    <td><%=partido.getMarcadorVisitante()%></td>
                    <td><%=canchas.get(partido.getIdCancha()).getDescripcion()%></td>
                    <td><%=formatoFecha.format(partido.getFecha())%></td>
                    <th><%=partido.getEquipoGanador()%></th>
                    <td><a class="btn btn-primary btn-lg" href="modificarPartidoForm.jsp?idPartido=<%=partido.getIdPartido()%>" role="button">Modificar</a></td>
                    <td><a class="btn btn-primary btn-lg" href="eliminarPartidoForm.jsp?idPartido=<%=partido.getIdPartido()%>" role="button">Eliminar</a></td>
                    <td><a class="btn btn-primary btn-lg" href="modificarMarcadorForm.jsp?idPartido=<%=partido.getIdPartido()%>" role="button">Modificar Marcador</a></td>
                </tr>
                <%}%>
            </tbody>
            <tfoot>
                <p><a class="btn btn-primary btn-lg" href="AgregarPartidoForm.jsp" role="button">Agregar Partido</a></p>
            </tfoot>
        </table>
    </body>
</html>
<%@ include file="base.jsp" %>
