Algoritmo cajero_automatico
	Definir opmenu, opcionmenu, contadorErrores, maximoErrores Como Entero;
	Definir num1, num2 Como Real;
	
	Definir user0, user1, user2, pass0, pass1, pass2 Como Caracter;
	
	Definir saldo, abono como numero
	saldo = 0
	
	definir salir Como Logico

	
	user1 = "12345";
	pass1 = "12345";
	contadorErrores = 0;
	maximoErrores = 3;
	Escribir "----------------------------";
	Escribir " BIENVENIDO A LA APP CAJERO ";
	Escribir "----------------------------";
	
	Repetir
		Escribir "Ingresar RUN cliente: ";
		Leer user0;
		Escribir "Ingrese contraseña ";
		Escribir ""
		Leer pass0;
		
		Si user0 = user1 Entonces
			//valido la clave
			Si pass0 = pass1 Entonces
				Escribir "----------------------------------- ";
				Escribir "      Ingreso a la app exitoso      ";
				Escribir "----------------------------------- ";
				contadorErrores <- 0;
				Repetir
					opcionMenu = menuPrincipal;
					Segun opcionmenu Hacer
						1:
							Escribir "---------------------";
							Escribir "-  Consultar saldo  -";
							Escribir "---------------------";
							Escribir "Su saldo es de $" saldo;
							Escribir "-"
							salir = falso
							
						2:
							Escribir "---------------------";
							Escribir "-   Abonar dinero    -";
							Escribir "---------------------";
							Escribir "Ingrese la cantidad a abonar:";
							Leer abono 
							saldo = abonar(abono, saldo)
							salir = falso
							
						3:
							Escribir "---------------------";
							Escribir "-   Girar dinero    -";
							Escribir "---------------------";
							Escribir "Ingrese la cantidad a girar:";
							Leer giro;
							saldo = girar(giro, saldo)
							salir = falso
							
						4:
							Escribir "---------------------";
							Escribir "-   Cambio de PIN   -";
							Escribir "---------------------";
							Escribir "Ingrese su nuevo PIN:";
							Escribir "intento 1"
							Leer nuevoPIN;
							salir = verificaCambio(nuevoPIN, pass0)
							si salir = Falso
								pass0 = nuevoPIN
							FinSi
							
						5:
							Escribir "Salir...";
						De Otro Modo:
							Escribir "ERROR 1: Ingrese una opcion valida del 1 al 5.";
					Fin Segun
				Hasta Que opmenu = 5 o salir = verdadero;
			SiNo
				//password error 3
				contadorErrores <- contadorErrores + 1;
				//Escribir "ERROR 3: (pass) Usuario o contraseña con error :(";
				Escribir "ERROR 3: Usuario o contraseña con error :(";
			FinSi
		SiNo
			//username error 4
			//Escribir "ERROR 3: (user) Usuario o contraseña con error :(";
			Escribir "ERROR 3: Usuario o contraseña con error :(";
		FinSi
		//Escribir "Cantidad de errores de PASS acumulados: ", contadorErrores;
		Si contadorErrores = maximoErrores Entonces
			Escribir "ERROR 5: Su usuario quedo bloqueado...";
		FinSi
	Hasta Que contadorErrores = maximoErrores
	
	Escribir "Fin del programa";
FinAlgoritmo

//FUNCION PARA EL MENU
funcion opcionMenu = menuPrincipal
	Escribir "----------------";
 	Escribir "MENU CALCULADORA";
	Escribir "----------------";
	Escribir "1 - Consultar saldo";
	Escribir "2 - Abonar dinero";
	Escribir "3 - Girar dinero";
	Escribir "4 - Cambiar PIN";
	Escribir "5) Logout";
	Escribir "Ingrese una de las opciones del menu: ";
	Leer opcionmenu;
FinFuncion

//FUNCION PARA ABONAR //FUNCION PARA ABONAR //FUNCION PARA ABONAR 
Funcion saldo = abonar(abono, saldo)
	mientras abono <1 Hacer
		escribir "Abono invalido, ingrese cifra correcta"
		leer abono
	FinMientras
	saldo = abono + saldo;
	Escribir "Su nuevo saldo es de: " saldo
FinFuncion

//FUNCION PARA GIRAR //FUNCION PARA GIRAR //FUNCION PARA GIRAR 
Funcion saldo = girar(giro,saldo)
	mientras giro <1 | giro > saldo Hacer
		escribir "Giro inválido, ingrese cifra correcta"
		leer giro
	FinMientras
	saldo = saldo - giro;
	Escribir "Su nuevo saldo es de: " saldo
FinFuncion

//FUNCION CAMBIO PIN //CAMBIO PIN //CAMBIO PIN //CAMBIO PIN 
funcion salir = verificaCambio (nuevoPin, pass0)
	si nuevoPIN = pass0
		escribir "La contraseña no debe ser igual, intente nuevamente"
		leer nuevoPIN
		escribir "intento 2"
		si nuevoPIN = pass0
			escribir "La contraseña no debe ser igual, saliendo del programa"
		FinSi
		salir = verdadero
	FinSi
	
	si nuevoPIN <> pass0
		nuevoPIN1 = nuevoPIN
		escribir "Confirme su nuevo PIN"
		Escribir "intento 2"
		leer nuevoPIN
		si nuevoPIN1 = nuevoPIN
			escribir "Cambio de PIN exitoso"
			salir = falso
			pass0 = nuevoPIN
		sino 
			escribir "El cambio de contraseña no coincide, saliendo del programa"
			salir = verdadero
		FinSi
	FinSi
FinFuncion

