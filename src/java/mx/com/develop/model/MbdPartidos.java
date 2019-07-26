package mx.com.develop.model;

import java.sql.*;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.naming.NamingException;
import mx.com.develop.objects.Partido;

public class MbdPartidos extends Mbd {

    public MbdPartidos() throws NamingException {
        super();
    }
    SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-dd kk:mm");
    public boolean insertaPartido(Partido partido) throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("YYYY-MM-dd kk:mm");
            /*System.out.println("INSERT INTO partido (equipo_local,equipo_visitante,Estatus,marcador_global,marcador_visitante,fecha) VALUES("
                    + partido.getEquipoLocal() + ","
                    + partido.getEquipoVisitante() + ","
                    + partido.getEstatus() + ","
                    + partido.getMarcadorGlobal() + ","
                    + partido.getMarcadorVisitante() + ","
                    + "'" + sdf.format(partido.getFecha()) + "')");

            stmt.executeUpdate("INSERT INTO partido (equipo_local,equipo_visitante,Estatus,marcador_global,marcador_visitante,fecha) VALUES("
                    + partido.getEquipoLocal() + ","
                    + "'" + partido.getEquipoVisitante()+ "',"
                    + "'" + partido.getEstatus() + "',"
                    + "'" + partido.getMarcadorGlobal() + "',"
                    + "'" + partido.getMarcadorVisitante()+ "',"
                    + "'" + sdf.format(partido.getFecha()) + "')");*/
            ps=conn.prepareStatement("INSERT INTO partido(equipo_local,equipo_visitante,Estatus,marcador_local,marcador_visitante,idCancha,fecha) VALUES(?,?,?,?,?,?,?);");
            ps.setInt(1, partido.getEquipoLocal());
            ps.setInt(2, partido.getEquipoVisitante());
            ps.setInt(3, partido.getEstatus());
            ps.setInt(4, partido.getMarcadorGlobal());
            ps.setInt(5, partido.getMarcadorVisitante());
            ps.setInt(6, partido.getIdCancha());
            ps.setObject(7, sdf.format(partido.getFecha()));
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

