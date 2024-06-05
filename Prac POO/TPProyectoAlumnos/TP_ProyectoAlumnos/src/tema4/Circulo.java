
package tema4;

public class Circulo extends Figura{
    
    private double radio;
    
    public Circulo(String colorRelleno, String colorLinea, double radio){
        super(colorRelleno,colorLinea);
        this.radio = radio;
    }

    public double getRadio() {
        return radio;
    }
    
    public void setRadio(double radio){
        this.radio = radio;
    }
    
    @Override
    public double calcularPerimetro(){
        return (2*Math.PI*radio);
    }
    
    @Override
    public double calcularArea(){
        return Math.PI*Math.pow(radio,2);
    }
    
    @Override
    public String toString(){
        return super.toString()+", "+"Radio: "+radio;
    }
}
