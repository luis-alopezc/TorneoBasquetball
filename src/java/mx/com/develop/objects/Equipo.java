/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.develop.objects;

import java.util.Comparator;

public class Equipo {

    private int idEquipo;
    private int idCategoria;
    private String nombre;
    private String logotipo;
    private String colorPrimario;
    private String colorSecundario;
    private int puntos;
    private int puntosAFavor;
    private int puntosEnContra;
    private int diferencia;

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public int getIdEquipo() {
        return idEquipo;
    }

    public void setIdEquipo(int idEquipo) {
        this.idEquipo = idEquipo;
    }

    public int getDiferencia() {
        diferencia = puntosAFavor - puntosEnContra;
        return diferencia;
    }

    public void setDiferencia(int diferencia) {
        this.diferencia = diferencia;
    }

    private int perdidosPorDefault;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getLogotipo() {
        return logotipo;
    }

    public void setLogotipo(String logotipo) {
        this.logotipo = logotipo;
    }

    public String getColorPrimario() {
        return colorPrimario;
    }

    public void setColorPrimario(String colorPrimario) {
        this.colorPrimario = colorPrimario;
    }

    public String getColorSecundario() {
        return colorSecundario;
    }

    public void setColorSecundario(String colorSecundario) {
        this.colorSecundario = colorSecundario;
    }

    public int getPuntos() {
        return puntos;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }

    public int getPuntosAFavor() {
        return puntosAFavor;
    }

    public void setPuntosAFavor(int puntosAFavor) {
        this.puntosAFavor = puntosAFavor;
    }

    public int getPuntosEnContra() {
        return puntosEnContra;
    }

    public void setPuntosEnContra(int puntosEnContra) {
        this.puntosEnContra = puntosEnContra;
    }

    public int getPerdidosPorDefault() {
        return perdidosPorDefault;
    }

    public void setPerdidosPorDefault(int perdidosPorDefault) {
        this.perdidosPorDefault = perdidosPorDefault;
    }

    @Override
    public String toString() {
        return puntos + " " + idEquipo;
    }

    public static Comparator<Equipo> getComparatorPorPuntos() {
        Comparator comp = new Comparator<Equipo>() {
            @Override
            public int compare(Equipo e1, Equipo e2) {
                int a = e2.getPuntos() - e1.getPuntos();
                if (a == 0) {
                    a = -(e1.getPuntosAFavor() - e1.getPuntosEnContra()) + (e2.getPuntosAFavor() - e2.getPuntosEnContra());
                }
                return a;
            }
        };
        return comp;
    }

}
