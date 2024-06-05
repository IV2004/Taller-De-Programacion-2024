program Prac1Ej3;
{3.- Implementar un programa que procese las ventas de un supermercado. El supermercado
dispone de una tabla con los precios y stocks de los 1000 productos que tiene a la venta.
a) Implementar un módulo que retorne, en una estructura de datos adecuada, los tickets de
las ventas. De cada venta se lee el código de venta y los productos vendidos. Las ventas
finalizan con el código de venta -1. De cada producto se lee código y cantidad de unidades
solicitadas. Para cada venta, la lectura de los productos a vender finaliza con cantidad de
unidades vendidas igual a 0. El ticket debe contener:
- Código de venta
- Detalle (código de producto, cantidad y precio unitario) de los productos que se pudieron
vender. En caso de no haber stock suficiente, se venderá la máxima cantidad posible.
[De Donde Chota saca el precio unitario?]
- Monto total de la venta.
b) Implementar un módulo que reciba la estructura generada en el inciso a) y un código de
producto y retorne la cantidad de unidades vendidas de ese código de producto.
}
type
//se dispone de un vector de 1000 productos con el precio y stock
	venta = record
		codigo:integer;
		productos:lsita?
	end;

	producto = record
		codigo:integer;
		cant:integer;
		precio:integer;
	end;
	
	ticket = record
		codVenta:integer;
		ListaProds:listaP;
		montoTotal:integer;
	end;

var

begin

end.
