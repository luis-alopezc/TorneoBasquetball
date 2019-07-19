<%-- 
    Document   : modificarUsuarioForm
    Created on : Jun 27, 2019, 5:06:17 PM
    Author     : Luis_Lopez
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.model.MbdJugadores"%>
<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="mx.com.develop.objects.Jugador"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ include file="menu.jsp" %>
<%
    String pIdJugador = request.getParameter("idJugador");
    int idJugador = Integer.parseInt(pIdJugador);
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
    ArrayList<Equipo> equipos = new MbdEquipo().traerTodosLosEquipos();
    Jugador jugador = new MbdJugadores().buscaJugador(idJugador);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Modificar Jugador - TODO</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="modificarJugadorDo.jsp" method="POST" enctype="multipart/form-data">
                <input type="hidden" class="form-control" id="idJugador" name="idJugador" value="<%=jugador.getIdJugador()%>">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" value="<%=jugador.getNombre()%>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="idEquipo">Equipo: </label>
                        <select class="form-control" id="idEquipo" name="idEquipo">
                            <option value="">Seleccione un Equipo</option>
                            <%for(Equipo equipo : equipos){%>
                            <option value="<%=equipo.getIdEquipo()%>" 
                                    <% if(jugador.getIdEquipo()== equipo.getIdEquipo()){ %>
                                        <%="selected"%>
                                       <% } %> 
                                    > 
                                    <%=equipo.getNombre()%>
                                </option>
                            <%}%>
                          
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="direccion">Direccion:</label>
                        <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Direccion:" value="<%=jugador.getDireccion()%>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="fecha_nacimiento">Fecha de nacimiento:</label>
                        <input type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" placeholder="Fecha de nacimiento" value="<%=jugador.getFechaDeNacimiento()%>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="foto">Fotografia:</label>
                        <input type="file" class="form-control" id="foto" name="foto" placeholder="Fotografia:" value="<%=jugador.getFotografia()%>">
                        accept="image/png, .jpeg, .jpg, image/gif"placeholder="Fotografia">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>
        </div>
    </body>
</html>
<%@ include file="base.jsp" %>