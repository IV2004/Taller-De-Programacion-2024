
package Parcial;


public class Alumno {
    private String nombre;
    private int DNI;
    private String origen;
    
    public Alumno(){
        
    }
    
    public Alumno(String nombre, int DNI, String origen) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.origen = origen;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }
    
    @Override
    public String toString(){
        return "{"+DNI+","+nombre+","+origen+"} \n";
    }
    
    
}
