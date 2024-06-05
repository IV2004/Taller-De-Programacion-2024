{2.- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número
leído, sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo
recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe
imprimir 2 5 6}
//una lista de numeros que despues imprima la descompocision de cada numero de manera recursiva
{
crear una lista con X numeros hasta que se lea el 0
}


program Ej2Rec;

type

	lista = ^nodo;
	
	nodo = record
		dato:integer;
		sig:lista;
	end;
	
//==============================================================
procedure LeerNumeros(var L:lista);
	procedure agregarAdelante(var l:lista; dato:integer);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato := dato;
		nue^.sig := l;
		l := nue;
	end;
var
	num:integer;
begin
	writeln('Ingrese num:	');
	readln(num);
	while(num <> 0)do begin
		agregarAdelante(L,num);
		writeln('Ingrese num:	');
		readln(num);
	end;
	writeln('Lectura finalizada');
end;
//==============================================================
procedure DescomponerEImprimir(L:lista);

	procedure descomponerRec(num:integer);
	var
		resto,aux:integer;
	begin
		if(num <> 0)then begin
			resto:= num MOD 10;
			aux:= num DIV 10;
			descomponerRec(aux);
			write(resto,' ');
		end;
	end;
	procedure RecorrerListaRec(L:lista);
	begin
		if (L <> nil) then begin
			RecorrerListaRec(L^.sig);
			descomponerRec(L^.dato);
			writeln();
		end;
	end;
//recorrer una lsita de amnera recursiva
begin
	RecorrerListaRec(L);
	writeln('emmmm	');
end;
//==============================================================


//==============================================================
var
	L:lista;
begin
	L:=nil;
	LeerNumeros(L);
	DescomponerEImprimir(L);
end.
