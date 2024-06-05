
package tema4.Ej2;

public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad;

    public Empleado(String nombre, double sueldo, int antiguedad) {
        this.nombre = nombre;
        this.sueldo = sueldo;
        this.antiguedad = antiguedad;
    }
    
    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();
    
    public double calcularSueldo(){
        return sueldo+((sueldo/10)*antiguedad);
    }
    
    public double getSueldo(){
        return sueldo;
    }
    
    public int getAntiguedad(){
        return antiguedad;
    }
    
    @Override
    public String toString(){
        return "Nombre: "+nombre+
               " sueldo: "+this.calcularSueldoACobrar()+
               " Efectividad: "+this.calcularEfectividad();
    }
    
}
