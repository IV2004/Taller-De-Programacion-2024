program Ej1Arbol;
{a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol
binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
con el número de socio 0 y el árbol debe quedar ordenado por número de socio.

b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
parámetro y que :

	i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que
	retorne dicho valor.
	
	ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un
	módulo recursivo que retorne dicho socio.
	
	iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que
	retorne dicho valor.
	
	iv. Aumente en 1 la edad de todos los socios.
	
	v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a
	un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
	
	vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a
	un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
	
	vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
	cantidad.
	
	viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del
	inciso vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
	
	xi. Informe los números de socio en orden creciente.
	
	x. Informe los números de socio pares en orden decreciente.}
type

socio = record
	num:integer;
	nombre:string;
	edad:integer;
end;

//Debe estar ordenado x num de socio
arbol = ^nodoArbol;

nodoArbol = record
	dato:socio;
	HI:arbol;
	HD:arbol;
end;

//COMIENZO DE PROCESOS

procedure GenerarArbol(var a:arbol);
	procedure LeerSocio (var socio:socio);
	begin
		writeln('Ingrese num de socio:	');
		readln(socio.num);
		if(socio.num <> 0)then begin
			writeln('Ingrese nombre:	');
			readln(socio.nombre);
			writeln('Ingrese edad:(pone el num como edad)	');
			//readln(socio.edad);
			socio.edad:=socio.num;
		end;
	end;
	procedure InsertarElemento (var a:arbol; dato:socio);
	begin
		if(a = nil)then begin
			new(a);
			a^.HI:=nil;
			a^.HD:=nil;
			a^.dato:=dato;
		end
		else begin
			if(dato.num <= a^.dato.num)then
				InsertarElemento(a^.HI,dato)
			else
				InsertarElemento(a^.HD,dato);
		end;
	end;
var
	aux:socio;
begin
	a:=nil;
	LeerSocio(aux);
	while(aux.num <> 0)do begin
		InsertarElemento(a,aux);
		LeerSocio(aux);
	end;
end;
//=========================================
procedure InformarSocioMasGrande(a:arbol);
	function NumeroMasGrande(a:arbol): integer;
	begin
		if(a = nil)then
			NumeroMasGrande:=-1
		else begin
			if(a^.HD = nil)then
				NumeroMasGrande:= a^.dato.num
			else
				NumeroMasGrande:=NumeroMasGrande(a^.HD);
		end;
	end;
var
	max:integer;
begin
	writeln();
	writeln('=====================================================');
	writeln();
	max:=NumeroMasGrande(a);
	if(max = -1)then
		writeln('No existen socios en este arbol')
	else begin
		writeln('Numero de socio Maximo: ',max);
	end;
end;
//=========================================
procedure InformarSocioMasChico(a:arbol);
	function NumeroMasChico(a:arbol): integer;
	begin
		if(a = nil)then
			NumeroMasChico:=-1
		else begin
			if(a^.HI = nil)then
				NumeroMasChico:= a^.dato.num
			else
				NumeroMasChico:=NumeroMasChico(a^.HI);
		end;
	end;
var
	min:integer;
begin
	writeln();
	writeln('=====================================================');
	writeln();
	min:=NumeroMasChico(a);
	if(min = -1)then
		writeln('No existen socios en este arbol')
	else begin
		writeln('Numero de socio Minimo: ',min);
	end;
end;
//=========================================
procedure InformarNumeroSocioConMasEdad(a:arbol);
	procedure actualizarMaximo (var maxEdad,maxNum: integer; nuevaEdad,nuevoNum:integer);
	begin
		if(nuevaEdad>maxEdad)then begin
			maxEdad:=nuevaEdad;
			maxNum:=nuevoNum;
		end;
	end;
	procedure NumeroMasEdad(a:arbol;var maxEdad,maxNum:integer);
	begin
		if(a <> nil)then begin
			actualizarMaximo(maxEdad,maxNum,a^.dato.edad,a^.dato.num);
			NumeroMasEdad(a^.HI,maxEdad,maxNum);
			NumeroMasEdad(a^.HD,maxEdad,maxNum);
		end;
	end;
var
	maxEdad:integer;
	maxNum:integer;
begin
	writeln();
	writeln('=====================================================');
	writeln();
	maxEdad:=-1;
	maxNum:=-1;
	NumeroMasEdad(a,maxEdad,maxNum);
	if(maxNum > -1)then 
		writeln('Numero del socio con mayor edad: ',maxNum)
	else
		writeln('Arbol sin elementos.');
end;
//=========================================
procedure AumentarEdad(var a:arbol);
begin
	if( a <> nil)then begin
		a^.dato.edad:=a^.dato.edad +1;
		AumentarEdad(a^.HI);
		AumentarEdad(a^.HD);
	end;
