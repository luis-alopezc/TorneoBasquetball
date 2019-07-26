package mx.com.develop.model;

import java.sql.*;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.naming.NamingException;
import mx.com.develop.objects.Partido;

public class MbdResultados extends Mbd {

    public MbdResultados() throws NamingException {
        super();
    }
    SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-dd kk:mm");
    

    public ArrayList<Partido> traerTodosLosPartidosJugados() throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Partido> partidos = new ArrayList<>();

        try {
            ps=conn.prepareStatement("SELECT idPartido,equipo_local, equipo_visitante, Estatus, marcador_localal, marcador_visitante, fecha FROM partido ORDER BY fecha");
            rst=ps.executeQuery();
            //rst = stmt.executeQuery("SELECT idPartido,equipo_local, equipo_visitante, Estatus, marcador_global, marcador_visitante, fecha FROM partido ORDER BY fecha");
            while (rst.next()) {
                Partido partido = new Partido();
                partido.setIdPartido(rst.getInt(1));
                partido.setEquipoLocal(rst.getInt(2));
                partido.setEquipoVisitante(rst.getInt(3));
                partido.setEstatus(rst.getInt(4));
                partido.setMarcadorGlobal(rst.getInt(5));
                partido.setMarcadorVisitante(rst.getInt(6));
                partido.setFecha(new java.sql.Date(rst.getTimestamp(7).getTime()));
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

