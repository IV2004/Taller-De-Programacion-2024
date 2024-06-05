
package tema4.Ej6;


public class SistMensual extends Sistema {
    private double [] promedios;
    
    public SistMensual(String nombre, double latitud, double longitud,int anioInicial,int aniosEvaluados){
        super(nombre,latitud,longitud,anioInicial,aniosEvaluados);
        promedios = new double [this.getCantMeses()];
        for(int i = 0;i<this.getCantMeses();i++){
            promedios[i]=0;
        }
    }
    
    public void calcularProm(){
        for(int i = 0;i<this.getAniosEvaluados();i++){
            for(int j = 0;j<this.getCantMeses();j++){
                promedios[i]=this.obtenerTemp(i,j)+promedios[i];
            }
        }
        for(int i=0;i<this.getCantMeses();i++){
            promedios[i]=promedios[i]/this.getAniosEvaluados();
        }
    }
    
    @Override
    public String retMedia(){
        String media="";
        for(int i = 0;i<this.getCantMeses();i++){
            media = "   -Mes "+(i+1)+": "+promedios[i]+"\n";
        }
        String aux = super.toString()+media;
        return aux;
    }
}
