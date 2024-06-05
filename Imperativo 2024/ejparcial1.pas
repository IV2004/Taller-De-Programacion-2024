program prac1par1;
const
	DF = 12;
type
	subMes = 1..12;
	subDia = 1..31;
	
	compra= record
		codJuego:integer;
		codCli:integer;
		dia:subDia;
		mes:submes;
	end;
	
	compra2 = record
		codJuego:integer;
		dia:subDia;
		mes:subMes;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato:compra2;
		sig:lista;
	end;
	
	compras = record
		lista:lista;
		codCli:integer;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato:compras;
		HI:arbol;
		HD:arbol;
	end;
	//Vector que contiene las compras de cada mes, cada posicion equivale a X mes en orden
	vector = array [1..DF] of integer;

//PROCESOS

procedure cargarDatos(var v:vector; var a:arbol);
	procedure inicializarVector(var v:vector);
	var
		i:integer;
	begin
		for i:=1 to DF do
			v[i]:=0;
	end;
	procedure leerCompra(var c:compra);
	begin
		c.codCli:=Random(100);
		if(c.codCli <> 0) then begin
			c.dia:=Random(31)+1;
			c.mes:=Random(12)+1;
			c.codJuego:=Random(100)+1;
		end;
	end;
	procedure agregarAdelante(var L:lista; aux:compra);
	//Se podria pasar direcftamente un tipo compra 2 anteriormente cargado en vez de asignar las cosas aca :P
	var
		nuevo:lista;
	begin
		new(nuevo);
		nuevo^.dato.codJuego:=aux.codJuego;
		nuevo^.dato.dia:=aux.dia;
		nuevo^.dato.mes:=aux.mes;
		nuevo^.sig:=L;
		L:=nuevo;
	end;
	
	procedure agregarElemento(var a:arbol; aux:compra);
	begin
		if(a = nil)then begin
			new(a);
			a^.HI:=nil;
			a^.HD:=nil;
			a^.dato.codCli:=aux.codCli;
			agregarAdelante(a^.dato.lista,aux);
		end
		else begin
			if(aux.codCli = a^.dato.codCli)then
				agregarAdelante(a^.dato.lista,aux)
			else begin
				if(aux.codCli <= a^.dato.codCli)then
					agregarElemento(a^.HI,aux)
				else
					agregarElemento(a^.HD,aux);
			end;
		end;
	end;
	procedure sumarContador(var v:vector; pos:integer);
	begin
		v[pos]:=v[pos]+1;
	end;
var
	aux:compra;
begin
	a:=nil;
	inicializarVector(v);
	leerCompra(aux);
	while(aux.codCli <> 0)do begin
		agregarElemento(a,aux);
		sumarContador(v,aux.mes);
		leerCompra(aux);
	end;
end;
//==========================================
procedure buscarComprasCli(a:arbol);
	procedure buscarCli(a:arbol; L1:lista; cod:integer);
	begin
		if( a <> nil)then begin
			if(cod = a^.dato.codCli)then
				L1:=a^.dato.lista
			else begin
				if(cod <= a^.dato.codCli)then
					buscarCli(a^.HI,L1,cod)
				else
					buscarCli(a^.HD,L1,cod)
			end;
		end;
	end;

var
	cod:integer;
	listaComprasCli:lista;
begin
	listaComprasCli:=nil;
	cod:=Random(100);
	buscarCli(a,listaComprasCli,cod);
end;
//===============================================
procedure Seleccion(var v:vector);
var
	i,j,pos:integer;
	item:integer;
begin
	for i:=1 to DF-1 do begin
		pos:=i;
		for j:=i+1 to DF do
			if (v[j] < v[pos])then
				pos:=j;
		item:=v[pos];
		v[pos]:=v[i];
		v[i]:=item;
	end;
end;





//MAIN
var
	v:vector;
	a:arbol;
begin
	cargarDatos(v,a);
	buscarComprasCli(a);
	Seleccion(v);
end.





	
