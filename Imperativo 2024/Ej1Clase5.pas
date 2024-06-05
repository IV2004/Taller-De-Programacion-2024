program Ej1Clase5;
{
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se debe leer, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación -1.
-Un vec de 300 elemtnos que cada uno e suna oficina

b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.

c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo,
debe retornar la posición del vector donde se encuentra y en caso contrario debe
retornar 0. Luego el programa debe informar el DNI del propietario o un cartel
indicando que no se encontró la oficina.

d) Un módulo recursivo que retorne el monto total de las expensas.}
const
	DF = 300;
type

	oficina = record
		cod:integer;
		DNI:integer;
		valor:integer;
	end;

	vector = array [1..DF] of  oficina;

//PROCESOS
procedure cargarVector(var v:vector; var DL:integer);
	procedure leerOficina(var aux:oficina);
	begin
		writeln('Ingresar cod de id: ');
		readln(aux.cod);
		if(aux.cod <> -1)then begin
			writeln('Ingresar DNI: ');
			readln(aux.DNI);
			writeln('Ingresar valor: ');
			readln(aux.valor);
		end;
	end;
var
 aux:oficina;
begin
	DL:=0;
	leerOficina(aux);
	while((aux.cod <> -1)or(DL = 300))do begin
		DL:=DL+1;
		v[DL]:=aux;
		leerOficina(aux);
	end;
end;



procedure Seleccion(var v:vector; DL:integer);
var
	i,j,pos:integer;
	item:oficina;
begin
	for i:=1 to DL-1 do begin
		pos:=i;
		for j:=i+1 to DL do
			if (v[j].cod < v[pos].cod)then
				pos:=j;
		item:=v[pos];
		v[pos]:=v[i];
		v[i]:=item;
	end;
end;


procedure existeCod(v:vector; DL:integer);
//busqueda dicotomica, recursiva o no
	function busquedadicotomica(v : vector; codigo : integer; diml, pri, fin: integer) : integer;
	var
		medio: integer;
	begin
		if(diml > 0) then
			begin
				if(pri <= fin) then
					begin
						medio:= (pri + fin) div 2;
						if (v[medio].cod = codigo) then
							busquedadicotomica := medio
						else if(codigo < v[medio].cod) then
							busquedadicotomica := busquedadicotomica(v, codigo, diml, pri, medio-1)
						else
							busquedadicotomica := busquedadicotomica(v, codigo, diml, medio+1, fin);
					end
				else
					busquedadicotomica := 0;
			end
		else
			busquedadicotomica := 0;
	end;
var
	pri,fin,cod:integer;
	pos:integer;
begin
	pri:=1;
	fin:=DF;
	writeln('Cod abuscar: ');
	readln(cod);
	pos:=busquedadicotomica(v,cod,DL,pri,fin);
	if(pos = 0)then
		writeln('No se encontro oficina.')
	else
		writeln('La posicion de la oficina con el dicho codigo es: ',pos);
end;

//MAIN
var
	DL:integer;
	vec:vector;
	
begin
	cargarVector(vec,DL);
	Seleccion(vec,DL);
	existeCod(vec,DL);
end.
