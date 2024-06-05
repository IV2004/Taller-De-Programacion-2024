
package tema3;


public class Hotel {
    private int DF;
    private Habitacion [] hotel;
    
    public Hotel(int DF){
        this.DF = DF;
        hotel = new Habitacion [DF];
        for(int i = 0;i<DF;i++){
            hotel[i] = new Habitacion();
        }
    }
    
    public void agregarCliente(Cliente cli, int pos){
        hotel[pos].setCliente(cli);
        hotel[pos].setEstado(true);
        /*if(hotel[pos].isEstado() == false ){
            hotel[pos].setCliente(cli);
            hotel[pos].setEstado(true);
        }*/
    }
    
    public void aumentarCosto(double aumento){
        for(int i = 0;i<DF;i++){
            hotel[i].setCosto(hotel[i].getCosto()+aumento);  
        }
    }
    @Override
    public String toString(){
        //('\n')
        String aux = "";
        for(int i = 0;i<DF;i++){
            aux =aux + "Habitacion "+i+" "+hotel[i].toString()+'\n';
        }
        return aux;
    }
    
    
    
    
}
