program busquedas;

procedure seleccion (var v: vector; DL: integer);
var
	i, j, pos: integer;
	aux: tipoElemento // Depende de que sea el vector, ej: integer/char/registros
begin

	for i:= 1 to DL-1 do begin	// Busca el minimo y guarda en " pos " la posicion
		pos:= i;
		for j:= i+1 to DL do
			if ( v[ j ] < v[ pos ] ) then
				pos:= j;
				
		// Intercambia v[ i ] y v[ pos ]
		aux:= v[ pos ];
		v[ pos ]:= v[ i ];
		v[ i ]:= aux;
	end;
end;

















procedure seleccion (v:vector; DL:integer);
var
	i,j,pos:integer;
	aux:item;
begin
	for i:=1 to DL-1 do begin
		pos := i;
		
		for j:=i+1 to DL do
			if(v[j] < v[pos])then
				pos:= j;
		aux:=v[pos];
		v[pos]:=v[i];
		v[i]:=aux;
	end;
end;







procedure Seleccion(var v:vector; DL:integer);
var
	i,j,pos:integer;
	aux:item;
begin
	for i:=1 to DL-1 do begin
		pos:=i;
		for j:=i+1 to DL do
			if(v[j] < v[pos])then
				pos:=j;
		aux:=v[pos];
		v[pos]:=v[i];
		v[i]:=aux;
	end;










































Procedure  BusquedaBin (var v: Vector; var pos:integer; dimL,x: integer);
Var 
    primero, ult, medio: integer;
Begin
    pos :=0 ;
    primero:= 1;
    ult:= dimL;
    medio := (primero + ult) div 2 ; 
    While (primero <= ult) and (x <> v [medio].codigo) do 
    begin
        If (x < v[medio].codigo) then 
            ult:= medio -1 
        else
            primero:= medio+1 ;
        medio := (primero + ult) div 2 ;
    end;
    If (primero <= ult) then
        pos := medio
    else
        pos := 0;
End;  


procedure BusquedBinaria(var v:vector; var pos:integer; DL,x:integer);
var
	primero,medio,ult:integer;
begin
	primero:=1;
	ult:=DL;
	medio:=(primero+ult) div 2;
	while(x <> v[medio].cod)and(primero <=ult)do begin
		if(x < v[medio])then
			ult:=medio-1
		else
			primero:=medio+1;
		medio:=(primero+ult) div 2;
	end;
	if(primero<=ult)then
		pos:=medio
	else
		pos:=0;
end;















































procedure busqueda_binaria_recursiva(a:integer; var v:vector; var medio,inf,sup:integer; var ok:boolean);
begin
    if(inf <= sup)then begin
        medio := (inf+sup) div 2;
        if(a = v[medio]) then
            ok := true
        else begin
            if(a < v[medio]) then
                sup := medio - 1
            else
                inf := medio + 1;
            busqueda_binaria_recursiva(a,v,medio,inf,sup,ok)
        end
    end
    else
        ok := false;
end;












procedure Seleccion (var v:vector; DL:integer);
var
	i,j,pos:integer;
	aux:item;
begin
	for i:=1 to DL-1 do begin
		pos:=i;
		for j:=i+1 to DL do
			if(v[j] < v[pos])then
				pos:=j;
		item:=v[pos];
		v[pos]:=v[i];
		v[i]:=item;
	
	
	end;



end;


procedure BD(v:vector; DL,x:integer)
var
	pri,medio,ult:integer;
begin
	pri:=1;
	ult:=DL;
	medio:=(pri+ult) div 2;
	while(pri <= ult)and(x < v[medio].cod)do begin
		if(x < v[medio])then
			ult:=medio -1
		else
			pri:=medio+1;
		medio:=(pri+ult)div 2;
	end;
	if(pri<=ult)then
		x:=medio;
	else
		x:=0;
end;






function BDrec (v:vector; var pri,medio,ult:integer; x:integer ): boolean;
begin
	if(pri <=ult)then begin
		medio:=(pri+ult)div 2;
		if(x = v[medio])then
			BDrec:= True;
		else begin
			if(x < v[medio])then
				ult:=medio-1;
			else
				pri:=medio+1;
			BDrec(v,pri,medio,ult,x);
		end;
	end
	else
		BDrec:=False;
end;





























