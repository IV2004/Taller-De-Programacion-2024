
package tema4.Ej2;

public class Entrenador extends Empleado{
    private int campeonatosGanados;
    
    public Entrenador (String nombre, double sueldo, int antiguedad, int campeonatosGanados){
        super(nombre,sueldo,antiguedad);
        this.campeonatosGanados = campeonatosGanados; 
    }
    
    public double calcularEfectividad(){
        return (campeonatosGanados/getAntiguedad());
    }
                  
    public double calcularSueldoACobrar(){
        double total = super.calcularSueldo();
        if(campeonatosGanados <= 4){
            total = total + 5000;
        }else {
            if(campeonatosGanados <= 10){
               total = total + 30000; 
            }else{
                total = total + 50000;
            }
        }
        return total;
    }
    
            
}
