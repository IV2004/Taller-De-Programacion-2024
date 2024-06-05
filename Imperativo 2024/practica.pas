program practica;

type

arbol = ^nodoArbol;

nodoArbol = record
	dato: integer;
	HI:arbol;
	HD:arbol;
end;

//COMIENZO DE PROCESOS
procedure agregar(var a:arbol; dato:integer);
var
	
begin
	if(a = nil) then
		new(a);
		a^.HI:=nil;
		a^.HD:=nil;
		a^.dato:=dato;
	end
	else begin
		if (dato <= a^.dato)then
			agregar(a^.HI,dato);
		else
			agregar(a^.HD,dato)
	end;
end;
//===========================================
//Imprime con prioridad inferior de izquierda hacia la derecha
procedure enOrden(a:arbol);
begin
	if(a <> nil)then begin
		enOrden(a^.HI);
		write(a^.dato);//o cualquier otra accion
		enOrden(a^.HD);
	end;
end;
//===========================================
//Imprime con prioridad superior e izquierda hacia la derecha
procedure preOrden (a:arbol);
begin
	if(a<>nil)then begin
		write(a^.dato);
		preOrden(a^.HI);
		preOrden(a^.HD);
	end;
end;
//===========================================
procedure postOrden(a:arbol);
begin
	if(a <> nil)then begin
		postOrden(a^.HI);
		postOrden(a^.HD);
		write(a^.dato);
	end;
end;
//===========================================
procedure recorridoAcotado(a:arbol;inf:integer;sup:integer);
begin
	if(a <> nil)then begin
		if(a^.dato.cod >= inf)then begin//suponiendo que dato es un reg 
			if(a^.dato.cod <= sup)then begin
				//Imprimir, supongo que el codigo writeln('cod: ',a^.dato.cod)
				recorridoAcotado(a^.HI,inf,sup);
				recorridoAcotado(av.HD,inf,sup);
			end
			else
				recorridoAcotado(a^.HI,inf,sup)
		end
		else
			recorridoAcotado(a^.HD,inf,sup);
	end;
end;









//COMIENZO DEL MAIN
var
	a:arbol;
begin
	a:=nil;

end.
