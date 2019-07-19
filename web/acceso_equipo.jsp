<%-- 
    Document   : acceso_equipo
    Created on : Jun 25, 2019, 4:25:44 PM
    Author     : Luis_Lopez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String Nombre = request.getParameter("Nombre");
    String Logotipo = request.getParameter("Logotipo");
    String colorPrimario = request.getParameter("colorPrimario");
    String colorSecundario = request.getParameter("colorSecundario");
%>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <p><b>Nombre:</b><%=Nombre%></p>
        <p><b>Archivo:</b><%=Logotipo%></p>
        <p><b>Color primario:</b><%=colorPrimario%></p>
        <p><b>Color secundario:</b><%=colorSecundario%></p>
        <form action="AgregarEquipo.jsp" method="POST">
            <button type="submit" class="btn btn-primary">Regresar a la pagina anterior</button>
        </form>
    </body>
       
        
        
    
</html>
<%@ include file="base.jsp" %>