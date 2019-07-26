package mx.com.develop.model;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.naming.NamingException;
import mx.com.develop.objects.Jugador;

public class MbdJugadores extends Mbd {

    public MbdJugadores() throws NamingException {
        super();
    }
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");

    public boolean insertaJugador(Jugador jugador) throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {

            //ps=conn.prepareStatement("INSERT INTO jugadores VALUES(?,?,?,?,?")
            /*stmt.executeUpdate("INSERT INTO jugador (idEquipo, nombre,direccion,fecha_nacimiento,foto) VALUES("
                    + jugador.getIdEquipo() + ","
                    + "'" + jugador.getNombre() + "',"
                    + "'" + jugador.getDireccion()+ "',"
                    + "'" + jugador.getFechaDeNacimiento().toString()+ "',"
                    + "'" + jugador.getFotografia() + "')");*/
            ps = conn.prepareStatement("INSERT INTO jugador (nombre,direccion,fecha_nacimiento,foto,idEquipo) VALUES(?,?,?,?,?)");
            
            ps.setString(1, jugador.getNombre());
            ps.setString(2, jugador.getDireccion());
            ps.setString(3, jugador.getFechaDeNacimiento().toString());
            ps.setString(4, jugador.getFotografia());
            ps.setInt(5, jugador.getIdEquipo());
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

    public Jugador buscaJugador(int idJugador) throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        Jugador jugador = null;
        try {
            String aux = "SELECT idJugador, nombre, direccion, fecha_nacimiento, foto,idEquipo FROM jugador WHERE idJugador=?";
            ps = conn.prepareStatement(aux);
            ps.setInt(1, idJugador);
            rst = ps.executeQuery();
            //rst = stmt.executeQuery("SELECT idJugador,idEquipo, nombre, direccion, fecha_nacimiento, foto FROM jugador WHERE idJugador=" + idJugador);
            if (rst.next()) {
                jugador = new Jugador();
                jugador.setIdJugador(rst.getInt(1));
                jugador.setNombre(rst.getString(2));
                jugador.setDireccion(rst.getString(3));
                jugador.setFechaDeNacimiento(rst.getDate(4));
                jugador.setFotografia(rst.getString(5));
                jugador.setIdEquipo(rst.getInt(6));
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return jugador;
    }

    public ArrayList<Jugador> traerTodosLosJugadores() throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Jugador> jugadores = new ArrayList<>();

        try {

            //rst = stmt.executeQuery("SELECT idJugador,idEquipo, nombre, direccion, fecha_nacimiento, foto FROM jugador ORDER BY nombre");
            ps = conn.prepareStatement("SELECT idJugador, nombre, direccion, fecha_nacimiento, foto,idEquipo FROM jugador ORDER BY nombre");
            rst = ps.executeQuery();
            while (rst.next()) {
                Jugador jugador = new Jugador();
                jugador.setIdJugador(rst.getInt(1));
                jugador.setNombre(rst.getString(2));
                jugador.setDireccion(rst.getString(3));
                jugador.setFechaDeNacimiento(rst.getDate(4));
                jugador.setFotografia(rst.getString(5));
                jugador.setIdEquipo(rst.getInt(6));
                jugadores.add(jugador);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return jugadores;
    }

    public void eliminaJugador(int idJugador) throws SQLException, NamingException {
        getConexion();
        stmt = conn.createStatement();

        try {
            //stmt.executeUpdate("DELETE FROM jugador WHERE idJugador=" + idJugador);
            ps = conn.prepareStatement("DELETE FROM jugador WHERE idJugador= ?");
            ps.setInt(1, idJugador);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error en sql: ");

        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
    }

    public boolean actualizaJugador(Jugador jugador) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {
            ps = conn.prepareStatement("UPDATE jugador SET nombre=?, direccion=?, fecha_nacimiento=?, foto=?, idEquipo=? where idJugador=?");
            ps.setString(1, jugador.getNombre());
            ps.setString(2, jugador.getDireccion());
            ps.setString(3, jugador.getFechaDeNacimiento().toString());
            ps.setString(4, jugador.getFotografia());
            ps.setInt(5, jugador.getIdEquipo());
            ps.setInt(6, jugador.getIdJugador());
            ps.executeUpdate();

            /*stmt.executeUpdate("update jugador set " 
                    + "nombre='" + jugador.getNombre() + "',"
                    + "direccion='" + jugador.getDireccion() + "',"
                    + "fecha_nacimiento='" + jugador.getFechaDeNacimiento() + "',"
                    + "idEquipo='" + jugador.getIdEquipo() + "',"
                    + "foto='" + jugador.getFotografia() + "' where idJugador="+ jugador.getIdJugador());*/
            exito = true;
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return exito;
    }

}

