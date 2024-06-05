program Prac1Ej2;
{2.- Implementar un programa que procese información de propiedades que están a la venta
en una inmobiliaria.
Se pide:
a) Implementar un módulo para almacenar en una estructura adecuada, las propiedades
agrupadas por zona. Las propiedades de una misma zona deben quedar almacenadas
ordenadas por tipo de propiedad. Para cada propiedad debe almacenarse el código, el tipo de
propiedad y el precio total.
 De cada propiedad se lee: zona (1 a 5), código de propiedad, tipo
de propiedad, cantidad de metros cuadrados y precio del metro cuadrado. La lectura finaliza
cuando se ingresa el precio del metro cuadrado -1.

Leer propiedad
Ver que el precio del metro cuadrado no sea -1.
Ver que tipo de zona es
Asignarla a la zona correspondiente
Agregar ordenado a la lista
Seguir el ciclo

b) Implementar un módulo que reciba la estructura generada en a), un número de zona y un
tipo de propiedad y retorne los códigos de las propiedades de la zona recibida y del tipo
recibido.
}
type

	

	sub5 = 1..5;
	
	
	propiedad = record
		zona:sub5;
		cod:integer;
		tipo:integer;
		cantMet:integer;
		precioMet:integer;
	end;
	
	lista1 = ^nodo1;
	
	nodo1 = record
		dato:propiedad;
		sig:lista1;
	end;
	
	vecL = array [1..5] of lista1;

	//Inciso B
	
	lista2 = ^nodo2;
	
	nodo2 = record
		dato:integer;
		sig:lista2;
	end;
//==============================================================
procedure leerPropiedad(var aux:propiedad);
begin
	writeln('Ingrese zona:	');
	readln(aux.zona);
	writeln('Ingrese codigo:	');
	readln(aux.cod);
	writeln('Ingrese tipo:	');
	readln(aux.tipo);
	writeln('Ingrese cantMet:	');
	readln(aux.cantMet);
	writeln('Ingrese precio x metro:	');
	readln(aux.precioMet)
end;
//==============================================================
procedure insertarOrdenado(var L:lista1; j:propiedad);
var
  nue: lista1;
  act, ant: lista1; {punteros auxiliares para recorrido}
begin
	
  new (nue);
  nue^.dato := j;
  act := L; {ubico act y ant al inicio de la lista}
  ant := L;
  while( act <> nil)and(j.tipo > act^.dato.tipo)do
  begin
    ant := act;
    act:= act^.sig;
  end;
  if (act = ant) then  begin{al inicio o lista vacÃ­a}
	writeln('se crea lista pq ta vacia o va al inicio');
    L:= nue
  end
  else begin {al medio o al final}
	writeln('va al final o al medio');
    ant^.sig:= nue;
	end;
  nue^.sig:= act;
end;

//==============================================================
procedure moduloA(var vec:vecL);
var
	aux:propiedad;
begin
	leerPropiedad(aux);
	while(aux.precioMet<>-1)do begin
		writeln('precio x met:	',aux.precioMet);
		case aux.zona of
			1: insertarOrdenado(vec[1],aux);
			2: insertarOrdenado(vec[2],aux);
			3: insertarOrdenado(vec[3],aux);
			4: insertarOrdenado(vec[4],aux);
			5: insertarOrdenado(vec[5],aux);//se debe crear la lista
			else
				writeln('No se pudo asignar zona');
		end;
		if(aux.precioMet<>-1)then
			leerPropiedad(aux);
	end;
end;
//==============================================================
procedure agregarAdelante(var l:lista2; dato:integer);
var
	nue: lista2;
begin
	new(nue);
	nue^.dato := dato;
	nue^.sig := l;
	l := nue;
end;
//==============================================================
procedure recorrerListaYAgregar ( L : lista1; var L2:lista2; tipo:integer );
begin
	while( L <> nil )and(L^.dato.tipo <= tipo)do begin
		if(L^.dato.tipo = tipo)then
			agregarAdelante(L2,L^.dato.cod);
		L := L^.sig;
	end;
end;
//==============================================================
procedure moduloB(vec:vecL; var L2:lista2);
var
	zona,tipo:integer;
begin
	writeln('Ingrese zona a buscar:	');
	readln(zona);
	writeln('Ingrese tipo a buscar:	');
	readln(tipo);
	recorrerListaYAgregar(vec[zona],L2,tipo)
end;
//==============================================================
procedure recorrerLista ( L : lista2 );
begin
	while( L <> nil )do begin
		writeln('dato: ',L^.dato );
		L := L^.sig;
	end;
end;
//==============================================================
var
	vec:vecL;
	L2:lista2;
begin
	moduloA(vec);
	writeln('=======================================');
	L2 := nil;
	moduloB(vec,L2);
	recorrerLista(L2);
end.
