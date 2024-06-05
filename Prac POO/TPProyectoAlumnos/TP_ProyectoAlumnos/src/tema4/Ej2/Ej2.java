
package tema4.Ej2;

public class Ej2 {

    public static void main(String[] args) {
        Jugador J = new Jugador ("Hernán",35000,8,23,73);
        Entrenador E = new Entrenador ("Nacho",60000,22,16);
        
        System.out.println(J.toString());
        System.out.println(E.toString());
    }
    
}
