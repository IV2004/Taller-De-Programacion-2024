
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        int DF=15;
        //Paso 3: Crear el vector para 15 double 
        double [] jugadores = new double[DF];
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i;
        double altura;
        double alturaTotal=0;
        double alturaProm;
        int cantJugadoresMayorAlProm = 0;
        
        
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for(i=0;i<DF;i++){
            System.out.println("Ingrese altura: ");
            altura=Lector.leerDouble();
            jugadores[i]=altura;
            alturaTotal=alturaTotal+altura;
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        alturaProm=(alturaTotal/DF);
        System.out.println("El promedio de alturas es: "+alturaProm);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for(i=0;i<DF;i++){
            if(jugadores[i]>alturaProm){
                cantJugadoresMayorAlProm++;
            }
        }
        //Paso 9: Informar la cantidad.
        System.out.println("Cantidad de jugadores con altura mayor al promedio: "+cantJugadoresMayorAlProm);
    }
    
}
