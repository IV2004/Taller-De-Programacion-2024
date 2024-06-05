/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parcial;

/**
 *
 * @author IgnacioV
 */
public class CursoOnline extends Curso {
    private double costoSoftware;

    public CursoOnline(double costoSoftware, String nombre, String descripcion, double sueldoDocente, double cuotaCurso, int maxAlumnos) {
        super(nombre, descripcion, sueldoDocente, cuotaCurso, maxAlumnos);
        this.costoSoftware = costoSoftware;
    }
    
    @Override
    public boolean agregarAlumno(Alumno alumno){
        sumarAlu(alumno);
        return true;
    }
    
    @Override
    public double montoMensualNeto(){
        double total = super.montoMensualNeto() - costoSoftware;
        return total;
    }
    
    public double getCostoSoftware() {
        return costoSoftware;
    }

    public void setCostoSoftware(double costoSoftware) {
        this.costoSoftware = costoSoftware;
    }
            
    
    
}
