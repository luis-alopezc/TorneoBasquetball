<%-- 
    Document   : equipos
    Created on : Jun 25, 2019, 5:27:33 PM
    Author     : Luis_Lopez
--%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.io.File"%>
<%@page import="mx.com.develop.tools.ImageTools"%>
<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.objects.Categoria"%>
<%@page import="mx.com.develop.model.MbdCategorias"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    ArrayList<Equipo> listaEquipos = new MbdEquipo().traerTodosLosEquipos();
    ArrayList<Categoria> listaCategorias = new MbdCategorias().traerCategorias(); 
    String uploadFolder = ResourceBundle.getBundle("mx.com.develop.properties.rutas").getString("rutaArchivos");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Lista de equipos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%@ include file="menu.jsp" %>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Categoria</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Logotipo</th>
                    <th scope="col">Color</th>
                </tr>
            </thead>
            <tbody>
                <%for(Equipo equipo : listaEquipos){
                File archivoImagen=new File(uploadFolder+equipo.getLogotipo());
                %>
                <tr>
                    <th scope="row"><%=equipo.getIdEquipo()%></th>
                    <%for(Categoria cat : listaCategorias){
                                    if(equipo.getIdCategoria()==cat.getIdCategoria()){
                    %>
                        <th><%=cat.getDescripcion()%></th>
                    
                    <%
                        }}
                    %>
                    
                    
                    <td><%=equipo.getNombre()%></td>
                    <td><img style="display:block; width:auto;height:100px;" src="<%=ImageTools.encodeFileToBase64Binary(archivoImagen)%>" /></td>
                    <td><div style="height:100px; width:100px; overflow:hidden; background-color:<%=equipo.getColorPrimario()%>;">
                            <div style="width:0; height:0; border-top:100px solid <%=equipo.getColorSecundario()%>; border-right:100px solid transparent;"></div>
                        </div>
                    </td>
                    <td><a class="btn btn-primary btn-lg" href="modificarEquipoForm.jsp?idEquipo=<%=equipo.getIdEquipo()%>" role="button">Modificar</a></td>
                    <td><a class="btn btn-primary btn-lg" href="eliminarEquipoForm.jsp?idEquipo=<%=equipo.getIdEquipo()%>" role="button">Eliminar</a></td>
                </tr>
                <%}%>
            </tbody>
            <tfoot>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><p><a class="btn btn-primary btn-lg" href="AgregarEquipoForm.jsp" role="button">Agregar</a></p></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </tfoot>
        </table>
    </body>
        <%@ include file="base.jsp" %>
</html>