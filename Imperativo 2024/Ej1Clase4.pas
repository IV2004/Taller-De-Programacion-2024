program Ej1Clase4;
{2. Almacene los productos vendidos en una estructura eficiente para la búsqueda por código de producto.
 De cada producto deben quedar almacenados la cantidad total de unidades vendidas y el monto total. 
 De cada venta se lee código de venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. 
 El ingreso de las ventas finaliza cuando se lee el código de venta -1.
//Leo las ventas y me fijo si ya existe un nodo con ese codigo en el arbol.
	Si existe le agrego el monto y cant a las del respectivo nodo
	Sino hago un new y le asigno esos X datos
	
	a. Imprima el contenido del árbol ordenado por código de producto.
	
	b. Contenga un módulo que reciba la estructura generada en el punto a y retorne el
	código de producto con mayor cantidad de unidades vendidas.
	
	c. Contenga un módulo que reciba la estructura generada en el punto a y un código de
	producto y retorne la cantidad de códigos menores que él que hay en la estructura.
	
	d. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de
	producto y retorne el monto total entre todos los códigos de productos comprendidos
	entre los dos valores recibidos (sin incluir).}
	
type

	venta = record
		codV:integer;
		codP:integer;
		cant:integer;
		precio:integer;
	end;
	
	prodV = record
		cod:integer;
		montoTotal:integer;
		cantTotal:integer;
	end;
	
	arbolB = ^nodoABB;
	nodoABB = record
		dato:prodV;
		HI:arbolB;
		HD:arbolB;
	end;

//COMIENZO DE PROCESOS
procedure cargarArbol(var a:arbolB);
	procedure leerVenta(var venta:venta);
	begin
		writeln('Ingrese codigo de venta:	');
		readln(venta.codV);
		if(venta.codV <> -1)then begin
			writeln('Ingrese codP:	');
			readln(venta.codP);
			writeln('Ingrese cant:	');
			readln(venta.cant);
			writeln('Ingrese precio unitario:	');
			readln(venta.precio);
		end;
	end;
	
	procedure asignarDatos(var prod:prodV; venta:venta);
	begin
		prod.cod:=venta.codP;
		prod.montoTotal:=venta.precio;
		prod.cantTotal:=venta.cant;
	end;
	
	procedure agregarDatos(var prod:prodV; venta:venta);
	begin
		prod.montoTotal:=prod.montoTotal+venta.precio;
		prod.cantTotal:=prod.cantTotal+venta.cant;
	end;
	
	procedure agregarElemento(var a:arbolB; venta:venta);
	begin
		if(a = nil)then begin
			new(a);
			a^.HI:=nil;
			a^.HD:=nil;
			asignarDatos(a^.dato,venta);
		end
		else begin
			if(venta.codP = a^.dato.cod)then 
				agregarDatos(a^.dato,venta)
			else begin
				if(venta.codP <= a^.dato.cod)then
					agregarElemento(a^.HI,venta)
				else
					agregarElemento(a^.HD,venta);
			end;
		end;
	end;
	
var
	auxVenta:venta;
begin
	a:=nil;
	leerVenta(auxVenta);
	while(auxVenta.codV <> -1)do begin
		agregarElemento(a,auxVenta);
		leerVenta(auxVenta);
	end;
end;
//=============================================
procedure informarOrdenAscendente(a:arbolB);
	procedure imprimirAscendente(a:arbolB);
	begin
		if(a <> nil)then begin
			imprimirAscendente(a^.HI);
			writeln(a^.dato.cod);
			imprimirAscendente(a^.HD);
		end;
	end;
begin
	writeln();
	writeln('=====================================================');
	writeln();
	writeln('Se imprimira el arbol en orden ascendente segun el cod.');
	writeln();
	imprimirAscendente(a);
