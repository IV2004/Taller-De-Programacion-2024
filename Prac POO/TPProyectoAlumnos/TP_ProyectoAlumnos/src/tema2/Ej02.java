
package tema2;

import PaqueteLectura.Lector;

import PaqueteLectura.GeneradorAleatorio;
public class Ej02 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int DL= 0,DF = 15;
        Persona [] vec = new Persona [DF];
        
        int edad,DNI;
        String nombre;
        
        edad = GeneradorAleatorio.generarInt(100);
        while((edad != 0) && (DL<15)){
            DNI = GeneradorAleatorio.generarInt(100);
            nombre = GeneradorAleatorio.generarString(10);
            vec[DL] = new Persona (nombre,DNI,edad);
            DL++;
            edad = GeneradorAleatorio.generarInt(100);
        }
        //Informe la cant de personas mayores a 65 años y la pesona con menpor DNI
        //Osea recorrer el vec de personas y un contador de personas mayores
        //+ un string auxilir que tome el valor de toString de la persona con menor DNI
        int cant=0,min=9999999,pos=-1;
        String aux;
        for(int i=0;i<DL;i++){
            if(vec[i].getEdad() > 65){
                cant++;
            }
            if(vec[i].getDNI()<min){
                min=vec[i].getDNI();
                pos=i;
            }
        }
        System.out.println("La cant de personas mayores a 65 años es: "+cant);
        System.out.println("Persona con menor DNI: ");
        System.out.println(vec[pos].toString());
        
    } 
    
}
