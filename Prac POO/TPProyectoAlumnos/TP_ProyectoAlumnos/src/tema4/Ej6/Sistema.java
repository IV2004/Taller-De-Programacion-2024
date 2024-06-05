
package tema4.Ej6;
import PaqueteLectura.GeneradorAleatorio;

public abstract class Sistema extends Estacion {
    private int anioInicial,aniosEvaluados,cantMeses=12;
    private double [][] registro = new double [aniosEvaluados][12];
    private Estacion estacion;
    
    
    
    public Sistema(String nombre, double latitud, double longitud,int anioInicial,int aniosEvaluados){
        super(nombre,latitud,longitud);
        this.anioInicial = anioInicial;
        this.aniosEvaluados = aniosEvaluados;
        //Inicializo la temp de cada mes en un valor muy alto
        GeneradorAleatorio.iniciar();
        for(int i = 0;i<aniosEvaluados;i++){
            for(int j = 0;j<cantMeses;j++){
                registro[i][j]=9999;//Temperatura muy alta
            }
        }
    }
    public void RegistrarTemp(int anio, int mes){
        registro[anio][mes]=GeneradorAleatorio.generarDouble(55)-10;//temp aprox normal
    }
    
    public double obtenerTemp(int anio, int mes){
        double temp = registro[anio][mes]; 
        return temp;
    }
    
    public String maxTemp(){
        int anio=0,mes=0;
        double maxTemp=-99;
        for(int i=0;i<aniosEvaluados;i++){
            for(int j = 0;j<cantMeses;j++){
                if(registro[i][j]>maxTemp){
                    anio=i;
                    mes=j;
                    maxTemp=registro[i][j];
                }
            }
        }
        String aux = "La temp maxima se registro en el Año: "+anio+", Mes: "+mes;
        return aux;
    }
    //HACE LOS SETTERS Y GETTERS

    public int getAnioInicial() {
        return anioInicial;
    }

    public int getAniosEvaluados() {
        return aniosEvaluados;
    }

    public int getCantMeses() {
        return cantMeses;
    }

    public Estacion getEstacion() {
        return estacion;
    }

    public void setAnioInicial(int anioInicial) {
        this.anioInicial = anioInicial;
    }

    public void setEstacion(Estacion estacion) {
        this.estacion = estacion;
    }
    public abstract String retMedia();
    
    @Override
    public String toString(){
        String aux = super.toString()+retMedia();
        return aux;
    }
    
}
