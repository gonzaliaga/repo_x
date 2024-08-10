Algoritmo Proyecto_sistema_de_costos
	//Declarar variables del sistema de costo
	Definir descuentoCupon,precioIVA,descuentoxCantidad,costoEnvio,precioFinal1,precioFinal2 como real
	Definir i,pedidos,cantidad,pedidofinal Como Entero
	//Asignación de valores fijos
	descuentocupon<-0.1
	iva<-1.12
	descuentoporcantidad<-0.05
	costoenvio<-10
	pesopaquete<-3
	
	//Crear un array para los precios originales y otro para realizar lista de pedidos de los productos
	Dimension precioOriginal[1]

	
	//Realizar ingreso de precios originales
	Para i<-1 Hasta 1 Con Paso 1 Hacer
		Escribir "Ingrese el precio original para el pedido:"
		Leer precioOriginal[i]
	Fin Para
	
	//Realizar cálculos para cada pedido
	// input: 1234Bla
	
	Para i<-1 Hasta 1 Con Paso 1 Hacer
		//Realizar calculo para cupón de descuento 
		descuentoCupon<-precioOriginal[i]-(precioOriginal[i]*descuentocupon)
		//Realizar calculo para aplicar el IVA al producto con descuento
		precioIVA<-descuentoCupon*iva
		//Realizar calculo de descuento por cantidad de producto
		descuentoxCantidad<-precioIVA-(precioIVA*descuentoporcantidad)
		//Realizar calculo del producto final más el envío de un par
		precioFinal1<-(precioIVA*1)+costoEnvio
		//Realizar calculo del producto final más el envío de dos pares
		precioFinal2<-(descuentoxCantidad*2)+costoEnvio
		
		//Agregar precio y cantidad del producto pedido por el cliente
		Escribir "Ingrese cantidad de producto solicitado por el cliente para el pedido", i, ":"
		leer cantidad
		Si cantidad>=2 Entonces
			Escribir "Si lleva 2 pares se aplica descuento del 5% donde cada producto queda en un valor de $", descuentoxCantidad
		SiNo
			Escribir "Si lleva 1 par se aplica descuento cupon 10% y el producto queda en un valor de $", precioIVA 
		Fin Si
		
		// Calculo final del producto más el envío
		Escribir "Ingrese cantidad final del pedido", i, ":"
		Leer pedidoFinal
		Si pedidoFinal>=2 Entonces
			Escribir "El precio total de 2 pares más el costo de envío es de $", precioFinal2
		SiNo
			Escribir "El precio total de 1 par más el costo de envío es de $", precioFinal1
		Fin Si
		
		//Mostrar valores desglosados 
		Escribir "Los valores desglosados de los productos del pedido", i, " son:"
		Escribir "El precio original del producto es de = $", precioOriginal[i]
		Escribir "El precio del producto con cupón de descuento es de = $", descuentoCupon
		Escribir "El precio del producto con descuento más el IVA agregado es de = $", precioIVA
		Escribir "El precio del producto si llevas dos pares, cada producto tiene un valor de = $", descuentoxCantidad
		Escribir "El costo de envío tiene un valor de = $", costoEnvio
		Escribir "El precio final de un producto más el envío es de = $", precioFinal1
		Escribir "El precio final de dos productos más el envío es de = $", precioFinal2
	Fin Para
FinAlgoritmo

