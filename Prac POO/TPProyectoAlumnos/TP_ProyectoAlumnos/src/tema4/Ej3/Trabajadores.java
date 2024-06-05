/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.Ej3;

/**
 *
 * @author IgnacioV
 */
public class Trabajadores extends Personas {
    private String trabajo;

    public Trabajadores(){

    }
    public Trabajadores(String nombre,int DNI, int edad, String trabajo){
        super(nombre,DNI,edad);
        this.trabajo = trabajo;
    }

    public String getTrabajo() {
        return trabajo;
    }

    public void setTrabajo(String trabajo) {
        this.trabajo = trabajo;
    }
    
    public String toString(){
        return super.toString()+". Soy "+trabajo;
    }
}
