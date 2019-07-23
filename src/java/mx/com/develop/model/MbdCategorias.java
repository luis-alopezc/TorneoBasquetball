/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.develop.model;

import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import mx.com.develop.objects.Categoria;
import java.util.ArrayList;

/**
 *
 * @author Luis_Lopez
 */
public class MbdCategorias extends Mbd{
    public MbdCategorias() throws NamingException {
        super();
    }
    public ArrayList<Categoria> traerCategorias() throws SQLException, NamingException {
        getConexion();

        stmt = conn.createStatement();

        ArrayList<Categoria> categorias = new ArrayList<>();

        try {

            //rst = stmt.executeQuery("SELECT idJugador,idEquipo, nombre, direccion, fecha_nacimiento, foto FROM jugador ORDER BY nombre");
            ps=conn.prepareStatement("SELECT * FROM categoria");
            rst=ps.executeQuery();
            while (rst.next()) {
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rst.getInt(1));
                categoria.setDescripcion(rst.getString(2));
                categorias.add(categoria);
            }
        } catch (SQLException e) {
            System.out.println("Error en sql: ");
            throw e;
        } finally {
            returnConexion(conn, ps, rst, stmt);
        }
        return categorias;
    }
}
