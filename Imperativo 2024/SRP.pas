{El correo Argentino necesita procesar los envios entregados durante el mes de Agosto de 2023. De cada envio
 se conoce el codigo del cliente, dia, codigo postal y peso del paquete.
 
 a) Implementar un modulo que lea envios, genere y retorne una estructuras adecuada para la busqueda por el 
    codigo postal, donde para cada codigo postal se almacenen juntos todos los envios (codigo del cliente, dia
    y peso del paquete). La lectura finaliza con peso de paquete 0. 
    
 b) Implementar un modulo que reciba la estructura generada en a) y un codCli, y retorne todos los envios
    de dicho codigo postal.
    
 c) Realizar un modulo recursivo que reciba la estructura que retorna el inciso b) y retorne los dos codigos de 
    cliente correspondientes al envio con mayor y menor peso.
    
 NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.}
 program speedrunParcial;

type

	envio = record
		codCli:integer;
		dia:integer;
		CP:integer;
		peso:integer;
	end;
	
	datoE = record
		dia:integer;
		CP:integer;
		peso:integer;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato:datoE;
		sig:lista;
	end;
	
	cliente = record
		lista:lista;
		cod:integer;
	end;

	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato:cliente;
		HI:arbol;
		HD:arbol;
	end;
//PROCESOS
procedure cargarArbol(var a:arbol);
	procedure leerEnvio(var e:envio);
	begin
		writeln('Ingrese peso: ');
		readln(e.peso);
		if(e.peso <> 0)then begin
			e.codCli:=Random(100);
			e.dia:=Random(31)+1;
			e.CP:=Random(1000);
		end;
	end;
	procedure asignarDatos(envio:envio; var aux:datoE; var cod:integer);
	begin
		cod:=envio.codCli;
		aux.dia:=envio.dia;
		aux.peso:=envio.peso;
		aux.CP:=envio.CP;
	end;
	procedure agregarAdelante(var L:lista; aux:datoE);
	var
		nuevo:lista;
	begin
		new(nuevo);
		nuevo^.dato:=aux;
		nuevo^.sig:=L;
		L:=nuevo;
	end;
	procedure agregarElemento(var a:arbol; aux:datoE; cod:integer);
	begin
		if(a = nil)then begin
			new(a);
			a^.HI:=nil;
			a^.HD:=nil;
			a^.dato.cod:=cod;
			a^.dato.lista:=nil;
			agregarAdelante(a^.dato.lista,aux);
		end
		else
			if(cod = a^.dato.cod)then
				agregarAdelante(a^.dato.lista,aux);
			else begin
				if(cod <= a^.dato.cod)then
					agregarElemento(a^.HI,aux,cod);
				else
					agregarElemento(a^.HD,aux,cod);
			end;
	end;
var
	envio:envio;
	aux:datoE;
	cod:integer;
begin
	a:=nil;
	leerEnvio(envio);
	while(envio.peso <> 0)do begin
		asignarDatos(envio,aux,cod);
		agregarElemento(a,aux,cod);
		leerEnvio(envio);	
	end;

end;


procedure buscarEimprimir(a:arbol; var L:lista);
	procedure BuscarEImprime(a:arbol; cod:integer; var L:lista);
	begin
		if(a <> nil)then begin
			if(cod = a^.dato.cod)then
				L:=a^.dato.lista;
			else begin
				if(cod <= a^.dato.cod)then
					BuscarEImprime(a^.HI,cod)
				else
					BuscarEImprime(a^.HD,cod);
			end;
		
		end;
	end;
var
	cod:integer;
begin
	L:=nil;
	writeln('Ingrese cod a buscar e impirmir envios: ');
	readln(cod);
	BuscarEImprime(a,cod,L);
end;






 {c) Realizar un modulo recursivo que reciba la estructura que retorna el inciso b) y retorne los dos codigos de 
    cliente correspondientes al envio con mayor y menor peso.}
procedure ModuloC(L:lista; var CPMAX:integer; var CPMIN:integer);
	procedure recorrerListaRec(L:lista; var CPMAX,MAX:integer; var CPMIN,MIN:integer);
	begin
		if(L <> nil)then begin
			if(L^.dato.peso < MIN)then begin
				MIN:=L^.dato.peso;
				CPMIN:=L^.dato.CP;
			end
			else
				if(L^.dato.peso > MAX)then begin
					MAX:=L^.dato.peso;
					CPMIN:=L^.dato.CP;
				end;
			recorrerListaRec(L^.sig,CPMAX,MAX,CPMIN,MIN);
		end;
	
	end;
	
var
	MAX,MIN:integer;
begin
	MAX:=0;
	MIN:=0;
	CPMAX:=0;
	CPMIN:=0;
	recorrerListaRec(L,CPMAX,MAX,CPMIN,MIN);

end;


//MAIN

var
	a:arbol;
	L:lista;
begin
	cargarArbol(a);
	buscarEimprimir(a,L);
end.




	
	
	
