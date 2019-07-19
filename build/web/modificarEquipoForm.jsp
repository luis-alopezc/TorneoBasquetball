<%-- 
    Document   : modificarUsuarioForm
    Created on : Jun 27, 2019, 5:06:17 PM
    Author     : Luis_Lopez
--%>
<%@page import="mx.com.develop.model.MbdCategorias"%>
<%@page import="mx.com.develop.objects.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String pIdEquipo = request.getParameter("idEquipo");
    int idEquipo = Integer.parseInt(pIdEquipo);
    ArrayList<Categoria> listaCategorias = new MbdCategorias().traerCategorias();
    
    Equipo equipo = new MbdEquipo().buscaEquipo(idEquipo);
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Modificar Equipo - TODO</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%@ include file="menu.jsp" %>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="modificarEquipoDo.jsp?idEquipo=<%=equipo.getIdEquipo()%>" method="POST" enctype="multipart/form-data">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" value="<%=equipo.getNombre()%>">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="categoria">Categoria:</label>
                        <select id="categoria" name="categoria">
                            <option value="">Seleccione una Categoria</option>
                            <%for (Categoria cat : listaCategorias) {%>
                            <option value="<%=cat.getIdCategoria()%>"> 
                                <%=cat.getDescripcion()%>
                            </option>
                            <%}%> 
                        </select>
                    </div>                    
                </div>   
                 
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="logotipo">Logotipo:</label>
                        <input type="file" class="form-control" id="logotipo" name="logotipo" placeholder="Logotipo" value="<%=equipo.getLogotipo()%>">
                        name="foto" accept="image/png, .jpeg, .jpg, image/gif" placeholder="Logotipo">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="color_primario">Color Primario:</label>
                        <input type="color" class="form-control" id="color_primario" name="color_primario" placeholder="Color Primario" value="<%=equipo.getColorPrimario()%>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="color_secundario">Color Secundario:</label>
                        <input type="color" class="form-control" id="color_secundario" name="color_secundario" placeholder="Color Secundario" value="<%=equipo.getColorSecundario()%>">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>
        </div>
        <%@ include file="base.jsp" %>
    </body>
</html>
