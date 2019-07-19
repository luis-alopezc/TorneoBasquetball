<%-- 
    Document   : jugadores
    Created on : Jun 25, 2019, 6:59:44 PM
    Author     : Luis_Lopez
--%>
<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.io.File"%>
<%@page import="mx.com.develop.tools.ImageTools"%>
<%@page import="mx.com.develop.model.MbdJugadores"%>
<%@page import="mx.com.develop.model.MbdUsuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="mx.com.develop.objects.Jugador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Jugador> listaJugadores = new MbdJugadores().traerTodosLosJugadores();
    String uploadFolder = ResourceBundle.getBundle("mx.com.develop.properties.rutas").getString("rutaArchivos");
    Hashtable<Integer, Equipo> equipo = new MbdEquipo().getEquipos();
%>
<%@ include file="menu.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de jugadores</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Equipo</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Direccion</th>
                    <th scope="col">Fecha de nacimiento</th>
                    <th scope="col">Foto</th>
                </tr>
            </thead>
            <tbody>
                <%for(Jugador jugador: listaJugadores){
                    File archivoImagen=new File(uploadFolder+jugador.getFotografia());
                
                %>
                <tr>
                    <th scope="row"><%=jugador.getIdJugador()%></th>
                    <td><%=equipo.get(jugador.getIdEquipo()).getNombre()%></td>
                    <td><%=jugador.getNombre()%></td>
                    <td><%=jugador.getDireccion()%></td>
                    <td><%=jugador.getFechaDeNacimiento()%></td>
                    <td><img style="display:block; width:auto;height:100px;" src="<%=ImageTools.encodeFileToBase64Binary(archivoImagen)%>" /></td>
                    <td><a class="btn btn-primary btn-lg" href="modificarJugadorForm.jsp?idJugador=<%=jugador.getIdJugador()%>" role="button">Modificar</a></td>
                    <td><a class="btn btn-primary btn-lg" href="eliminarJugadorForm.jsp?idJugador=<%=jugador.getIdJugador()%>" role="button">Eliminar</a></td>
                </tr>
                <%}%>
            </tbody>
            <tfoot>
                <p><a class="btn btn-primary btn-lg" href="Agregar_jugadorForm.jsp" role="button">Agregar Jugador</a></p>
            </tfoot>
        </table>
    </body>
</html>
<%@ include file="base.jsp" %>