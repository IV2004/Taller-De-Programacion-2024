
package tema3;
import PaqueteLectura.GeneradorAleatorio;
public class Habitacion {
    private double costo = GeneradorAleatorio.generarDouble(6000)+2000;
    private boolean estado = false ;
    private Cliente cliente;

    public Habitacion(){
        
    }
    
    public Habitacion(Cliente cliente) {
        this.estado = true;
        this.cliente = cliente;
    }
    
    public void setCosto(double costo){
        this.costo = costo;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    public double getCosto() {
        return costo;
    }
    
    public boolean isEstado() {
        return estado;
    }

    public Cliente getCliente() {
        return cliente;
    }  
    @Override
    public String toString(){
        String aux;
        if(isEstado() == false){
            aux = "Desocupada";
            
        }else{
            aux = "Ocupada"+", "+cliente.toString();
        }
        return aux;
    }
}