end;
//=============================================
procedure informarMaximoDeCant(a:arbolB);
	procedure actualizarMaximo(cantNuevo:integer; codNuevo:integer; var cantMax:integer; var codMax:integer);
	begin
		if(cantNuevo > cantMax)then begin
			cantMax:=cantNuevo;
			codMax:=codNuevo;
		end;
	end;
	
	procedure buscarMaximo(a:arbolB; var cantMax:integer; var codMax:integer);
	//se debe recorrer el arbol por completo porque necesitamos buscar la cantTotal maxima
	begin
		if(a <> nil)then begin
			actualizarMaximo(a^.dato.cantTotal,a^.dato.cod,cantMax,codMax);
			buscarMaximo(a^.HI,cantMax,codMax);
			buscarMaximo(a^.HD,cantMax,codMax);
		end;
	end;
var
	cant,cod:integer;
begin
	cant:=-1;
	cod:=-1;
	buscarMaximo(a,cant,cod);
	writeln();
	writeln('=====================================================');
	writeln();
	writeln('El cod con mayor cant de uni vendidas es: ',cod);
end;
//=============================================
procedure cantCodMenores(a:arbolB);
//a partir de cierto nodo tiene que imprimir todos los que se encuentren a su izquierda
	function cantNodos(a:arbolB):integer;
	begin
		if(a <> nil)then begin
			cantNodos:=cantNodos(a^.HI)+cantNodos(a^.HD)+1;
		end
		else
			cantNodos:=0;
	end;
	function BuscarCantMenores(a:arbolB; cod: integer): integer;
	begin
		if(a <> nil)then begin
			if(a^.dato.cod = cod)then begin
				//manera de saber cuantos nodos hay a partir de la izquierda de este nodo, tambien en esta parte del codigo se debe implementar el +1;
				BuscarCantMenores:=cantNodos(a^.HI);
			end
			else begin
				if(cod <= a^.dato.cod)then
					BuscarCantMenores:=BuscarCantMenores(a^.HI,cod)
				else
					BuscarCantMenores:=BuscarCantMenores(a^.HD,cod);
			end;
		end
		else
			BuscarCantMenores:=0;
	end;


var
	cod,cant:integer;
begin
	writeln();
	writeln('=====================================================');
	writeln();
	writeln('Ingrese codigo a buscar cuantos menores a el hay: ');
	readln(cod);
	cant:=BuscarCantMenores(a,cod);
	writeln(cant);
end;
//=============================================
procedure MontoTotalEntreDosValores(a:arbolB);
{	d. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de
	producto y retorne el monto total entre todos los códigos de productos comprendidos
	entre los dos valores recibidos (sin incluir).}
	procedure recorridoAcotado(a:arbolB;inf:integer;sup:integer; var montoT:integer);
	begin
		if(a <> nil)then begin
			if(a^.dato.cod > inf)then begin//suponiendo que dato es un reg 
				if(a^.dato.cod < sup)then begin
					//Imprimir, supongo que el codigo writeln('cod: ',a^.dato.cod)
					montoT:=montoT+a^.dato.montoTotal;
					recorridoAcotado(a^.HI,inf,sup,montoT);
					recorridoAcotado(a^.HD,inf,sup,montoT);
				end
				else
					recorridoAcotado(a^.HI,inf,sup,montoT)
			end
			else
				recorridoAcotado(a^.HD,inf,sup,montoT);
		end;
	end;
var
	cod1,cod2:integer;
	montoT:integer;
begin
	montoT:=0;
	writeln('Ingrese cod1(el menor): ');
	readln(cod1);
	writeln('Ingrese cod2(el mayor): ');
	readln(cod2);
	recorridoAcotado(a,cod1,cod2,montoT);
	writeln('El monto total entre los dos codigos es: ',montoT);
end;

//COMIENZO DEL MAIN
var
	a:arbolB;
begin
	cargarArbol(a);
	informarOrdenAscendente(a);
	informarMaximoDeCant(a);
	cantCodMenores(a);
	MontoTotalEntreDosValores(a);
end.

