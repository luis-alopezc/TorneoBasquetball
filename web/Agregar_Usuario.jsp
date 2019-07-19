<%-- 
    Document   : Agregar_Usuario
    Created on : Jun 25, 2019, 3:53:32 PM
    Author     : Luis_Lopez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>Agregar Usuario - TODO</title>
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
            <form action="acceso_usuario.jsp" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="">Nombre del Jugador:</label>
                        <input type="text" class="form-control" id="idnombre" name="idnombre" placeholder="Ingrese su nombre">
                    </div>
                </div>
            
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="login">Usuario:</label>
                        <input type="text" class="form-control" id="login" name="login" placeholder="Ingrese su usuario">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputPassword4">Clave:</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Ingrese su contraseña">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="">Email del Jugador:</label>
                        <input type="text" class="form-control" id="email" name="email" placeholder="Ingrese su email">
                    </div>
                </div>
                
                <button type="submit" class="btn btn-primary">Agregar</button>
                  
                </form>
            </div>
                             
        </div>
    </body>
</html>
<%@ include file="base.jsp" %>