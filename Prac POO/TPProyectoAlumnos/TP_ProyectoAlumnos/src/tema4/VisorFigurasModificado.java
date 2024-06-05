
package tema4;

public class VisorFigurasModificado {
    private int guardadas;
    private int capacidadMaxima=5;
    private Figura [] vector = new Figura [capacidadMaxima];

    public VisorFigurasModificado(){
        guardadas=0;
    }

    public void guardar(Figura f){
        vector[guardadas] = f;
        guardadas++;
    }

    public boolean quedaEspacio(){
        boolean aux = false;
        if(capacidadMaxima < guardadas){
            aux = true;
        }
        return aux;
    }

    public void mostrar(){
        for(int i=0;i<guardadas;i++){
            System.out.println(vector[i].toString()+"\n");
        }
    }
    
    public int getGuardadas() {
        return guardadas;
    }

}