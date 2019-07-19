<%-- 
    Document   : Agregar_jugador
    Created on : Jun 25, 2019, 3:52:12 PM
    Author     : Luis_Lopez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>Agregar Jugador - TODO</title>
        <style>
            h2{
                margin-bottom: 20px;
                text-align: center;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div>
        <p>&nbsp;</p>
        <h2>Agregar equipo</h2>
        <div id="container" class="container">
            <form action="acceso_jugador.jsp" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="">Nombre del Jugador:</label>
                        <input type="text" class="form-control" id="idnombre" name="idnombre" placeholder="Ingresa el nombre del jugador">
                    </div>
                </div>
            
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="">Direccion:</label>
                        <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Ingrese la direccion del jugador">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputPassword4">Fecha de nacimiento:</label>
                        <input type="Date" class="form-control" id="fechadenacimiento" name="fechadenacimiento" placeholder="fechadenacimiento">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="">Foto:</label>
                        <input type="file" class="form-control" id="foto" name="foto" placeholder="Ingrese una fotografia del jugador">
                    </div>
                </div>
                
                <button type="submit" class="btn btn-primary">Crear</button>
                  
                </form>
            </div>                   
        </div>
    </body>
</html>
<%@ include file="base.jsp" %>