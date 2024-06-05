
package tema2;
import PaqueteLectura.Lector;

public class Ej03 {


    public static void main(String[] args) {
        
        Persona [][] mat = new Persona [5][8];
        
        int i=0,j=0;
        String nombre;
        int DNI,edad;
        nombre = Lector.leerString();
        while((!nombre.equals("ZZZ")&& i<5)){
            while(j<8 && !nombre.equals("ZZZ")){
                DNI = Lector.leerInt();
                edad = Lector.leerInt();
                mat[i][j] = new Persona(nombre,DNI,edad);
                j++;
            }
            i++;
        }
        
    }
    
}
