program Ej2Arbol;
{a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
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
type

	venta = record
		cod:integer;
		fecha:integer;
		cant:integer;
	end;
	
	listaV = ^nodoV;
	nodoV = record
		venta:venta;
		sig:listaV;
	end;
	
	//Arbol de ventas
	arbol1 = ^nodoArbol1;
	nodoArbol1 = record
		dato:listaV;
		HI:arbol1;
		HD:arbol1;
	end;
	
	prod = record
		cod:integer;
		cant:integer;
	end;
	
	//Arbol de productos
	arbol2 = ^nodoArbol2;
	nodoArbol2 = record
		dato:prod;
		HI:arbol2;
		HD:arbol2;
	end;
	
	
//COMIENZO DE SUBPROCESOS

//=============================================

procedure cargarArboles(var a1:arbol1; var a2:arbol2);
	procedure GenerarArboles(var a1:arbol1; var a2:arbol2);
	begin
		a1:=nil;
		a2:=nil;
	end;
	
	procedure leerVenta(var auxV:venta);
	begin
		writeln('Ingrese cod:	');
		readln(auxV.cod);
		if(auxV.cod <> 0)then begin
			writeln('Ingrese fecha:	');
			readln(auxV.fecha);
			writeln('Ingrese cant:	');
			readln(auxV.cant);
		end;
	end;
	
	procedure agregarAdelante(var L:listaV; auxV:venta);
	//Todavia tengo mis dudas de como funciona esto :( , es mi nemesis
	var
		nuevo:listaV;
	begin
		new(nuevo);
		nuevo^.venta:=auxV;
		nuevo^.sig:=L;
		L:=nuevo;
	end;
	
	procedure agregarElementoA1(var a:arbol1; auxV:venta);
	begin
		if(a = nil)then begin
			new(a);
			a^.HI:=nil;
			a^.HD:=nil;
			agregarAdelante(a^.dato,auxV);
			//Es medio al pedo que se almacene el codigo en cada nodo de la lista 
			//pero sino tenemos una lista con dos campos y eso no tampoco esta bien
		end
		else begin
			if(auxV.cod = a^.dato^.venta.cod)then
				agregarAdelante(a^.dato,auxV)
			else begin
				 if(auxV.cod <= a^.dato^.venta.cod)then
					agregarElementoA1(a^.HI,auxV)
				else
					agregarElementoA1(a^.HD,auxV);
			end;
		end;
	end;

	procedure agregarElementoA2(var a:arbol2; auxV:venta);
	begin
		if(a = nil)then begin
			new(a);
			a^.HI:=nil;
			a^.HD:=nil;
			a^.dato.cod:=auxV.cod;
			a^.dato.cant:=auxV.cant;
		end
		else begin
			if(auxV.cod = a^.dato.cod)then
				a^.dato.cant:=a^.dato.cant+auxV.cant
			else begin
				if(auxV.cod <= a^.dato.cod)then
					agregarElementoA2(a^.HI,auxV)
				else
					agregarElementoA2(a^.HD,auxV)
			end;
		end;
	end;

var
	auxV:venta;
begin
	GenerarArboles(a1,a2);
	leerVenta(auxV);
	while(auxV.cod <> 0)do begin
		agregarElementoA1(a1,auxV);
		agregarElementoA2(a2,auxV);
		leerVenta(auxV);
	end;
end;

//=============================================
{b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.}
procedure cantUniSegunCod1(a1:arbol1);
	function sumarVentas(L:listaV): integer;
	begin
		if(L <> nil)then
			sumarVentas:=sumarVentas(L^.sig)+L^.venta.cant
		else
			sumarVentas:=0;
	end;
	
	procedure BuscarCod(a:arbol1;cod :integer; var cant:integer);
	begin
		if(a <> nil)then begin
			if(cod = a^.dato^.venta.cod)then
				cant:=sumarVentas(a^.dato)
			else begin
				if(cod <= a^.dato^.venta.cod)then
					BuscarCod(a^.HI,cod,cant)
				else
					BuscarCod(a^.HD,cod,cant);
			end;
		end;
	end;
var
	cant:integer;
	codigo:integer;
begin
	writeln('Ingrese codigo a buscar cant de uni vendidas');
	readln(codigo);
	BuscarCod(a1,codigo,cant);
	writeln('Cant uni vendidas de ese cod: ',cant);
end;
//=============================================
{c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.}
procedure cantUniSegunCod2(a2:arbol2);

	procedure BuscarCod(a:arbol2; codigo:integer; var cant:integer);
	begin
		if(a <> nil)then begin
			if(codigo = a^.dato.cod)then
				cant:=a^.dato.cod
			else begin
				if(codigo <= a^.dato.cod)then
					BuscarCod(a^.HI,codigo,cant)
				else
					BuscarCod(a^.HD,codigo,cant);
			end;
		end;
	end;

var 
	cant:integer;
	codigo:integer;
begin
	writeln('Ingrese codigo a buscar cant de uni vendidas');
	readln(codigo);
	BuscarCod(a2,codigo,cant);
	writeln('Cant uni vendidas de ese cod: ',cant);
end;
//=============================================
//COMIENZO DEL MAIN
var
	a1:arbol1;
	a2:arbol2;
begin
	cargarArboles(a1,a2);
	cantUniSegunCod1(a1);
	cantUniSegunCod2(a2);
end.

	
	
