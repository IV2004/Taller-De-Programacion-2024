/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;
import PaqueteLectura.GeneradorAleatorio;

public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        //Multiplica la posicion por 2 y la guarda en la misma
        for (i=0;i<DF;i++) 
            tabla2[i]=2*i;
        /*generar enteros aleatorios hasta obtener el número 11. Para cada número
        muestre el resultado de multiplicarlo por 2 (accediendo al vector).*/
        /*
        Tengo que generar aleatorios emtre 0 y 11 hasta que salga 11, mientras no sea 11
        imprimir el dato del vector en esa X posicion
        */
        i = GeneradorAleatorio.generarInt(12);
        while (i != 11){
            System.out.println(tabla2[i]);
            i = GeneradorAleatorio.generarInt(12);
        }
        System.out.println("2x" + "5" + "="+ tabla2[5]);

    }
    
}
