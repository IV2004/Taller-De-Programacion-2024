
package tema4.Ej6;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Ej6 {


    public static void main(String[] args) {
        // TODO code application logic here
        GeneradorAleatorio.iniciar();
        String nombre;
        Double latitud,longitud;
        int anioInicial,cantAnios;
        System.out.println("Ingrese nombre de la estacion: ");
        nombre = Lector.leerString();
        System.out.println("Ingrese  latitud y longitud de la misma: ");
        latitud=Lector.leerDouble();
        longitud=Lector.leerDouble();
        System.out.println("Ingrese año inicial y la cantidad de N años que quiere que sean evaluados: ");
        anioInicial = Lector.leerInt();
        cantAnios = Lector.leerInt();
        
        SistMensual sistM = new SistMensual(nombre,latitud,longitud,anioInicial,cantAnios);
        SistAnual sistA = new SistAnual(nombre,latitud,longitud,anioInicial,cantAnios);
        
        
    }
    
}
