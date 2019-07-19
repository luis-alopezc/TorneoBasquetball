<%-- 
    Document   : Resultados
    Created on : Jul 4, 2019, 3:44:16 PM
    Author     : Luis_Lopez
--%>

<%@page import="java.util.List"%>
<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>
<%
    ArrayList<Equipo> listaEquipos = new MbdEquipo().obtenerEquiposConPuntos();
    listaEquipos.sort(Equipo.getComparatorPorPuntos());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabla de posiciones</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <h1>Tabla de posiciones</h1>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Posición</th>
                    <th scope="col">Equipo</th>
                    <th scope="col">PF</th>
                    <th scope="col">PC</th>
                    <th scope="col">Diferencia</th>
                    <th scope="col">Puntos</th>
                </tr>
            </thead>
            <%
                    int lugar=0;
                    
                    for(Equipo equipo : listaEquipos){
                        
                        
            %>
            <tbody>
                <tr>  
                    <td><%=++lugar%></td>
                    <td><%=equipo.getNombre()%></td>
                    <td><%=equipo.getPuntosAFavor()%></td>
                    <td><%=equipo.getPuntosEnContra()%></td>
                    <td><%=equipo.getDiferencia()%></td>
                    <td><%=equipo.getPuntos()%></td>
                    
                </tr>

            </tbody>
            <%
                }
                %>
                
        </table>
    </body>
</html>
<%@ include file="base.jsp" %>