program Ej1Recursividad;
{
1.- Implementar un programa que invoque a los siguientes módulos.

a. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto, los
almacene en un vector con dimensión física igual a 10 y retorne el vector.

b. Un módulo que reciba el vector generado en a) e imprima el contenido del vector.

c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector.

d. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne la cantidad de caracteres leídos. El programa debe informar el valor retornado.

e. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne una lista con los caracteres leídos.

f. Un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en el
mismo orden que están almacenados.

g. Implemente un módulo recursivo que reciba la lista generada en e) e imprima los valores de
la lista en orden inverso al que están almacenados.
}
type

	vec10 = array  [1..10] of char;

	lista = ^nodo;
	
	nodo = record
		dato:char;
		sig:lista;
	end;
//==============================================================
procedure moduloA(var vec:vec10; var dimL:integer);
var
	c:char;
begin
	readln(c);
	if(c <> '.')and(dimL < 10)then begin
		dimL:=dimL+1;
		vec[dimL]:=c;
		moduloA(vec,dimL);
	end;
end;
//==============================================================
procedure moduloB(vec:vec10; dimL:integer);
var
	i:integer;
begin
	for i:=1 to dimL do begin
		write(vec[i]);
	end;
end;
//==============================================================
procedure moduloC(vec:vec10; var dimL:integer);
var
	aux:integer;
begin
	aux:=dimL;
	if(dimL > 1)then begin
		dimL:=dimL-1;
		moduloC(vec,dimL);
		write(vec[dimL+1]);
		dimL:=aux;
	end
	else begin
		if(dimL = 1)then begin
			write(vec[dimL]);
		end;
	end;
end;
//==============================================================
{d. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne la cantidad de caracteres leídos. El programa debe informar el valor retornado.}
procedure moduloD(var cant:integer);
var
	c:char;
begin
	readln(c);
	if(c <> '.')then begin
		cant:=cant+1;
		moduloD(cant);
	end
	else
		writeln(cant);
	
end;
//==============================================================
function moduloD2(): integer;
var
	c:char;
begin
	readln(c);
	if(c <> '.')then
		moduloD2:=moduloD2()+1
	else 
		moduloD2:=0;
end;
//==============================================================
procedure agregarAdelante(var l:lista; dato:char);
var
	nue: lista;
begin
	new(nue);
	nue^.dato := dato;
	nue^.sig := l;
	l := nue;
end;
//==============================================================
{e. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne una lista con los caracteres leídos.}
procedure moduloE(var L:lista);
var
	c:char;
begin
	readln(c);
	if(c <> '.')then begin
		agregarAdelante(L,c);
		moduloE(L);
	end
	else
		writeln('listo');
end;
//==============================================================
{f. Un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en el
mismo orden que están almacenados.}
procedure moduloF(L:lista);
begin
	if(L <> nil)then begin
		writeln(L^.dato);
		moduloF(L^.sig);
	end
end;
//==============================================================
var
	{dimL,cant:integer;
	vec:vec10;}
	L:lista;
begin
	{dimL:=0;
	moduloA(vec,dimL);
	moduloB(vec,dimL);
	writeln;
	moduloC(vec,dimL);
	writeln;
	writeln(dimL);
	cant:=0;
	writeln('Cant char: ',moduloD2());}
	L:=nil;
	moduloE(L);
	moduloF(L);
	
end.
