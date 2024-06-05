
package tema4.Ej2;

public class Jugador extends Empleado {
    private int numPartidos, cantGoles;
    
    public Jugador (String nombre, double sueldo, int antiguedad, int numPartidos, int cantGoles){
        super(nombre,sueldo,antiguedad);
        this.numPartidos = numPartidos;
        this.cantGoles = cantGoles;
    }
    
    public double calcularEfectividad(){
        return (cantGoles / numPartidos);
    }
    
    public double calcularSueldoACobrar(){
        double total = super.calcularSueldo();
        if(calcularEfectividad() > 0.5){
            total = total + getSueldo();
        }
        return total;
    }
}
