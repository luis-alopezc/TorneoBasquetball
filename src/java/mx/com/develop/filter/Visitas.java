/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.develop.filter;

/**
 *
 * @author Luis_Lopez
 */
public class Visitas {
    String pagina;
    int visitas;

     public Visitas() {
    }
    public Visitas(String pagina, int visitas) {
        this.pagina = pagina;
        this.visitas = visitas;
    }
    
    
    public String getPagina() {
        return pagina;
    }

    public void setPagina(String pagina) {
        this.pagina = pagina;
    }

    public int getVisitas() {
        return visitas;
    }

    public void setVisitas(int visitas) {
        this.visitas = visitas;
    }
    
}
