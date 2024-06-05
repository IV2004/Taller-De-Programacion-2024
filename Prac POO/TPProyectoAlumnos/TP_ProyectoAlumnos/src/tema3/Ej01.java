
package tema3;
import PaqueteLectura.Lector;

public class Ej01 {


    public static void main(String[] args) {
        double lado1,lado2,lado3;
        String colorR,colorT;
        
        do{
            System.out.println("A continuacion ingrese el lado1, lado2 y lado3 en orden:");
            lado1 = Lector.leerInt();
            lado2 = Lector.leerInt();
            lado3 = Lector.leerInt();
        }while(! ((lado1<lado2+lado3)&&(lado2<lado1+lado3)&&(lado3<lado1+lado2)));
        
        System.out.println("Ingrese el color de relleno y despues de trazo: ");
        colorR = Lector.leerString();
        colorT = Lector.leerString();
        
        Triangulo T1 = new Triangulo(lado1,lado2,lado3,colorR,colorT);
        
        System.out.println("Perimetro: "+T1.calcularPerimetro());
        System.out.println("Area: "+T1.calcularArea());
    }
    
}
