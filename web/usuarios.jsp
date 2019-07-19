<%-- 
    Document   : usuarios
    Created on : Jun 25, 2019, 6:59:57 PM
    Author     : Luis_Lopez
--%>
<%@page import="mx.com.develop.model.MbdUsuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mx.com.develop.objects.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>
<%
    ArrayList<Usuario> listaUsuarios = new MbdUsuarios().traerTodosLosUsuarios();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de usuarios</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Login</th>
                    <th scope="col">Password</th>
                    <th scope="col">Correo</th>
                </tr>
            </thead>
            <tbody>
                <%for(Usuario usuario : listaUsuarios){%>
                <tr>
                    <th scope="row"><%=usuario.getIdUsuario()%></th>
                    <td><%=usuario.getIdnombre()%></td>
                    <td><%=usuario.getLogin()%></td>
                    <td><%=usuario.getPassword()%></td>
                    <td><%=usuario.getEmail()%></td>
                    <td><a class="btn btn-primary btn-lg" href="modificarUsuarioForm.jsp?idUsuario=<%=usuario.getIdUsuario()%>" role="button">Modificar</a></td>
                    <td><a class="btn btn-primary btn-lg" href="eliminarUsuarioForm.jsp?idUsuario=<%=usuario.getIdUsuario()%>" role="button">Eliminar</a></td>
                </tr>
                <%}%>
            </tbody>
            <tfoot>
                <p><a class="btn btn-primary btn-lg" href="Agregar_UsuarioForm.jsp" role="button">Agregar Usuario</a></p>
            </tfoot>
        </table>
    </body>
</html>
<%@ include file="base.jsp" %>