Algoritmo cajero_automatico
	
	Definir opmenu, opcionmenu Como Entero
	Definir user0, user1, pass0, pass1, pass2 Como Cadena	
	
	Definir saldo, abono Como Real
	
	saldo <- 0
	
	Definir salir, ingreso Como L�gico
	
	user1 <- '12345'
	pass1 <- '12345'
	
	Escribir '----------------------------'
	Escribir ' BIENVENIDO A LA APP CAJERO '
	Escribir '----------------------------'
	Repetir
		Escribir 'Ingresar RUN cliente: '
		Leer user0
			mientras user0 <> user1
				escribir "run incorrecto"
				Leer user0
			FinMientras
		
		Escribir 'Ingrese contrase�a '
		Leer pass0
		ingreso = verificaRUN(pass0, pass1)
		
		si ingreso = verdadero
			escribir "."
			esperar 1 Segundo
			escribir ".."
			esperar 1 Segundo
			escribir "..."
			esperar 1 Segundo
			Limpiar Pantalla
			
			Repetir //iteracion del menu
				opcionmenu <- menuPrincipal
				Seg�n opcionmenu Hacer
					1:
						Escribir '---------------------'
						Escribir '-  Consultar saldo  -'
						Escribir '---------------------'
						Escribir 'Su saldo es de $', saldo
						Escribir '-'
						salir <- falso
					2:
						Escribir '---------------------'
						Escribir '-   Abonar dinero    -'
						Escribir '---------------------'
						Escribir 'Ingrese la cantidad a abonar:'
						Leer abono
						saldo <- abonar(abono,saldo)
						salir <- falso
					3:
						Escribir '---------------------'
						Escribir '-   Girar dinero    -'
						Escribir '---------------------'
						Escribir 'Ingrese la cantidad a girar:'
						Leer giro
						saldo <- girar(giro,saldo)
						salir <- falso
					4:
						Escribir '---------------------'
						Escribir '-   Cambio de PIN   -'
						Escribir '---------------------'
						escribir "tiene dos intentos"
						escribir "escriba su contrase�a actual"
						leer pass0
						escribir "escriba la nueva contrase�a"
						leer nuevoPIN
						escribir "confirme la nueva contrase�a"
						leer nuevoPIN1
						salir <- verificaCambio(pass0, pass1,nuevoPIN, nuevoPIN1)
					
						Si salir=falso Entonces
							pass1 <- nuevoPIN
							//escribir "la contrase�a nueva es: " pass1 //VERIFICADOR DE ASIGNACION
						FinSi
							
					5:
						Escribir 'Salir...'
						salir = Verdadero
					De Otro Modo:
						Escribir 'ERROR 1: Ingrese una opcion valida del 1 al 5.'
				FinSeg�n
			Hasta Que opmenu=5 O salir=verdadero
			Escribir "Saliendo del menu"
			
		SiNo
			Escribir "Saliendo del programa."
		FinSi
		salir = Verdadero
		Escribir "Saliendo del programa.."
	Hasta Que salir = verdadero
	Escribir "Saliendo del programa..."
FinAlgoritmo


//FUNCION PARA VERIFICAR RUN 3 VECES AL LOGINN
funcion ingreso = verificaRUN(pass0, pass1)
	si pass1 = pass0 entonces
		escribir "Contrase�a correcta"
		ingreso = Verdadero
	SiNo
		escribir "Contrase�a incorrecta, intente nuevamente (1)" // intento 1
		leer pass2
		si pass1 = pass2
			escribir "Contrase�a correcta"
			ingreso = Verdadero
		sino 
			escribir "Contrase�a incorrecta, intente nuevamente (2)" // intento 2
			leer pass3
			si pass1 = pass3
				escribir "Contrase�a correcta"
				ingreso = Verdadero
			sino 
				escribir "Contrase�a incorrecta, (3)" // intento 3
				ingreso = Falso
			FinSi
		FinSi
	FinSi
FinFuncion


// FUNCION PARA EL MENU // FUNCION PARA EL MENU // FUNCION PARA EL MENU 
Funci�n opcionmenu <- menuPrincipal
	Escribir '----------------'
	Escribir 'MENU CAJERO'
	Escribir '----------------'
	Escribir '1 - Consultar saldo'
	Escribir '2 - Abonar dinero'
	Escribir '3 - Girar dinero'
	Escribir '4 - Cambiar PIN'
	Escribir '5 - Logout'
	Escribir 'Ingrese una de las opciones del menu: '
	Leer opcionmenu
FinFunci�n

// FUNCION PARA ABONAR //FUNCION PARA ABONAR //FUNCION PARA ABONAR 
Funci�n saldo <- abonar(abono,saldo)
	Mientras abono<1 Hacer
		Escribir 'Abono invalido, ingrese cifra correcta'
		Leer abono
	FinMientras
	saldo <- abono+saldo
	Escribir 'Su nuevo saldo es de: ', saldo
FinFunci�n

// FUNCION PARA GIRAR //FUNCION PARA GIRAR //FUNCION PARA GIRAR 
Funci�n saldo <- girar(giro,saldo)
	Mientras giro<1 O giro>saldo Hacer
		Escribir 'Giro inv�lido, ingrese cifra correcta'
		Leer giro
	FinMientras
	saldo <- saldo-giro
	Escribir 'Su nuevo saldo es de: ', saldo
FinFunci�n

// FUNCION CAMBIO PIN // FUNCION CAMBIO PIN // FUNCION CAMBIO PIN
Funci�n salir <- verificaCambio(pass0, pass1,nuevoPIN, nuevoPIN1)
	si pass0 = pass1 y nuevoPIN = nuevoPIN1 Entonces
		Escribir "Cambio de contrase�a exitoso"
		pass0 = nuevoPIN1
		salir = falso
	SiNo
		escribir "Cambio de contrase�a incorrecto, intente nuevamente (1)"
		escribir "escriba su contrase�a actual"
		leer pass0
		escribir "escriba la nueva contrase�a"
		leer nuevoPIN
		escribir "confirme la nueva contrase�a"
		leer nuevoPIN1
		si pass0 = pass1 y nuevoPIN = nuevoPIN1 Entonces
			Escribir "Cambio de contrase�a exitoso"
			pass0 = nuevoPIN1
			salir = falso
		SiNo
			escribir "No le quedan mas intentos, cerrando programa"
			salir = verdadero
		FinSi
	FinSi

FinFunci�n
