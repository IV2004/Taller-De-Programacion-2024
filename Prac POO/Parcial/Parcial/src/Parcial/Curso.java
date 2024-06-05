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
public abstract class Curso {
    private String nombre,descripcion;
    private double sueldoDocente,cuotaCurso;
    private int cantAlumnos=0,maxAlumnos;
    private Alumno [] alumnos;

    public Curso(String nombre, String descripcion, double sueldoDocente, double cuotaCurso, int maxAlumnos) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.sueldoDocente = sueldoDocente;
        this.cuotaCurso = cuotaCurso;
        this.maxAlumnos = maxAlumnos;
        alumnos = new Alumno[maxAlumnos];
    }
    
    public void sumarAlu(Alumno alu){
        alumnos[cantAlumnos] = alu;
        cantAlumnos++;
    }
    
    public abstract boolean agregarAlumno(Alumno alu);
    
    public double montoMensualNeto(){
        double total = 0;
        total = (cantAlumnos * cuotaCurso) - sueldoDocente;
        return total;
    }
    
    public boolean esRentable(){
        boolean rentable = false;
        if(this.montoMensualNeto()>800000){
            rentable = true;
        }
        return rentable;
    }
    
    @Override
    public String toString(){
        String aux;
        aux = nombre+", "+descripcion+"\n";
        for(int i = 0;i<cantAlumnos;i++){
            aux += alumnos[i].toString();
        }
        aux += "Monto Mensual: "+this.montoMensualNeto();
        return aux;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getSueldoDocente() {
        return sueldoDocente;
    }

    public void setSueldoDocente(double sueldoDocente) {
        this.sueldoDocente = sueldoDocente;
    }

    public double getCuotaCurso() {
        return cuotaCurso;
    }

    public void setCuotaCurso(double cuotaCurso) {
        this.cuotaCurso = cuotaCurso;
    }

    public int getCantAlumnos() {
        return cantAlumnos;
    }

    public void setCantAlumnos(int cantAlumnos) {
        this.cantAlumnos = cantAlumnos;
    }

    public int getMaxAlumnos() {
        return maxAlumnos;
    }

    public void setMaxAlumnos(int maxAlumnos) {
        this.maxAlumnos = maxAlumnos;
    }
    
    
    
    
}
