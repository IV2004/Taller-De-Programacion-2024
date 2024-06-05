/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio     
	GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios
        int DF=5;
        int [][] mat = new int [DF][DF];//Primero columnas despues filas
        int i,j;
        
        for(i=0;i<DF;i++){
            for(j=0;j<DF;j++){
                mat[i][j]=GeneradorAleatorio.generarInt(10);
            }
        }
        //Paso 4. mostrar el contenido de la matriz en consola
        for(i=0;i<DF;i++){
            for(j=0;j<DF;j++){
                System.out.print(mat[i][j]+" ");
            }
            System.out.println();
        }
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int sumaFila1=0;
        i = 0;
        for(j=0;j<DF;j++){
            System.out.println(mat[i][j]);
            sumaFila1=sumaFila1+mat[i][j];
        }
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.

        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        int auxI=0, auxJ=0,valor;
        boolean encontro = false;
        System.out.println("Ingrese valor: ");
        valor=Lector.leerInt();
        while((auxI < DF)&&(encontro == false)){
            auxJ=0;
            while((auxJ<5)&&(encontro == false)){
                if(mat[auxI][auxJ] == valor){
                    encontro=true;
                }
                auxJ++;
            }
            auxI++;
        }
        if(encontro == false){
            System.out.println("No se encontro elemento");
        }else{
            System.out.println("El valor se encuentra en: "+auxI+" y "+auxJ);
        }
    }
}
