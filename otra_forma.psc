
	Proceso Sistema_de_costo
		
		definir precio_unt,producto,termino,validador,validador_peso,peso_test,cantidad_aux,validador_cantidad,validador_cupon,tiene_cupon,a,valor_cupon_tex,region_aux ,validador_region,direccion,region_texto Como Caracter;
		definir precio_num,iva,peso_producto,costo_envio,validador_tex,valor_cupon,cargo_lejania,cupon_cantidad,subtotal_x_cantidad,subtotal_x_cupon,subtotal_cargo_lejania,cargo_peso,subtotal_x_peso,subtotal_sin_descuento,impuestos,total_pagar Como Real;
		definir i, acomulador,cantidad,region Como Entero;
		
		
		Escribir "Ingrese producto";
		Leer producto;
		
		// valida precio sea mayor a 0 y que sea numero
		
		Repetir
			validador <- "NO";
			
			// valida que el precio sea un numero
			
			Mientras  validador == "NO" Hacer
				
				acomulador <- 0;
				
				Escribir "Ingrese Precio producto: ";
				leer precio_unt;
				
				Para i <- 0 Hasta longitud(precio_unt) Con Paso 1 Hacer
					//Escribir SubCadena(precio_unt,i,i);
					a <-  SubCadena(precio_unt,i,i);
					si (a == '0' o a == '1' o a == '2' o a == '3' o a == '4' o a == '5' o a == '6' o a == '7' o a == '8' o a == '9') Entonces
						//escribir acomulador;
						acomulador <- acomulador + 1000;
					SiNo
						//escribir acomulador;
						acomulador <- acomulador + 1;
					FinSi
				FinPara
				
				validador_tex <- acomulador -1;
				
				si validador_tex MOD(1000) == 0 Entonces
					Escribir "es numero";
					validador <- "es numero";
				SiNo
					escribir "es texto";
					validador <- "NO";
					
				FinSi
				
			FinMientras
			
			precio_num <- ConvertirANumero(precio_unt);
			
			// fin valida precio
			
			si precio_num <= 0 Entonces
				escribir "el precio debe ser mayor a 0";
			FinSi
			
		Hasta Que precio_num > 0;
		
		// valida precio mayor a 0 y que sea numero
		
		// valida que peso sea mayor a 0 y que sea numero
		Repetir
			// valida que el peso sea un numero
			validador_peso <- "NO";
			
			Mientras  validador_peso == "NO" Hacer
				
				acomulador <- 0;
				
				Escribir "Ingrese Peso producto: ";
				leer peso_test;
				
				Para i <- 0 Hasta longitud(peso_test) Con Paso 1 Hacer
					//Escribir SubCadena(precio_unt,i,i);
					a <-  SubCadena(peso_test,i,i);
					si (a == '0' o a == '1' o a == '2' o a == '3' o a == '4' o a == '5' o a == '6' o a == '7' o a == '8' o a == '9') Entonces
						//escribir acomulador;
						acomulador <- acomulador + 1000;
					SiNo
						//escribir acomulador;
						acomulador <- acomulador + 1;
					FinSi
				FinPara
				
				validador_tex <- acomulador -1;
				
				si validador_tex MOD(1000) == 0 Entonces
					Escribir "es numero";
					validador_peso <- "es numero";
				SiNo
					escribir "es texto";
					validador_peso <- "NO";
					
				FinSi
				
			FinMientras
			
			peso_producto <- ConvertirANumero(peso_test);
			
			// fin valida peso
			
			si peso_producto <= 0 Entonces
				escribir "el peso debe ser mayor a 0";
			FinSi
		Hasta Que peso_producto > 0;
		// fin valida peso mayor a 0 y numero
		
		// ajusta el cargo por peso para el envio
		
		si peso_producto > 2 y peso_producto <= 5 Entonces
			cargo_peso <- 2;
		SiNo
			si peso_producto > 5 y peso_producto < 25 Entonces
				cargo_peso <- 5;
			SiNo
				si peso_producto >= 25 Entonces
					cargo_peso <- 10;
				SiNo
					cargo_peso <- 0;
				FinSi
				
			FinSi
		FinSi
		// fin ajusta el cargo por peso para el envio
		
		// valida cantidad sea mayor a 0 y sea un numero
		Repetir
			
			validador_cantidad <- "NO";
			// valida que el cantidad sea un numero
			
			Mientras  validador_cantidad == "NO" Hacer
				
				acomulador <- 0;
				
				Escribir "Ingrese cantidad a comprar: ";
				leer cantidad_aux;
				
				Para i <- 0 Hasta longitud(cantidad_aux) Con Paso 1 Hacer
					//Escribir SubCadena(precio_unt,i,i);
					a <-  SubCadena(cantidad_aux,i,i);
					si (a == '0' o a == '1' o a == '2' o a == '3' o a == '4' o a == '5' o a == '6' o a == '7' o a == '8' o a == '9') Entonces
						//escribir acomulador;
						acomulador <- acomulador + 1000;
					SiNo
						//escribir acomulador;
						acomulador <- acomulador + 1;
					FinSi
				FinPara
				
				validador_tex <- acomulador -1;
				
				si validador_tex MOD(1000) == 0 Entonces
					Escribir "es numero";
					validador_cantidad <- "es numero";
				SiNo
					escribir "es texto";
					validador_cantidad <- "NO";
					
				FinSi
				
			FinMientras
			
			cantidad <- ConvertirANumero(cantidad_aux);
			
			// fin valida cantidad
			
			si cantidad <= 0 Entonces
				escribir "el cantidad debe ser mayor a 0";
			FinSi
		Hasta Que cantidad > 0;
		// fin valida cantidad mayor a 0 y es un numero
		
		
		// indica si tiene cupon por cantidad
		si cantidad > 1 y cantidad <= 2 Entonces
			cupon_cantidad <- 5;
		SiNo
			si cantidad > 2 y cantidad < 5 Entonces
				cupon_cantidad <- 10;
			SiNo
				si cantidad >= 5 Entonces
					cupon_cantidad <- 15;
				SiNo
					cupon_cantidad <- 0;
				FinSi
			FinSi
		FinSi
		
		escribir "su % descuento por cantidad es de :", cantidad;
		// fin cupon descuento por cantidad
		
		// consulta si tiene cupon de descuento
		
		Repetir 
			Escribir "¿Tiene Cupon de descuento? ingrese SI o NO";
			leer tiene_cupon;
			si Mayusculas(tiene_cupon) <> 'SI' Entonces
				escribir " alternativa no valida";
			FinSi
		Hasta Que Mayusculas(tiene_cupon) == "SI" o Mayusculas(tiene_cupon) == 'NO'
		
		// fin consulta tiene cupon de descuento
		
		// si tiene cupon ingresa descuento de lo contrario descuento = 0
		
		si Mayusculas(tiene_cupon) == 'SI' Entonces
			
			Repetir
				validador_cupon <- 'NO';
				// valida cupon sea numero
				Mientras validador_cupon == 'NO' Hacer
					acomulador <- 0;
					
					Escribir "Ingrese % de descuento de su cupon (debe ser entre 10% y 40%: ";
					leer valor_cupon_tex;
					
					Para i <- 0 Hasta longitud(valor_cupon_tex) Con Paso 1 Hacer
						//Escribir SubCadena(precio_unt,i,i);
						a <-  SubCadena(valor_cupon_tex,i,i);
						si (a == '0' o a == '1' o a == '2' o a == '3' o a == '4' o a == '5' o a == '6' o a == '7' o a == '8' o a == '9') Entonces
							//escribir acomulador;
							acomulador <- acomulador + 1000;
						SiNo
							//escribir acomulador;
							acomulador <- acomulador + 1;
						FinSi
					FinPara
					
					validador_tex <- acomulador -1;
					
					si validador_tex MOD(1000) == 0 Entonces
						Escribir "es numero";
						validador_cupon <- "es numero";
					SiNo
						escribir "es texto";
						validador_cupon <- "NO";
						
					FinSi
					
				FinMientras
				
				valor_cupon <- ConvertirANumero(valor_cupon_tex);
				
				si valor_cupon < 10 y valor_cupon > 40 Entonces
					escribir "el valor del cupon debe ser entre 10 y 40";
				FinSi
				
				// fin valida cupon sea numero
			Hasta Que valor_cupon <= 40 y valor_cupon >= 10
			
			// valida que cupon sea menor a 40% y mayor al 10%
			Escribir "Descuento valido";
		SiNo
			Escribir 'sin descuento';
			valor_cupon <- 0;
		FinSi
		
		// fin si tiene cupon ingresa descuento de lo contrario descuento = 0
		
		// validar que region sea numero y sea menor a 15
		Repetir
			validador_region <- 'NO';
			// valida cupon sea numero
			Mientras validador_region == 'NO' Hacer
				acomulador <- 0;
				
				Escribir "Escoja Region de Envio de (1 al 15): ";
				leer region_aux;
				
				Para i <- 0 Hasta longitud(region_aux) Con Paso 1 Hacer
					//Escribir SubCadena(precio_unt,i,i);
					a <-  SubCadena(region_aux,i,i);
					si (a == '0' o a == '1' o a == '2' o a == '3' o a == '4' o a == '5' o a == '6' o a == '7' o a == '8' o a == '9') Entonces
						//escribir acomulador;
						acomulador <- acomulador + 1000;
					SiNo
						//escribir acomulador;
						acomulador <- acomulador + 1;
					FinSi
				FinPara
				
				validador_tex <- acomulador -1;
				
				si validador_tex MOD(1000) == 0 Entonces
					Escribir "es numero";
					validador_region <- "es numero";
				SiNo
					escribir "es texto";
					validador_region <- "NO";
					
				FinSi
				
			FinMientras
			
			region <- ConvertirANumero(region_aux);
			
			si region < 1 y region > 15 Entonces
				escribir "el valor del cupon debe ser entre 1 y 15";
			FinSi
			
		Hasta Que region >= 1 y region <= 15
		
		// fin evalua region si es numero y esta entre 1 y 15
		
		// indica region seleccionada y cargo por lejania envio
		Escribir "la region seleccionada es";
		
		// indicar region y cargo por envio segun lejania region metropolitana
		
		Segun region Hacer
			1:
				escribir "TARAPACA";
				region_texto <- "TARAPACA";
				cargo_lejania <- 15;
			2:
				escribir "ANTOFAGASTA";
				region_texto <- "ANTOFAGASTA";
				cargo_lejania <- 15;
			3:
				escribir "ATACAMA";
				region_texto <- "ATACAMA";
				cargo_lejania <- 10;
			4:
				escribir "COQUIMBO";
				region_texto <- "COQUIMBO";
				cargo_lejania <- 10;
			5:
				escribir "VALPARAISO";
				region_texto <- "VALPARAISO";
				cargo_lejania <- 5;
			6:
				escribir "OHIGGINS";
				region_texto <- "OHIGGINS";
				cargo_lejania <- 5;
			7:
				escribir "MAULE";
				region_texto <- "MAULE";
				cargo_lejania <- 10;
			8:
				escribir "BIO BIO";
				region_texto <- "TARAPACA";
				cargo_lejania <- 10;
			9:
				escribir "ARAUCANIA";
				region_texto <- "ARAUCANIA";
				cargo_lejania <- 25;
			10:
				escribir "LOS LAGOS";
				region_texto <- "LOS LAGOS";
				cargo_lejania <- 15;
			11:
				escribir "AYSEN";
				region_texto <- "AYSEN";
				cargo_lejania <- 20;
			12:
				escribir "MAGALLANES";
				region_texto <- "MAGALLANES";
				cargo_lejania <- 15;
			13:
				escribir "METROPOLITANA";
				region_texto <- "METROPOLITANA";
				cargo_lejania <- 2;
			14:
				escribir "LOS RIOS";
				region_texto <- "LOS RIOS";
				cargo_lejania <- 15;
			15:
				escribir "ARICA";
				region_texto <- "ARICA";
				cargo_lejania <- 20;
			De Otro Modo:
				escribir "REGION NUEVA";
				region_texto <- "REGION NUEVA";
				cargo_lejania <- 25;
		FinSegun
		
		escribir "el % de recargo por lejania es de:";
		escribir cargo_lejania;
		
		// indicar region y cargo por envio segun lejania region metropolitana
		
		// indicar direccion
		escribir "indique direccion de despacho";
		leer direccion;
		
		// calculo subtotal
		
		Escribir "El producto seleccionado es : ", producto;
		Escribir "El precio es unitario es : ",'$', precio_num;
		Escribir "el peso del producrto es: ", peso_producto;
		escribir "La cantidad a comprar es : ", cantidad;
		subtotal_sin_descuento <- precio_num*cantidad;
		escribir "la cantidad sin descuento es: ",'$',subtotal_sin_descuento ;
		escribir "su % descuento por cantidad es de : ", cupon_cantidad*(-1),'%';
		subtotal_x_cantidad <- (precio_num*cantidad)*((100-cupon_cantidad)/100);
		escribir "subtotal con descuento x cantidad es : ",'$', subtotal_x_cantidad;
		escribir "su % descuento por su cupon de descuento es de : ", valor_cupon*(-1),'%';
		subtotal_x_cupon <- subtotal_x_cantidad*((100-valor_cupon)/100);
		escribir "subtotal con descuento de cupon: ",'$',subtotal_x_cupon;
		escribir "el % de cargo por peso de productos es: ",cargo_peso,'%';
		subtotal_x_peso <- subtotal_x_cupon*((100+cargo_peso)/100);
		escribir "el subtotal con cargo de peso para envio: ",'$', subtotal_x_peso;
		escribir "direccion y region de envio: ",Mayusculas(direccion), ', ',region_texto;
		escribir "% de recargo  por lejania: ", cargo_lejania,'%';
		subtotal_cargo_lejania <- subtotal_x_peso*((100+cargo_lejania)/100);
		subtotal_cargo_lejania <- redon(subtotal_cargo_lejania);
		escribir "subtotal con cargo lejania: ",'$',subtotal_cargo_lejania;
		impuestos <- 19;
		escribir "impuesto IVA: ",impuestos,'%';
		total_pagar <- subtotal_cargo_lejania*((100+impuestos)/100);
		escribir "total a pagar: ','$',total_pagar;
		
		
FinProceso