end;
//=========================================
procedure InformarExistenciaNumeroSocio(a:Arbol);
	function Buscar (a:arbol; num:integer): boolean;
	begin
		if (a = nil)then
			Buscar:=false
		else begin
			if(num = a^.dato.num)then
				Buscar:=true
			else begin
				if(num <= a^.dato.num)then
					Buscar:=Buscar(a^.HI,num)
				else
					Buscar:=Buscar(a^.HD,num);
			end;
		end;
	end;
var
	num:integer;
	existe:boolean;
begin
	writeln();
	writeln('=====================================================');
	writeln();
	writeln('Ingrese numero de socio a verificar su existencia:	');
	readln(num);
	existe:=Buscar(a,num);
	if(existe = true)then
		writeln('Si existe un socio con dicho socio.')
	else
		writeln('No existe un socio con dicho numero.');
end;
//=========================================
procedure InformarExistenciaNombreSocio(a:arbol);
	function Buscar(a:arbol; nombre:string): boolean;
	begin
		if(a = nil)then
			Buscar:=false
		else begin
			if(nombre = a^.dato.nombre)then 
				Buscar:=true
			else 
				Buscar:=Buscar(a^.HI,nombre) or Buscar(a^.HD,nombre);
		end;
	end;
var
	nombreSocio:string;
	existe:boolean;
begin
	writeln();
	writeln('=====================================================');
	writeln();
	writeln('Ingrese nombre a buscar si existe');
	readln(nombreSocio);
	existe:=Buscar(a,nombreSocio);
	if(existe = true)then 
		writeln('Si existe un socio con dicho nombre')
	else
		writeln('No existe un socio con dicho nombre');
end;
//=========================================
//No se si esta bien
function CantSocios(a:arbol): integer;
	begin
		if(a <> nil)then
			CantSocios:=CantSocios(a^.HI)+CantSocios(a^.HD)+1
		else
			CantSocios:=0;
	end;
	
procedure InformarCantSocios(a:arbol);
var
	cant:integer;
begin
	writeln();
	writeln('=====================================================');
	writeln();
	cant:=CantSocios(a);
	writeln('La cantidad de socios es: ',cant);
end;
//=========================================
procedure InformarEdadPromedio(a:arbol);
	function EdadTotal(a:arbol): integer;
	begin
		if(a <> nil)then
			EdadTotal:=EdadTotal(a^.HI)+EdadTotal(a^.HD)+a^.dato.edad
		else
			EdadTotal:=0;
	end;
var
	totalEdad:integer;
	totalSocios:integer;
	prom:real;
begin
	writeln();
	writeln('=====================================================');
	writeln();
	totalEdad:=EdadTotal(a);
	writeln('Total Edad: ',totalEdad);
	totalSocios:=CantSocios(a);
	writeln('Total Socios: ',totalSocios);
	prom:= (totalEdad / totalSocios);
	writeln('La edad promedio es: ',prom:1:2);
end;
//=========================================
procedure InformarSociosEnOrdenCreciente(a:arbol); 
//xi. Informe los números de socio en orden creciente. ^
	procedure NumSocioOrdenCreciente(a:arbol);
	begin
		if(a <> nil)then begin
			NumSocioOrdenCreciente(a^.HD);
			writeln(a^.dato.num);
			NumSocioOrdenCreciente(a^.HI);
		end;
	end;

begin
	writeln();
	writeln('=====================================================');
	writeln();
	writeln('Se informaran los socios a partir del numero de socio en orden creciente:	');
	NumSocioOrdenCreciente(a);
end;
//=========================================
procedure InformarSociosEnOrdenDecreciente(a:arbol);
	procedure NumSocioOrdenDecreciente(a:arbol);
	begin
		if(a <> nil)then begin
			NumSocioOrdenDecreciente(a^.HI);
			writeln(a^.dato.num);
			NumSocioOrdenDecreciente(a^.HD);
		end;
	end;
begin
		writeln();
	writeln('=====================================================');
	writeln();
	writeln('Se informaran los socios a partir del numero de socio en orden decreciente:	');
	NumSocioOrdenDecreciente(a);
end;

//COMIENZO DEL MAIN
var
	a:arbol;
begin
	GenerarArbol(a);
	InformarSocioMasGrande(a);
	InformarSocioMasChico(a);
	InformarNumeroSocioConMasEdad(a);
	AumentarEdad(a);
	InformarExistenciaNumeroSocio(a);
	InformarExistenciaNombreSocio(a);
	InformarCantSocios(a);
	InformarEdadPromedio(a);
	InformarSociosEnOrdenCreciente(a);
	InformarSociosEnOrdenDecreciente(a);
end.

















