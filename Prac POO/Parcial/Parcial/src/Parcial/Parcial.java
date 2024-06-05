
package Parcial;
/*Curso con nombre descripcion, sueldoDocente CostoCuota y maxAlumnos
CursoO + costoSoftware
CursoP + aula

Alumno DNI nombre y origen

agregarAlumno, en el caso de CursoP, solo agrega si es de LP y el agregar alumno devuelve boolean

montoMnesual Neto, al total se le resta el sueldoDocente y para el cursoO el costoSoftware

toString de el curso con sus alumnos y su monto mensual

esRentable si montoMensual > 800000

*/
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Parcial {


    public static void main(String[] args) {
        // TODO code application logic here
        GeneradorAleatorio.iniciar();
        
        CursoOnline cursoOnline;
        CursoPresencial cursoPresencial;
        
        //double costoSoftware, String nombre, String descripcion, double sueldoDocente, double cuotaCurso, int maxAlumnos
        String nombre,descripcion,origen;
        double costoSoftware,sueldoDocente,cuotaCurso;
        int aula,maxAlumnos,DNI;
        System.out.println("Curso Online: ");
        
        System.out.println("Ingrese nombre y descripcion: ");
        nombre = Lector.leerString();
        descripcion = Lector.leerString();
        System.out.println("Ingrese sueldo del docente y cuota del curso: ");
        sueldoDocente = Lector.leerDouble();
        cuotaCurso = Lector.leerDouble();
        System.out.println("Ingrese costo del software y maximo de alumnos inscriptos: ");
        costoSoftware = Lector.leerDouble();
        maxAlumnos = Lector.leerInt();
        
        cursoOnline = new CursoOnline(costoSoftware,nombre,descripcion,sueldoDocente,cuotaCurso,maxAlumnos);
        
        System.out.println("Ahora debera ingresar los datos de 3 alumnos: ");
        Alumno alu;

        for(int i = 0;i<3;i++){
            System.out.println("Ingrese DNI, nombre y origen en orden: ");
            DNI = Lector.leerInt();
            nombre = Lector.leerString();
            origen = Lector.leerString();
            alu = new Alumno(nombre,DNI,origen);
            cursoOnline.agregarAlumno(alu);
        }
        
        System.out.println("Curso Presencial: ");
        
        System.out.println("Ingrese nombre y descripcion: ");
        nombre = Lector.leerString();
        descripcion = Lector.leerString();
        System.out.println("Ingrese sueldo del docente y cuota del curso: ");
        sueldoDocente = Lector.leerDouble();
        cuotaCurso = Lector.leerDouble();
        System.out.println("Ingrese aula y maximo de alumnos inscriptos: ");
        aula = Lector.leerInt();
        maxAlumnos = Lector.leerInt();
        
        cursoPresencial = new CursoPresencial(aula,nombre,descripcion,sueldoDocente,cuotaCurso,maxAlumnos);
        
        System.out.println("Ahora debera ingresar los datos de 3 alumnos: ");

        for(int i = 0;i<3;i++){
            System.out.println("Ingrese DNI, nombre y origen en orden: ");
            DNI = Lector.leerInt();
            nombre = Lector.leerString();
            origen = Lector.leerString();
            alu = new Alumno(nombre,DNI,origen);
            cursoPresencial.agregarAlumno(alu);
        }
        
        //Ya con 3 alumnos agreagados hayq ue testear el toString y si es rentable
        
        System.out.println(cursoOnline.toString());
        System.out.println(cursoPresencial.toString());
        
        if(cursoOnline.esRentable()){
            System.out.println("Curso Online es rentable");
        }else{
            System.out.println("Curso Online no es rentable");
        }
        
        if(cursoPresencial.esRentable()){
            System.out.println("Curso Presencial es rentable");
        }else{
            System.out.println("Curso Presencial no es rentable");
        }
        
    }
    
}
