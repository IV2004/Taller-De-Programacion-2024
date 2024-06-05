
package tema4.Ej6;


public class SistAnual extends Sistema {
    private double [] promedios;
    
    
    public SistAnual(String nombre, double latitud, double longitud,int anioInicial,int aniosEvaluados){
        super(nombre,latitud,longitud,anioInicial,aniosEvaluados);
        promedios = new double [this.getAniosEvaluados()];
        for(int i = 0;i<this.getAniosEvaluados();i++){
            promedios[i]=0;
        }
    }
    
    public void calcularProm(){
        for(int i=0;i<this.getAniosEvaluados();i++){
            for(int j=0;j<this.getCantMeses();j++){
                promedios[i]+=this.obtenerTemp(i,j);
            }
        }
        for(int i=0;i<this.getAniosEvaluados();i++){
            promedios[i]=promedios[i]/this.getCantMeses();
        }
    }
    
    
    @Override
    public String retMedia(){
        String media ="";
        for(int i=0;i<this.getAniosEvaluados();i++){
            media= "   -Anio "+(this.getAnioInicial()+i)+": "+promedios[i]+"\n";
        }
        String aux= super.toString()+media;
        return aux;
    }
}
