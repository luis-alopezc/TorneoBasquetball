<%-- 
    Document   : Resultados
    Created on : Jul 4, 2019, 3:44:16 PM
    Author     : Luis_Lopez
--%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.sql.Date"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mx.com.develop.model.MbdResultados"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ include file="menu.jsp" %>
<%
    ArrayList<Partido> listaPartidos = new MbdResultados().traerTodosLosPartidosJugados();
    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    Hashtable<Integer, Equipo> equipo = new MbdEquipo().getEquipos();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de partidos jugados</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <h1>Partidos anteriores</h1>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Fecha del partido</th>
                    <th scope="col">Equipo Local</th>
                    <th scope="col">Marcador Local</th>
                    <th scope="col">Marcador Visitante</th>
                    <th scope="col">Equipo Visitante</th>
                </tr>
            </thead>
            
            <tbody>
                <%
                    Date fechaActual = new Date(System.currentTimeMillis());
                    for(Partido partido : listaPartidos){
                        Date a=partido.getFecha();
                        if (a.before(fechaActual))
                        {
                        
                %>
                <tr>  
                    <td><%=formatoFecha.format(partido.getFecha())%></td>
                    <td><%=equipo.get(partido.getEquipoLocal()).getNombre()%></td>
                    <td><%=partido.getMarcadorGlobal()%></td>
                    <td><%=partido.getMarcadorVisitante()%></td>
                    <td><%=equipo.get(partido.getEquipoVisitante()).getNombre()%></td>
                </tr>
                <%
                    }
                }%>
            </tbody>
            
        </table>
        <h1>Partidos por jugar</h1>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Fecha del partido</th>
                    <th scope="col">Equipo Local</th>
                    <th scope="col">VS</th>
                    <th scope="col">Equipo Visitante</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for(Partido partido : listaPartidos){
                        Date a=partido.getFecha();
                        if (a.after(fechaActual))
                        {
                %>
                <tr>  
                    <td><%=formatoFecha.format(partido.getFecha())%></td>
                    <td><%=equipo.get(partido.getEquipoLocal()).getNombre()%></td>
                    <th scope="col">VS</th>
                    <td><%=equipo.get(partido.getEquipoVisitante()).getNombre()%></td>
                </tr>
                <%
                    }
                }%>
            </tbody>
        </table>
    </body>
</html>
<%@ include file="base.jsp" %>