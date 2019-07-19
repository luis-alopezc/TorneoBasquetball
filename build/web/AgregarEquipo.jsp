<%-- 
    Document   : AgregarEquipo
    Created on : Jun 25, 2019, 3:28:04 PM
    Author     : Luis_Lopez
--%>
<%@ include file="menu.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>Agregar Equipo - TODO</title>
        <style>
            h2{
                margin-bottom: 20px;
                text-align: center;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <p>&nbsp;</p>
        <h2>Agregar equipo</h2>
        <div id="container" class="container">
            <form action="acceso_equipo.jsp" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="">Nombre del equipo:</label>
                        <input type="text" class="form-control" id="Nombre" name="Nombre" placeholder="Nombre">
                    </div>
                </div>
            
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="">Logotipo:</label>
                        <input type="file" class="form-control" id="Logotipo" name="Logotipo" placeholder="Logotipo">
                    </div>
                </div>
            
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="">Color primario:</label>
                        <input type="color" class="form-control" id="colorPrimario" name="colorPrimario" placeholder="colorPrimario">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="">Color secundario:</label>
                        <input type="color" class="form-control" id="colorSecundario" name="colorSecundario" placeholder="colorSecundario">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
               </form>
            </div>  
    </body>
</html>
<%@ include file="base.jsp" %>