program Ej3Parcial;

type
	subAluNum = 0..7000;
	subMat = 300..356;
	subNota = 0..10;
	
	alumno = record
		num:subAluNum;
		codMat:subMat;
		nota:subNota;
	end;
	
	finales = record
		codMat:subMat;
		nota:subNota;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato:finales;
		sig:lista;
	end;
	
	alu = record
		num:integer;
		lista:lista;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato:alu;
		HI:arbol;
		HD:arbol;
	end;
	
	fichaProm = record
		num:integer;
		prom:real;
	end;
	
	lista2 = ^nodoLista2;
	
	nodoLista2 = record
		dato:fichaProm;
		sig:lista2;
	end;
	
	
	
//Procesos
procedure cargarArbol(var a:arbol);

	procedure leerAlu(var alu:alumno);
	begin
		writeln('Ingrese el num de alu: ');
		readln(alu.num);
		if(alu.num <> 0)then begin
			writeln('Ingrese cod de mat: ');
			readln(alu.codMat);
			writeln('Ingrese nota: ');
			readln(alu.nota);
		end;
	end;
	
	procedure asignarDatos(alu:alumno; var aux:finales; var num:integer);
	begin
		aux.codMat:=alu.codMat;
		aux.nota:=alu.nota;
		num:=alu.num;
	end;
	
	procedure agregarAdelante(var L:lista; aux:finales);
	var
		nuevo:lista;
	begin
		new(nuevo);
		nuevo^.dato:=aux;
		nuevo^.sig:=L;
		L:=nuevo;
	end;
	
	procedure agregarElemento(var a:arbol; aux:finales; num:integer);
	begin
		if(a = nil)then begin
			new(a);
			a^.HI:=nil;
			a^.HD:=nil;
			a^.dato.num:=num;
			agregarAdelante(a^.dato.lista,aux);
		end
		else begin
			if(num = a^.dato.num)then
				agregarAdelante(a^.dato.lista,aux)
			else begin
				if(num <= a^.dato.num)then
					agregarElemento(a^.HI,aux,num)
				else
					agregarElemento(a^.HD,aux,num);
			end;
		end;
	end;
	
var
	alu:alumno;
	aux:finales;
	num:integer;
begin
	a:=nil;
	leerAlu(alu);
	while(alu.num <> 0)do begin
		asignarDatos(alu,aux,num);
		agregarElemento(a,aux,num);
		leerAlu(alu);
	end;
end;

//MODULO B
//RECIBE EL ARBOL Y DE MANERA RECURSIVA QUE CONTENGA EL PROMEDIO DE CADA ALUMNO
{Recorres todo el arbol, cada vez que pases pór un nodo distinto a nil, calculas el promedio y lo asignas a a un registro con el num de alu, ese registro es el campo de una lista con todos los dichos promedios}
procedure ModuloB(a:arbol;var L:lista2);
	procedure agregarAdelante(var L:lista2; aux:fichaProm);
	var
		nuevo:lista2;
	begin
		new(nuevo);
		nuevo^.dato.num:=aux.num;
		nuevo^.dato.prom:=aux.prom;
		nuevo^.sig:=L;
		L:=nuevo;
	end;
	procedure calcularProm(L:lista; var aux:fichaProm);
	var
		auxL:lista;
		cant,total:integer;
	begin
		auxL:=L;
		cant:=0;
		total:=0;
		while(auxL <> nil)do begin
			cant:=cant+1;
			total:=total+L^.dato.nota;
			auxL:=auxL^.sig;
		end;
		aux.prom:=total/cant;
	end;
	
	procedure recorrerArbol(a:arbol; var L:lista2; var aux:fichaProm);
	begin
		if(a <> nil)then begin
			calcularProm(a^.dato.lista,aux);
			aux.num:=a^.dato.num;
			agregarAdelante(L,aux);
			recorrerArbol(a^.HI,L,aux);
			recorrerArbol(a^.HD,L,aux);
		end;
	end;
	
var
	aux:fichaProm;
begin
	L:=nil;
	recorrerArbol(a,L,aux);
	
end;



//MODULO C
{BASICMENTE COMO ORDENAR UNA LSITA}
procedure agregarOrdenado ( var L: listaR; d: datosR);
var
	aux, ant, act: listaR;
begin
	new ( aux );
	aux^.dato:= d;
	act:= L;
	while ( act <> NIL ) and ( act^.dato.prom < d.prom ) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if ( act = L ) then
		L:= aux
	else
		ant^.sig:= aux;
	aux^.sig:= act;
end;
//====================================
procedure moduloC (var L: listaR);
var
	aux: listaR;
begin
	aux:= NIL;
	while ( L <> NIL ) do begin
		agregarOrdenado(aux, L^.dato);
		L:= L^.sig;
	end;
	L:= aux;
end;
//Main
var
	a:arbol;
	L:lista2;
begin
	cargarArbol(a);
	ModuloB(a,L);
	
end.	
	
	
