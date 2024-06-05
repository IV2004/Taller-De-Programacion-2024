
package tema4;

public class Triangulo extends Figura{
    private double lado1, lado2, lado3;
    
    public Triangulo (String colorRelleno, String colorLinea, double lado1, double lado2, double lado3){
        super(colorRelleno, colorLinea);
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    
    public double calcularPerimetro(){
        return lado1+lado2+lado3;
    }
    
    public double calcularArea(){
        double auxS= this.calcularPerimetro()/2;
        return Math.sqrt(auxS*(auxS-lado1)*(auxS-lado2)*(auxS-lado3));
    }
    
    @Override
    public String toString(){
        return super.toString()+", lado1: "+lado1+", lado2: "+lado2+", lado3: "+lado3;
    }
}
