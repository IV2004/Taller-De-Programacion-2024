
package tema4;


public class VisorFigurasMain {


    public static void main(String[] args) {
        // TODO code application logic here
        Cuadrado cuad1 = new Cuadrado(10,"Rojo", "Negro");
        System.out.println("Color linea: " + cuad1.getColorLinea()); 
        System.out.println("Area: " + cuad1.calcularArea()); 
        System.out.println("Representacion del cuadrado: " + cuad1.toString()); 
        Cuadrado cuad2 = new Cuadrado(12,"Verde", "Azul");
        System.out.println("Color linea: " + cuad2.getColorLinea()); 
        System.out.println("Area: " + cuad2.calcularArea()); 
        System.out.println("Representacion del cuadrado: " + cuad2.toString()); 
        Rectangulo cuad3 = new Rectangulo(5,10,"Rojo", "Negro");
        System.out.println("Color linea: " + cuad3.getColorLinea()); 
        System.out.println("Area: " + cuad3.calcularArea()); 
        System.out.println("Representacion del cuadrado: " + cuad3.toString()); 
        VisorFigurasModificado visor = new VisorFigurasModificado();
        visor.guardar(cuad1);
        visor.guardar(cuad2);
        visor.guardar(cuad3);
        visor.mostrar();
    }
    
}
