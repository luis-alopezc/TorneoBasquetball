<%-- 
    Document   : modificarUsuarioForm
    Created on : Jun 27, 2019, 5:06:17 PM
    Author     : Luis_Lopez
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ include file="menu.jsp" %>
<%
    String pIdPartido = request.getParameter("idPartido");
    int idPartido = Integer.parseInt(pIdPartido);
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
    ArrayList<Equipo> equipos = new MbdEquipo().traerTodosLosEquipos();
    Partido partido = new MbdPartidos().buscaPartido(idPartido);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Modificar Marcador - TODO</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="modificarMarcadorDo.jsp" method="POST">
                <input type="hidden" class="form-control" id="idPartido" name="idPartido" value="<%=partido.getIdPartido()%>">
                <div class="form-group col-md-6">
                        <label for="estatus">Estatus:</label>
                        <select class="form-control" id="estatus" name="estatus">
                            <option value="">Seleccione el Estatus</option>
                            <option value="1" >Pendiente</option>
                            <option value="2">Jugado</option>
                            <option value="3">Gano por Default Local</option>
                            <option value="4">Gano por Default Visitante</option>
                        </select>
                </div>            
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="marcador_global">Marcador Local:</label>
                        <input type="number" class="form-control" id="marcador_global" name="marcador_global" placeholder="Marcador Local:" value="<%=partido.getMarcadorGlobal()%>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="marcador_visitante">Marcador Visitante:</label>
                        <input type="number" class="form-control" id="marcador_global" name="marcador_visitante" placeholder="Marcador Visitante:" value="<%=partido.getMarcadorVisitante()%>">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>
        </div>
    </body>
</html>
<%@ include file="base.jsp" %>