    public Partido buscaPartido(int idPartido) throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        Partido partido = null;
        try {
            String aux = "SELECT * FROM partido WHERE idPartido=?";
            ps = conn.prepareStatement(aux);
            ps.setInt(1, idPartido);
            rst = ps.executeQuery();
            //rst = stmt.executeQuery("SELECT idPartido, equipo_local, equipo_visitante, Estatus, marcador_global, marcador_visitante, fecha FROM partido WHERE idPartido=" + idPartido);
            if (rst.next()) {
                partido = new Partido();
                partido.setIdPartido(rst.getInt(1));
                partido.setEquipoLocal(rst.getInt(2));
                partido.setEquipoVisitante(rst.getInt(3));
                partido.setEstatus(rst.getInt(4));
                partido.setMarcadorGlobal(rst.getInt(5));
                partido.setMarcadorVisitante(rst.getInt(6));
                partido.setIdCancha(rst.getInt(7));
                partido.setFecha(new java.sql.Date(rst.getTimestamp(8).getTime()));
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return partido;
    }

    public ArrayList<Partido> traerTodosLosPartidos() throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Partido> partidos = new ArrayList<>();

        try {

            //rst = stmt.executeQuery("SELECT idPartido,equipo_local, equipo_visitante, Estatus, marcador_global, marcador_visitante, fecha FROM partido ORDER BY fecha");
            ps = conn.prepareStatement("SELECT * FROM partido ORDER BY fecha");
            rst = ps.executeQuery();
            while (rst.next()) {
                Partido partido = new Partido();
                partido.setIdPartido(rst.getInt(1));
                partido.setEquipoLocal(rst.getInt(2));
                partido.setEquipoVisitante(rst.getInt(3));
                partido.setEstatus(rst.getInt(4));
                partido.setMarcadorGlobal(rst.getInt(5));
                partido.setMarcadorVisitante(rst.getInt(6));
                partido.setIdCancha(rst.getInt(7));
                partido.setFecha(new java.sql.Date(rst.getTimestamp(8).getTime()));
                partidos.add(partido);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return partidos;
    }

    public void eliminaPartido(int idPartido) throws SQLException, NamingException {
        getConexion();
        stmt = conn.createStatement();

        try {
            //stmt.executeUpdate("DELETE FROM partido WHERE idPartido=" + idPartido);
            String aux = "DELETE FROM partido WHERE idPartido= ?";
            ps = conn.prepareStatement(aux);
            ps.setInt(1, idPartido);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error en sql: ");

        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
    }

    public boolean actualizaPartido(Partido partido) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("YYYY-MM-dd kk:mm");
            /*stmt.executeUpdate("update partido set "
                    + "equipo_local='" + partido.getEquipoLocal() + "',"
                    + "equipo_visitante='" + partido.getEquipoVisitante()+ "',"
                    + "Estatus='" + partido.getEstatus() + "',"
                    + "marcador_global='" + partido.getMarcadorGlobal() + "',"
                    + "marcador_visitante='" + partido.getMarcadorVisitante()+ "',"
                    + "fecha='" + sdf.format(partido.getFecha()) + "' where idPartido="+partido.getIdPartido());*/
            ps = conn.prepareStatement("UPDATE partido SET equipo_local=?, equipo_visitante=?, Estatus=?, marcador_local=?, marcador_visitante=?, idCancha=?, fecha=? WHERE idPartido=?");
            ps.setInt(1, partido.getEquipoLocal());
            ps.setInt(2, partido.getEquipoVisitante());
            ps.setInt(3, partido.getEstatus());
            ps.setInt(4, partido.getMarcadorGlobal());
            ps.setInt(5, partido.getMarcadorVisitante());
            ps.setInt(6, partido.getIdCancha());
            ps.setString(7, sdf.format(partido.getFecha()));
            ps.setInt(8, partido.getIdPartido());
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


    public boolean actualizaMarcador(Partido partido) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        boolean exito = false;
        try {

            /*stmt.executeUpdate("update partido set "
                    + "Estatus='" + partido.getEstatus() + "',"
                    + "marcador_global='" + partido.getMarcadorGlobal() + "',"
                    + "marcador_visitante='" + partido.getMarcadorVisitante()+ "'where idPartido="+ partido.getIdPartido());*/
            ps = conn.prepareStatement("UPDATE partido SET Estatus=?, marcador_local=?, marcador_visitante=? WHERE idPartido=?"); 
            ps.setInt(1, partido.getEstatus());
            ps.setInt(2, partido.getMarcadorGlobal());
            ps.setInt(3, partido.getMarcadorVisitante());
            ps.setInt(4, partido.getIdPartido());
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

    
    public ArrayList<Partido> partidoLocales2(int idVisitante) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Partido> partidos = new ArrayList<Partido>();

        try {

//            rst = stmt.executeQuery("select jugador.Nombre,equipo.Nombre,equipo.Logotipo from jugador,equipo "
//                    + "where jugador.IdEquipo=equipo.IdEquipo and equipo.IdEquipo= " + idEquipo);
            ps = conn.prepareStatement("select equipo_local, count(*) from partido  where equipo_local=?");
            ps.setInt(1, idVisitante);
            rst = ps.executeQuery();
            while (rst.next()) {
                Partido partido = new Partido();
                partido.setEquipoLocal(rst.getInt(1));
                partidos.add(partido);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return partidos;
    }
    
    public ArrayList<Partido> partidoVisitante(int idVisitante) throws SQLException,
            NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Partido> partidos = new ArrayList<Partido>();

        try {

            //rst = stmt.executeQuery("SELECT * FROM partido WHERE estatus = 'defauld local' or estatus = 'defauld visitante'");
            ps = conn.prepareStatement("select equipo_visitante, count(*) from partido where equipo_visitante= ?");
            ps.setInt(1, idVisitante);

            rst = ps.executeQuery();
            while (rst.next()) {
                Partido partido = new Partido();
                partido.setEquipoLocal(rst.getInt(1));
                partido.setEquipoVisitante(rst.getInt(2));
                partidos.add(partido);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return partidos;
    }
    
}

