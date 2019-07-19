<%-- 
    Document   : Agregar_partido
    Created on : Jun 25, 2019, 3:52:39 PM
    Author     : Luis_Lopez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>Agregar Partido - TODO</title>
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
        <h2>Agregar partido</h2>
        <div id="container" class="container">
            <form action="acceso_partido.jsp" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="">Equipo local:</label>
                        <input type="text" class="form-control" id="equipoLocal" name="equipoLocal" placeholder="Ingrese el nombre del equipo local">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="">Equipo visitante:</label>
                        <input type="text" class="form-control" id="equipoVisitante" name="equipoVisitante" placeholder="Ingres el nombre del equipo visitante">
                    </div>
                </div>
            
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="">Estatus:</label>
                        <input type="text" class="form-control" id="estatus" name="estatus" placeholder="Ingrese el estatus">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="">Marcador Local:</label>
                        <input type="text" class="form-control" id="marcadorLocal" name="marcadorLocal" placeholder="Ingrese el marcador del equipo local">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="">Marcador Visitante:</label>
                        <input type="text" class="form-control" id="marcadorVisitante" name="marcadorVisitante" placeholder="Ingrese el marcador del equipo visitante">
                    </div>
                </div>
            
           
            <button type="submit" class="btn btn-primary">Guardar</button>
            </form>      
        </div>
    </body>
</html>
