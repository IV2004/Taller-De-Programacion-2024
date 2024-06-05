
package tema2;

import PaqueteLectura.Lector;
public class Ej01 {


    public static void main(String[] args) {
        
        Persona Persona1= new Persona();
        System.out.println("Ingrese nombre, edad y DNI:  ");
        Persona1.setNombre(Lector.leerString());
        Persona1.setEdad(Lector.leerInt());
        Persona1.setDNI(Lector.leerInt());
        
        System.out.println(Persona1.toString());

    }
    
}
