
package tema2;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
public class Ej04 {
//Se pued hacer un vec aux donde se guarda lac ant de personas inscriptas en X dia, como max 8
//A la hora de la impresion que ahce uno?
    
/*a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el
siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación.
La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos
de casting.
Una vez finalizada la inscripción:
b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la
persona a entrevistar en cada turno asignado.*/

    public static void main(String[] args) {
        int [] vec =new int [5];
        
        Persona [][] mat = new Persona [5][8];
        int i=0,j=0;
        int DNI,edad;
        String nombre;
        
        //Primero quiero inicializar en 0 el vector auxiliar
        for(i=0;i<5;i++){
            vec[i]=0;
        }
        
        int dia,cant=0;
        
        System.out.println("Ingrese dia: ");
        dia = Lector.leerInt();
        System.out.println("Ingrese nombre: ");
        nombre = Lector.leerString();
        
        while(!nombre.equals("ZZZ")&&(cant<40)){
            if(vec[dia]<8){//Si hay un turno disponible en ese dia
                System.out.println("Ingrese DNI:    ");
                DNI = Lector.leerInt();
                System.out.println("Ingrese edad:    ");
                edad = Lector.leerInt();
                mat[dia][vec[dia]] = new Persona(nombre,DNI,edad);
                System.out.println("Ingrese nombre: ");
                nombre = Lector.leerString();
                vec[dia]++;
            }else{//Si no hay mas turnos disponibles en el dia
                System.out.println("No hay mas espacio en este dia.");
            }
        System.out.println("Ingrese dia: ");
        dia = Lector.leerInt();
        cant++;//Cant de inscriptos
        }
        
        //Recorrer matriz
        while(i<5){
            while(j<vec[i]){
                System.out.println(mat[i][j].toString());
                j++;
            }
            j=0;
            i++;
        }
       //listo, me meo
    }
    
}
