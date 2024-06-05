
package tema3;


public class Cliente {
    private String nombre;
    private int DNI;
    private int edad;
    
    public Cliente (){
        
    }

    public Cliente(String nombre, int DNI, int edad) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.edad = edad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    @Override
    public String toString() {
        return "Cliente: " + "nombre: " + nombre + ", DNI:" + DNI + ", edad:" + edad + '}';
    }
    
    
    
    
}
