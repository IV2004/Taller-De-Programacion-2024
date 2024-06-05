
package tema3;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Hotelazo {


    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        System.out.println("Ingrese cant de habitaciones:   ");
        int DF = 5;
        int cant = 0;
        Hotel hotel = new Hotel(DF);
        
        Cliente cli = new Cliente (GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarInt(8),GeneradorAleatorio.generarInt(100));
        
        for(int i = 0;i<DF;i++){
            hotel.agregarCliente(cli, GeneradorAleatorio.generarInt(4));
            cli = new Cliente (GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarInt(8),GeneradorAleatorio.generarInt(100));
        }
        
        System.out.println(hotel.toString());
        
    }
    
}
