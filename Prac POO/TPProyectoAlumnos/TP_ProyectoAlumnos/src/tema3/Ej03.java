
package tema3;
import PaqueteLectura.GeneradorAleatorio;
public class Ej03 {


    public static void main(String[] args) {
        Estante estante1 = new Estante();
        GeneradorAleatorio.iniciar();

        for(int i = 0; i < 10; ++i) {
           Autor unAutor = new Autor();
           Libro libro = new Libro(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarString(4), GeneradorAleatorio.generarInt(4), unAutor, GeneradorAleatorio.generarString(4), GeneradorAleatorio.generarDouble(6));
           if (i == 5) {
              libro.setTitulo("Mujercitas");
              estante1.agregarLibro(libro);
           }
        }
        Libro libroAux = estante1.buscarLibro("Mujercitas");
        System.out.println(libroAux.toString());
     
    }
    
}
