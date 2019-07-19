
<%@page import="mx.com.develop.objects.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.model.MbdCategorias"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<% 
    ArrayList<Categoria> listaCategorias = new MbdCategorias().traerCategorias();  
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Agregar Usuario - TODO</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%@ include file="menu.jsp" %>
        <p>&nbsp;</p>
        <div id="container" class="container">
            <form action="AgregarEquipoDo.jsp" method="POST" enctype="multipart/form-data">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="login">Nombre:</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="categoria">Categoria:</label>
                        <select id="categoria" name="categoria">
                            <option value="">Seleccione una Categoria</option>
                            <%for(Categoria cat : listaCategorias){%>
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
                        <input type="file" class="form-control" id="logotipo" name="logotipo" placeholder="Logotipo">
                        name="foto" accept="image/png, .jpeg, .jpg, image/gif" placeholder="Logotipo">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="color_primario">Color Primario:</label>
                        <input type="color" class="form-control" id="color_primario" name="color_primario" placeholder="Color Primario">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="color_secundario">Color Secundario:</label>
                        <input type="color" class="form-control" id="color_secundario" name="color_secundario" placeholder="Color Secundario">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>
        </div>
        <%@ include file="base.jsp" %>
    </body>
</html>
