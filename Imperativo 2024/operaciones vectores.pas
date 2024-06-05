//=================================================================================

Procedure cargarNumeros (var a: números; var  dL:integer);
//Ejemplo cargar numeros en un vector que como maximo puede cargar 50 numeros

Var
 num:integer; 

Begin
 dL:=0;
 read (num);
 while ((dL < dimFisica) and (num <> 50)) do
  begin
   dL:= dL+1;
   a[dL]:= num;
   read(num); 
  end; 
End;

//=================================================================================

function calcularMaximo (a: números; dL:integer):integer;

Var
 max,i:integer; 

Begin
 max:=-9999;
 for i:= 1 to dL do
  begin
   if (a[i]>= max) then max:= a[i];
  end;

 calcularMaximo:= max;  
End;

//=================================================================================

Procedure agregar (var a :números; var dL:integer; var pude:boolean;  
                   valor:integer);

Begin
  pude:= false;
  if ((dl + 1) <= física) then begin
   pude:= true;
   dL:= dL + 1;
   a[dL]:= valor;
  end; 
end.

//=================================================================================
//Insertar
Procedure agregar (var a :números; var dL:integer; var pude:boolean;  
                   valor:integer; pos:integer);
Var
 i:integer;
Begin
  pude:= false;
  if ((dL + 1) <= física) and (pos>= 1) and (pos <= dL) )then begin
   for i:= dL down to pos do
        a[i+1]:= a[i];  
   pude:= true;
   a[pos]:= valor;
   dL:= dL + 1;
  end;
end;

//=================================================================================

Procedure eliminar (var a :números; var dim:integer;
                  var pude:boolean; pos:integer;);
  
Begin
  pude:= false;
  if ((pos>=1) and (pos<=dim))then begin
    
    for i:= pos to (dim-1) do
      a[i]:= a[i+1];  
    pude:= true;
    dim:= dim - 1;
  end; 
end;

//=================================================================================
//Buscar desordenado
function buscar (a:números; dim:integer, valor:integer): boolean;
Var
  pos:integer;
  esta:boolean;

Begin
  esta:= false;
  pos:=1;
  while ( (pos <= dim) and (not esta) ) do
     begin
       if (a[pos]= valor) then esta:=true
       else
          pos:= pos + 1;
     end; 
   buscar:= esta; 
end.

//=================================================================================
//Binario en vec ordenado
Procedure  BusquedaBinaria ( Var vec: números; dimL: integer;
                             bus: integer; var ok : boolean);
 Var 
    pri, ult, medio : integer;

 Begin
     ok:= false;
     pri:= 1 ;  ult:= dimL;  medio := (pri + ult ) div 2 ;

     While  ( pri < = ult ) and ( bus <> vec[medio]) do 
       begin
         if ( bus < vec[medio] ) then 
           ult:= medio -1 ;
         else pri:= medio+1 ;
         medio := ( pri + ult ) div 2 ;
       end;
     if (pri <=ult) and (bus = vec[medio]) then ok:=true; 
  end;

//=================================================================================
//buscar ordenado normal
function buscar (a:números; dim:integer, num:integer): boolean;

Var
  pos:integer;
  
Begin
  pos:=1;
  while ( (pos <= dim) and (a[pos]<num)) do
     begin
       pos:= pos + 1;
     end; 
  if ( (pos <= dim) and (a[pos]= num)) then buscar:=true
  else buscar:= false; 
end.

















