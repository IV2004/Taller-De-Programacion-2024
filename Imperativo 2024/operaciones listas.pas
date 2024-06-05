

procedure agregarAdelante (var pI:listaE; num:integer);
Var
 nuevo:listaE;
 
Begin
   new (nuevo); nuevo^.elem:= num; nuevo^.sig:=nil; 
	if (pI = nil) then pI:= nuevo
   else begin
        nuevo^.sig:= pI;
        pI:=nuevo;
       end;
End;

//=================================================================================

procedure agregarAlFinal (var pI:listaE; num:integer);
Var
 nuevo,aux:listaE;
 
Begin
   new (nuevo); nuevo^.elem:= num; nuevo^.sig:=nil; 
	if (pI = nil) then pI:= nuevo
   else begin
        aux:= pI;
        while (aux ^.sig <> nil) do
          aux:= aux^.sig;

        aux^.sig:=nuevo;       
       end;
End;

//=================================================================================

procedure agregarAlFinal2 (var pI,pU:listaE; num:integer);
Var
 nuevo:listaE;
 
Begin
   new (nuevo); nuevo^.elem:= num; nuevo^.sig:=nil; 
	if (pI = nil) then begin
      pI:= nuevo;
      pU:= nuevo;
   end
   else begin
         pU^.sig:=nuevo;
         pU:= nuevo;       
       end;
End;

//=================================================================================

function buscar (pI: listaE; valor:integer):boolean;
Var
 aux:listaE; 
 encontré:boolean;

Begin
  encontré:= false;
  aux:= pI;
  while ((aux <> nil) and (encontré = false)) do
   begin
      if (aux^.elem = valor) then encontre:=true
      else
        aux:= aux^.sig;
   end;
   buscar:= encontré; 
end;

//=================================================================================

function buscar (pI: listaE; valor:integer):boolean;
Var
 aux:listaE; 
 encontré:boolean;

Begin
  encontré:= false;
  aux:= pI;
  while ((aux <> nil) and (aux^.elem < valor)) do
   begin
      aux:= aux^.sig;
   end;

   if (aux <> nil) and (aux^.elem = valor) then encontre:= true;
  
   buscar:= encontré; 
end;

//=================================================================================

Procedure insertar (var pI:listaE valor:integer);
Var
  nuevo,actual,ant:listaE;
Begin
  new (nuevo); nuevo^.elem:= valor; nuevo^.sig:=nil;
  if (pI = nil) then
    pI:= nuevo
  else begin
    actual:= pI; ant:=pI;
    while (actual <> nil) and (actual^.elem < nuevo^.elem) do   
     begin
      ant:=actual;
      actual:= actual^.sig;
     end;
 if (actual = pI) then 
 begin
   nuevo^.sig:= pI;
   pI:= nuevo;
 end
else
 begin
  ant^.sig:=nuevo;
  nuevo^.sig:= actual;
 end
End;
End;

//=================================================================================


























