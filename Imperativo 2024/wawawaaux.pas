{2. Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de
producto 0. Un producto puede estar en más de una venta. Se pide:
	

	i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto.


	ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendida.

Nota: El módulo debe retornar los dos árboles.

	b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.

	c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.} 
program auxEj2AB;

type

	venta = record
		fecha:integer;
		cantVendidas:integer;
	end;
	
	lista = ^nodoV;
	
	nodoV = record
		dato:venta;
		sig:lista;
	end;
	
	
	arbol = ^nodo;

	nodo = record
		codP:integer;
		dato:lista;
		HI:arbol;
		HD:arbol;
	end;



//=========================================================



	{i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto.}
procedure generarArbol(var a:arbol);

	procedure LeerVenta(var venta:venta; var cod:integer);
	begin
		writeln('Ingrese cod de prod:	');
		readln(cod);
		if(cod <> 0)then begin
			writeln('Ingrese fecha de venta:	');
			readln(venta.fecha);
			writeln('Ingrese cant:	');
			readln(venta.cantVendidas);
		end;
	end;
	
	procedure cargarArbol(var a:arbol;aux:venta; codigo:integer);
	var
	
	begin
		if (a <> nil)then begin
		
		end
	end;
//---
var
	aux:venta;
	codigo: integer;
begin
	a:=nil;
	leerVenta(aux,codigo);
	while(codigo <> 0 ) do begin
		cargarArbol(a,aux,codigo);
		leerVenta(aux,codigo);
end;
//=========================================================
//=========================================================
//=========================================================
//=========================================================
var
	a:arbol;
begin
	generarArbol(a);
	
end.
