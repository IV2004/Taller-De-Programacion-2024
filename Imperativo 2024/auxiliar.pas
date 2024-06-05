{Almacene los productos vendidos en una estructura eficiente para la búsqueda por código
de producto. De cada producto deben quedar almacenados la cantidad total de unidades
vendidas y el monto total. De cada venta se lee código de venta, código del producto
vendido, cantidad de unidades vendidas y precio unitario. El ingreso de las ventas finaliza
cuando se lee el código de venta -1.

a. Imprima el contenido del árbol ordenado por código de producto.

b. Contenga un módulo que reciba la estructura generada en el punto a y retorne el
código de producto con mayor cantidad de unidades vendidas.

c. Contenga un módulo que reciba la estructura generada en el punto a y un código de
producto y retorne la cantidad de códigos menores que él que hay en la estructura.

d. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de
producto y retorne el monto total entre todos los códigos de productos comprendidos
entre los dos valores recibidos (sin incluir).}
program ej1;
type
	producto = record
		codigo: integer;
		ventasTotales: integer;
		montoTotal: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: producto;
		HI: arbol;
		HD: arbol;
	end;
//====================================
procedure cargarArbol ( var a: arbol; p: producto);
begin
	if ( a = nil ) then begin
		new ( a );
		a^.dato:= p;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else 
		if ( p.codigo = a^.dato.codigo ) then begin
			a^.dato.ventasTotales:= a^.dato.ventasTotales + p.ventasTotales;
			a^.dato.montoTotal:= a^.dato.montoTotal + p.montoTotal;
		end
		else if ( p.codigo < a^.dato.codigo ) then
			cargarArbol(a^.HI, p)
			else
				cargarArbol(a^.HD, p);
end;
//====================================
procedure leerProducto (var p: producto);
begin
	p.codigo:= random(11);	writeln('Codigo: ',p.codigo);
//	writeln('Codigo: '); readln(p.codigo);
	if (p.codigo <> 0) then begin
		p.ventasTotales:= random(25)+1;
		writeln('Ventas: ',p.ventasTotales);
		p.montoTotal:= random(100)+1;
		writeln('Monto: ',p.montoTotal);
		writeln('');
	end;
end;
//====================================
procedure cargarDatos (var a: arbol);
var
	p: producto;
begin
	leerProducto(p);
	while(p.codigo <> 0) do begin
		cargarArbol(a,p);
		leerProducto(p);
	end;
end;
//====================================
procedure imprimir(p: producto);
begin
	writeln('Codigo: ',p.codigo);
	writeln('Ventas totales: ',p.ventasTotales);
	writeln('Monto total: ',p.montoTotal);
	writeln('');
	writeln('----------');
	writeln('');
end;
//====================================
procedure imprimirArbol(a: arbol);
begin
	if ( a <> NIL ) then begin
		imprimirArbol(a^.HI);
		imprimir(a^.dato);
		imprimirArbol(a^.HD);
	end;
end;
//====================================
procedure buscarCodigoMayor(a: arbol; var codigo: integer);

//======
	procedure buscar(a: arbol; var codigo, max: integer);
	begin
		if ( a <> NIL ) then begin
			if ( max < a^.dato.ventasTotales ) then begin
				max:= a^.dato.ventasTotales;
				codigo:= a^.dato.codigo;
			end;
			buscar(a^.HI, codigo, max);
			buscar(a^.HD, codigo, max);
		end;
	end;
//======

var
	maxAux: integer;
begin
	maxAux:= -1;
	buscar(a,codigo,maxAux);
end;
//====================================
function cantidadMenores ( a: arbol; codigo: integer): integer;
begin
	if ( a <> NIL ) then begin
		if ( a^.dato.codigo < codigo ) then
			cantidadMenores:= cantidadMenores(a^.HI, codigo) + cantidadMenores(a^.HD, codigo) + 1
		else
			cantidadMenores:=cantidadMenores (a^.HI, codigo);
	end
	else
		cantidadmenores:= 0;
end;
//====================================
function buscarEntreDosValores(a: arbol; y, x: integer): integer;
begin
	if (a <> nil ) then begin
		if (a^.dato.codigo > y ) then
			if ( a^.dato.codigo < x ) then begin
				writeln('test: ',a^.dato.montoTotal);
				buscarEntreDosValores:= buscarEntreDosValores(a^.HI, y, x) + buscarEntreDosValores(a^.HD, y, x) + a^.dato.montoTotal;
			end
			else
				buscarEntreDosValores:= buscarEntreDosValores(a^.HI, y, x)
		else
			buscarEntreDosValores:= buscarEntreDosValores(a^.HD, y, x);
	end
	else 
		buscarEntreDosValores:= 0;
end;
//====================================
VAR
	a: arbol;
	codigoMayor, codigo: integer;
	yMenor, xMayor: integer;
	montoTotal: integer;
BEGIN
	a:= nil;
	cargarDatos(a);
	writeln('//  ===============  //');
	imprimirArbol(a);
	writeln('');
	buscarCodigoMayor(a, codigoMayor);
	writeln('El codigo con mayor cantidad de ventas fue: ',codigoMayor);
	writeln('');
	writeln('Ingrese un codigo: ');
	read(codigo);
	writeln('Cantidad de codigos menores: ',cantidadMenores(a, codigo));
	writeln('');
	writeln('Ingrese el numerito menor: ');
	readln(yMenor);
	writeln('Ingrese el numero mayor: ');
	readln(xMayor);
	montoTotal:= buscarEntreDosValores(a,yMenor,xMayor);
	writeln('Monto total: : ',montoTotal);
END.
