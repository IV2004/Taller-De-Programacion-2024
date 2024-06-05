/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author IgnacioV
 */
public class Estante {
    private int DF = 20;
    private int DL;
    private Libro [] estante = new Libro [DF];
    
    //Constructor que inicie el estante sin libros?
    public Estante(){
        DL = 0;
    }
    
    //Devuelve la cant de libros almacenados
    public int cantLibros(){
        return DL;
    }
    
    //Devolver si el estante esta lleno
    public boolean estaLleno(){
        boolean lleno = false;
        if(DF == DL){
            lleno = true;
        }
        return lleno;
    }
    
    //Agregar un libro al estante
    //SI ES NECESARIO AFIMAR SI SE AGREGO LLIBRO DEVIDO A SI EL ESTANTE ESTA LLENO O NO
    //PUEDO DEVOLVER UN BOOLEAN SI FUE AGREGADO CORRECTAMENTE Y FALSE SI NO HABAI ESAPCIO
    public void agregarLibro(Libro esLibro){
        estante[DL] = esLibro;
        DL++;
    }
    
    //Devolver libro segun el titulo que se reciba
    //No se que hacer en caso de que el titulo no existe, le devuelvo un libro vacio?
    public Libro buscarLibro(String unTitulo){
        boolean existe = false;
        int aux = 0;
        while((aux < DL)&&(existe == false)){
            if(estante[aux].getTitulo().equals(unTitulo)){
                existe = true;
            }else{
                aux++;
            }
        }
        return estante[aux];
    }
    
}
