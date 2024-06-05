
package tema3;


public class Triangulo {
    //Variables de instancia
    private double lado1,lado2,lado3;
    private String colorRelleno;
    private String colorTrazo;
    
    //Constructor completo usando this
    public Triangulo(double lado1, double lado2, double lado3, String colorRelleno, String colorTrazo){
        this.lado1=lado1;
        this.lado2=lado2;
        this.lado3=lado3;
        this.colorRelleno=colorRelleno;
        this.colorTrazo=colorTrazo;
    }
    //Constructor vacio
    public Triangulo(){
        
    }
    //Metodos
    public double calcularPerimetro(){
        return lado1+lado2+lado3;
    }
    public double calcularArea(){
        double auxS = this.calcularPerimetro()/2;
        return Math.sqrt(auxS*(auxS-lado1)*(auxS-lado2)*(auxS-lado3));
    }
    
    //Getters
    public double getLado1() {
        return lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public String getColorTrazo() {
        return colorTrazo;
    }
    //Setters

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public void setColorTrazo(String colorTrazo) {
        this.colorTrazo = colorTrazo;
    }

    @Override
    public String toString() {
        return "Triangulo: " + "lado1=" + lado1 + ", lado2=" + lado2 + ", lado3=" + lado3 + ", colorRelleno=" + colorRelleno + ", colorTrazo=" + colorTrazo + '}';
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
