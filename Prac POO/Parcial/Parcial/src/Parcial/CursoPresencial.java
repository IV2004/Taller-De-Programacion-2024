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
public class CursoPresencial extends Curso {
    private int aula;

    public CursoPresencial(int aula, String nombre, String descripcion, double sueldoDocente, double cuotaCurso, int maxAlumnos) {
        super(nombre, descripcion, sueldoDocente, cuotaCurso, maxAlumnos);
        this.aula = aula;
    }

    public int getAula() {
        return aula;
    }

    public void setAula(int aula) {
        this.aula = aula;
    }
    
    @Override
    public boolean agregarAlumno(Alumno alumno){
        boolean agregado = false;
        System.out.println(alumno.getOrigen());
        if(alumno.getOrigen().equals("LP")){
            agregado = true;
            super.sumarAlu(alumno);
            System.out.println("Si se cumple :P");
        }
        return agregado;
    }
    
    
    
    
}
