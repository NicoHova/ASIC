pkg load control;
pkg load signal;

function menuIngresarFuncion
	printf("1) Ingresar función de transferencia mediante su cociente de polinomios.\n")
	printf("2) Ingresar función de transferencia mediante sus ceros, polos y ganancia.\n\n")
endfunction

function menuPrincipal
  	printf("1) Obtener la expresión de la función transferencia.\n")
  	printf("2) Indicar Polos.\n")
  	printf("3) Indicar Ceros.\n")
  	printf("4) Marcar ganancia de la función.\n")
  	printf("5) Obtener expresión con sus polos, ceros y ganancia.\n")
  	printf("6) Mostrar gráficamente la distribución de polos y ceros.\n")
  	printf("7) Indicar estabilidad del sistema.\n")
  	printf("8) Obtener todas las características de la función.\n")
endfunction

function imprimirZPK(z,p,k)
  	printf("Cero: %d\n", z)
	printf("Polo: %d\n", p)
	printf("Ganancia: %d\n", k)
endfunction

function menuFinalizacion
	printf("1) Ingresar otra función.\n")
	printf("2) Finalizar.\n")
endfunction

function esEstable(func)
	estabilidad = isstable(func);

	if(estabilidad == 1)
		printf("El sistema es estable\n\n")
	else 
		printf("El sistema no es estable\n\n")
	endif
endfunction


#COMIENZO DEL PROGRAMA--------------------------------------------------------------------

while (1) #Empezar asi ya es feo guacho
	menuIngresarFuncion

	opcion = input("Elija una opción.\n");

	switch (opcion)
		case 1
	   		numerador = input("Ingrese los coeficientes del numerador entre corchetes.\n");
	   		denominador = input("Ingrese los coeficientes del denominador entre corchetes.\n");
	   		FT = tf([numerador],[denominador]);
	   		[ceros,polos,ganancia] = tf2zp (FT);
	      		printf("\n")
		case 2
	   		ceros = input("Ingrese los ceros de la funcion transferencia entre corchetes\n");
	   		polos = input("Ingrese los polos de la funcion transferencia entre corchetes\n");
	   		ganancia = input("Ingrese la ganancia de la funcion transferencia\n");
	   		FT = zpk(ceros,polos,ganancia);
	   		printf("\n")
		otherwise
	    		printf("La opción ingresada no es válida\n")
	    		break
	endswitch

	menuPrincipal

	op = input("Elija una opción.\n");

	switch (op)
		case 1
	   		FT
		case 2
			ceros
	   	case 3
	   		polos
		case 4
			ganancia
		case 5
      			imprimirZPK(ceros,polos,ganancia)
		case 6
			pzmap(FT)
	  	case 7
	  		esEstable(FT)
	  	case 8
	  		printf("Expresion de la funcion transferencia: \n")
	  		FT
	  		imprimirZPK(ceros,polos,ganancia)
        printf("\n")
	  		pzmap(FT)
	  		esEstable(FT)
		otherwise
	    		printf("La opción ingresada no es válida.\n")
	    		break
	endswitch

	menuFinalizacion

	opfin = input("Elija una opción.\n");

	if (opfin == 2)
		break
	endif
endwhile

printf("El programa ha finalizado felizmente\n")

#FIN DEL PROGRAMA--------------------------------------------------------------------
