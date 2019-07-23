package mx.com.develop.model;

import java.sql.*;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.naming.NamingException;
import mx.com.develop.objects.Bitacora;
import mx.com.develop.filter.Visitas;


public class MbdBitacora extends Mbd {

    public MbdBitacora() throws NamingException {
        super();
    }
    SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-dd kk:mm");
    public boolean insertaBitacora(Bitacora bitacora) throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("YYYY-MM-dd kk:mm");
            /*System.out.println("INSERT INTO bitacora (idUsuario, url,fecha) VALUES("
                    + bitacora.getIdUsuario() + ","
                    + "'" + bitacora.getUrl() + "',"
                    + "'" + sdf.format(bitacora.getFecha()) + "')");

            stmt.executeUpdate("INSERT INTO bitacora (idUsuario, url,fecha) VALUES("
                    + bitacora.getIdUsuario() + ","
                    + "'" + bitacora.getUrl() + "',"
                    + "'" + sdf.format(bitacora.getFecha()) + "')");
            */
            ps=conn.prepareStatement("INSERT INTO bitacora (idUsuario, url,fecha) VALUES(?,?,?)");
             ps.setInt(1, bitacora.getIdUsuario());
             ps.setString(2, bitacora.getUrl());
             ps.setString(3, sdf.format(bitacora.getFecha()));
             ps.executeUpdate();
            
            exito = true;
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }
    public ArrayList<Visitas> getVisitas() throws SQLException, NamingException{
        

        boolean exito = false;
        ArrayList<Visitas> resultados = new ArrayList<>();
        try {
            getConexion();

            stmt = conn.createStatement();
            
            /*System.out.println("select url, count(*) from bitacora group by 1");
            rst = stmt.executeQuery("select url, count(*) from bitacora group by 1");
            */
            ps=conn.prepareStatement("SELECT url, count(*) from bitacora group by 1");
            while (rst.next()) {
                Visitas visita = new Visitas();
                visita.setPagina(rst.getString(1));
                visita.setVisitas(rst.getInt(2));
                resultados.add(visita);
            }
            exito = true;
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        }  finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return resultados;
    }

//Este metodo es para llevar todas las urls eistentes de la tabla bitacora y mostrarlas en el select del form

    public ArrayList<Bitacora> traerUrls() throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Bitacora> bitacoras = new ArrayList<Bitacora>();

        try {
            System.out.println("select url from bitacora group by 1");
            ps = conn.prepareStatement("select url from bitacora group by 1");
            rst = ps.executeQuery();
            while (rst.next()) {
                Bitacora bitacora = new Bitacora();
                bitacora.setUrl(rst.getString(1));
                bitacoras.add(bitacora);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return bitacoras;
    }

    //Lo primordial de este metodo es llevar las fechas pero tambien se llevan los demas datos por si se llegan a ocupar
    public ArrayList<Bitacora> traerUrlsPorUsuario(int idUsuario, String url) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Bitacora> bitacorasUsuario = new ArrayList<>();

        try {
            //Mostrará todos los urls con sus datos
            System.out.println("select url from bitacora where idUsuario = ? group by 1");
            ps = conn.prepareStatement("select idUsuario,url,fecha  from bitacora where idUsuario = ? and url=?");
            ps.setInt(1, idUsuario);
            ps.setString(2, url);
            rst = ps.executeQuery();
            while (rst.next()) {
                Bitacora bitacoraU = new Bitacora();
                bitacoraU.setIdUsuario(rst.getInt(1));
                bitacoraU.setUrl(rst.getString(2));
                bitacoraU.setFecha(new java.util.Date(rst.getTimestamp(3).getTime()));
                //bitacoraU.setVistas(rst.getInt(4));
//              System.out.println(""+rst.getString(1)+rst.getInt(2));                                
                bitacorasUsuario.add(bitacoraU);
            }

        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return bitacorasUsuario;
    }
//Este metodo lleva las el idUsuario, url y vistas para mostrar en el form

    public String[] contadorUrlsPorUsuario(int idUsuario, String url) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        String[] vistas = new String[3];

        try {
            //Mostrará todos los urls con sus datos
            System.out.println("select url from bitacora where idUsuario = ? group by 1");
            ps = conn.prepareStatement("select idUsuario,url,count(url) from bitacora where idUsuario = ? and url=?");
            ps.setInt(1, idUsuario);
            ps.setString(2, url);
            rst = ps.executeQuery();
            while (rst.next()) {
                vistas[0] = "" + rst.getInt(1);//idUsuario
                vistas[1] = "" + rst.getString(2);//url
                vistas[2] = "" + rst.getInt(3);//contador
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return vistas;
    }
}
