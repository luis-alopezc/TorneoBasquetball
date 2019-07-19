/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.develop.objects;

import java.sql.Date;

/**
 *
 * @author Luis_Lopez
 */
public class Partido {
    private int idPartido;
    private int equipoLocal;
    private int equipoVisitante;
    private int estatus;
    private int marcadorGlobal;
    private int marcadorVisitante;
    private Date fecha;
    private String es;
    private String cancha;

    public String getCancha() {
        return cancha;
    }

    public void setCancha(String cancha) {
        this.cancha = cancha;
    }

    public String getEs() {

        if (estatus == 1) {
            es = "Pendiente";

        } else if (estatus == 2) {
            es = "Jugado";

        } else if (estatus == 3) {
            es = "Gano por default local";

        } else if (estatus == 4) {
            es = "Gano por default visitante";

        } else {
        }
        return es;
    }

    public void setEs(String es) {
        this.es = es;
    }
    
    private String equipoGanador;

    public int getIdPartido() {
        return idPartido;
    }

    public void setIdPartido(int idPartido) {
        this.idPartido = idPartido;
    }

    public int getEquipoLocal() {
        return equipoLocal;
    }

    public void setEquipoLocal(int equipoLocal) {
        this.equipoLocal = equipoLocal;
    }

    public int getEquipoVisitante() {
        return equipoVisitante;
    }

    public void setEquipoVisitante(int equipoVisitante) {
        this.equipoVisitante = equipoVisitante;
    }

    public int getEstatus() {
        return estatus;
    }

    public void setEstatus(int estatus) {
        this.estatus = estatus;
    }

    public int getMarcadorGlobal() {
        return marcadorGlobal;
    }

    public void setMarcadorGlobal(int marcadorGlobal) {
        this.marcadorGlobal = marcadorGlobal;
    }

    public int getMarcadorVisitante() {
        return marcadorVisitante;
    }

    public void setMarcadorVisitante(int marcadorVisitante) {
        this.marcadorVisitante = marcadorVisitante;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public void setEquipoGanador(String equipoGanador) {        
        this.equipoGanador = equipoGanador;
        
        
    }

    public String getEquipoGanador() {
        Partido a=new Partido();
        switch(estatus){
            case 1:
                equipoGanador="Pendiente";
                break;
            case 2:
                if(marcadorGlobal<marcadorVisitante){
                    equipoGanador="Equipo Visitante";
                }
                else if(marcadorGlobal>marcadorVisitante){
                    equipoGanador="Equipo Local";
                }
                else
                    equipoGanador="Empate";
                break;
            case 3:
                equipoGanador="Default Local";
                break;
            case 4:
                equipoGanador="Default Visitante";
            break;
        }
        return equipoGanador;
    }

    
    
}
