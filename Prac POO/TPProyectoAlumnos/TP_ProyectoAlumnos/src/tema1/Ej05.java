
package tema1;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Ej05 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        /*El dueño de un restaurante entrevista a 5 clientes y les pide que califiquen
        (con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
        de la comida (2) Precio (3) Ambiente.
        Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
        para cada uno de los aspectos y almacene la información en una estructura. Luego
        imprima la calificación promedio obtenida por cada aspecto.*/
        int [][]mat = new int [5][4];
        int i,j,aux;
        for(i=0;i<5;i++){
            System.out.println("Cliente "+(i+1));
            for(j=0;j<4;j++){
                switch (j){
                    case 0:
                        System.out.println("Ingrese puntaje de atencion al cliente: ");
                        break;
                    case 1:
                        System.out.println("Ingrese puntaje de calidad de la comida: ");
                        break;
                    case 2:
                        System.out.println("Ingrese puntaje de precio: ");
                        break;
                    case 3:
                        System.out.println("Ingrese puntaje de ambiente: ");
                        break;
                    default:
                        System.out.println("algo se rompio XD");
                }
                mat [i][j]=Lector.leerInt();
            }
        }
        //Calcular promedio de cada calificacion
        double [] vec = new double [4];
        
        for(j=0;j<4;j++){
            vec[j]=0;//Inicializo el vec con 0's
            for(i=0;i<5;i++){
                vec[j]=vec[j]+mat[i][j];
            }
            vec[j]=vec[j]/5;//Calculo el prom
        }
        for(i=0;i<4;i++){
            switch (i){
                    case 0:
                        System.out.println("Promedio atencion al cliente: "+vec[i]);
                        break;
                    case 1:
                        System.out.println("Promedio calidad de la comida: "+vec[i]);
                        break;
                    case 2:
                        System.out.println("Promedio precio: "+vec[i]);
                        break;
                    case 3:
                        System.out.println("promedio ambiente: "+vec[i]);
                        break;
                    default:
                        System.out.println("algo se rompio al final XD");
            }
        }
    }
    
}
