program Ej2Parcial;

type

	compra = record
		codCli:integer;
		num:integer;
		cant:integer;
		monto:integer;
	end;
	
	compra2 = record
		num:integer;
		cant:integer;
		monto:integer;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato:compra2;
		sig:lista;
	end;
	

	
	compras = record
		codCli:integer;
		lista:lista;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato:compras;
		HI:arbol;
		HD:arbol;
	end;

//PROCESOS
procedure cargarArbol(var a:arbol);
	procedure leerCompra(var c:compra);
	begin
		writeln('Ingrese cod cli: ');
		readln(c.codCli);
		if(c.codCli <> 0)then begin
			c.num:=Random(10);
			c.cant:=Random(10);
			c.monto:=Random(10);
		end;
	end;
	procedure asignarDatos(c:compra; var aux:compra2; var cod:integer);
	begin
		aux.num:=c.num;
		aux.cant:=c.cant;
		aux.monto:=c.monto;
		cod:=c.codCli;
	end;
	procedure agregarAdelante(var L:lista; dato:compra2);
	var
		nuevo:lista;
	begin
		new(nuevo);
		nuevo^.dato:=dato;
		nuevo^.sig:=L;
		L:=nuevo;
	end;
	procedure agregarElemento(var a:arbol; aux:compra2; cod:integer);
	begin
		if(a = nil)then begin
			new(a);
			a^.HI:=nil;
			a^.HD:=nil;
			a^.dato.codCli:=cod;
			agregarAdelante(a^.dato.lista,aux);
		end
		else begin
			if(a^.dato.codCli = cod)then
				agregarAdelante(a^.dato.lista,aux)
			else begin
				if(cod <= a^.dato.codCli)then 
					agregarElemento(a^.HI,aux,cod)
				else
					agregarElemento(a^.HD,aux,cod);
			end;
		end;
	end;
	
var
	c:compra;
	aux:compra2;
	cod:integer;
begin
	a:=nil;
	leerCompra(c);
	while(c.codCli <> 0)do begin
		asignarDatos(c,aux,cod);
		agregarElemento(a,aux,cod);
		leerCompra(c);
	end;
end;
//
{Implementar un modulo que reciba la estructura generada en a), un cod de cli, y retorne al cant de compras y monto total gastado por dcho cliente
-Osea buscar un cod en el arbol, contar la cantidad de nodos que tiene la lista y sumar los montos para hacer uno total.}
procedure ModuloB(a:arbol);
	procedure recorrerLista(L:lista; var cantCompras:integer; var total:integer);
	var
		aux:lista;
	begin
		aux:=L;
		while(aux <> nil)do begin
			cantCompras:=cantCompras+1;
			total:=total+aux^.dato.monto;
			aux:=aux^.sig;
		end;
	end;
	
	procedure buscarCod(a:arbol;var cantCompras:integer; var montoTotal:integer; cod:integer);
	begin
		if(a <> nil)then begin
			if(cod = a^.dato.codCli)then
				recorrerLista(a^.dato.lista,cantCompras,montoTotal)
			else begin
				if(cod <= a^.dato.codCli)then
					buscarCod(a^.HI,cantCompras,montoTotal,cod)
				else
					buscarCod(a^.HD,cantCompras,montoTotal,cod);
			end;
		end;
	end;

var
	cantCompras,montoTotal:integer;
	cod:integer;
begin
	montoTotal:=0;
	cantCompras:=0;
	writeln('Ingrese cod a bsucar: ');
	readln(cod);
	buscarCod(a,cantCompras,montoTotal,cod);

end;


//MAIN
var
	a:arbol;
begin
	cargarArbol(a);
	ModuloB(a);
end.
