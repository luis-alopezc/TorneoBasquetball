<%/* 
    Document   : modificarUsuarioForm
    Created on : Jun 27, 2019, 5:06:17 PM
    Author     : Luis_Lopez
     */%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="mx.com.develop.model.MbdEquipo"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.sql.Date"%>
<%@page import="mx.com.develop.objects.Jugador"%>
<%@page import="mx.com.develop.model.MbdJugadores"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ include file="menu.jsp" %>
<%    
    String pIdJugador = "";
    String pIdEquipo = "";
    String nombre = "";
    String direccion = "";
    String fechaDeNacimiento ="";
    String fotografia = "";

    int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    int MAX_REQUEST_SIZE = 1024 * 1024;
    // Check that we have a file upload request
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    if (!isMultipart) {
        return;
    }

    // Create a factory for disk-based file items
    DiskFileItemFactory factory = new DiskFileItemFactory();

    // Sets the size threshold beyond which files are written directly to
    // disk.
    factory.setSizeThreshold(MAX_MEMORY_SIZE);

    // Sets the directory used to temporarily store files that are larger
    // than the configured size threshold. We use temporary directory for
    // java
    factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

    // constructs the folder where uploaded file will be stored
    String uploadFolder = ResourceBundle.getBundle("mx.com.develop.properties.rutas").getString("rutaArchivos");

    // Create a new file upload handler
    ServletFileUpload upload = new ServletFileUpload(factory);

    // Set overall request size constraint
    upload.setSizeMax(MAX_REQUEST_SIZE);

    try {
        // Parse the request
        List items = upload.parseRequest(request);
        Iterator iter = items.iterator();
        while (iter.hasNext()) {
            FileItem item = (FileItem) iter.next();

            if (!item.isFormField()) {
                String fileName = new File(item.getName()).getName();
                String filePath = uploadFolder + fileName;
                File uploadedFile = new File(filePath);
                System.out.println(filePath);
                fotografia = fileName;
                // saves the file to upload directory
                item.write(uploadedFile);
            } else {
                if (item.getFieldName().equals("idJugador")) {
                    pIdJugador = item.getString();
                } else if (item.getFieldName().equals("idEquipo")) {
                    pIdEquipo = item.getString();
                } else if (item.getFieldName().equals("nombre")) {
                    nombre = item.getString();
                } else if (item.getFieldName().equals("direccion")) {
                    direccion = item.getString();
                } else if (item.getFieldName().equals("fecha_nacimiento")) {
                    fechaDeNacimiento = item.getString();
                }
            }
        }

    } catch (FileUploadException ex) {
        throw new ServletException(ex);
    } catch (Exception ex) {
        throw new ServletException(ex);
    }
    int idJugador = Integer.parseInt(pIdJugador);
    int idEquipo = Integer.parseInt(pIdEquipo);
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date fechaDeNacimiento1 = formatter.parse(fechaDeNacimiento);
    Jugador jugador = new Jugador();
    jugador.setIdJugador(idJugador);
    jugador.setIdEquipo(idEquipo);
    jugador.setNombre(nombre);
    jugador.setDireccion(direccion);
    jugador.setFechaDeNacimiento(new Date(fechaDeNacimiento1.getTime()));
    jugador.setFotografia(fotografia);
    boolean exito = new MbdJugadores().actualizaJugador(jugador);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Se ha modificado un jugador</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%if (exito) {%>
        <div class="jumbotron">
            <h1>Se ha modificado un jugador</h1>
            <p>&nbsp;</p>
            <p><b>Nombre:</b> <%=nombre%></p>
            <p><b>Direccion:</b> <%=direccion%></p>
            <p><b>Fecha de nacimiento:</b> <%=fechaDeNacimiento1%></p>
            <p><b>Fotografia:</b> <%=fotografia%></p>
            <p><a class="btn btn-primary btn-lg" href="jugadores.jsp" role="button">Regresar</a></p>
        </div>
        <%} else {%>
        <div class="jumbotron">
            <h1>Ocurrio un error al modificar el jugador</h1>
            <p><a class="btn btn-primary btn-lg" href="jugadores.jsp" role="button">Regresar</a></p>
        </div>
        <%}%>
    </body>
</html>
<%@ include file="base.jsp" %>