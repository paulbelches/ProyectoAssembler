.text
.align		2
.global		main

/* Universidad del Valle de Guatemala
Organizacion de Computadoras y Assembler
Fecha: 14/07/18
Rodrigo Morales - 17027
Paul Belches - 17088 */

main:

	@utilizando la biblioteca GPIO (gpio0_2.s)
	bl GetGpioAddress @solo se llama una vez
	
	@GPIO para escritura (salida) puerto 21
	mov r0,#21
	mov r1,#1
	bl SetGpioFunction
	
	@GPIO para escritura (escritura) puerto 20
	mov r0,#20
	mov r1,#0
	bl SetGpioFunction
	
	@GPIO para escritura (escritura) puerto 16
	mov r0,#16
	mov r1,#0
	bl SetGpioFunction

	mov r0,#21	@instrucciones para encender GPIO 21
	mov r1,#0
	bl SetGpio

	@@ Cargar el contador
	ldr r8, = Contador
	ldr r8,[r8]
ingreso:
	@@ Mensaje de bienvenida
	ldr r0,= MensajeBienvenida
	bl puts
	@@ Se pide la opcion del menu
	ldr r0,= MEntrada
	bl puts
	ldr r0,= Entrada
	ldr r1,= Ingreso
	bl scanf

	@@ Revisar que sean numeros lo que se ingreso
	cmp r0,#0
	beq Num_Mal
	ldr r1,=Ingreso
	ldr r1,[r1]
	cmp r1,#1 @@verifica el ingreso
	beq botones
	/*Verifica si es por software*/
	cmp r1,#2
	beq software
	bne Num_Mal
software:	
	ldr r0,= MensajeSoftware
	bl puts
	ldr r0,= Entrada
	ldr r1,= Ingreso
	bl scanf
	@@ Revisar que sean numeros lo que se ingreso
	cmp r0,#0
	beq Num_Mal
	ldr r1,=Ingreso
	ldr r1,[r1]
	mov r0,r1
	b motor
botones:
loop:
	/* Se lee el puerto 20 */
	mov r0,#20
	bl GetGpio


	/* Si el boton se apacha, procede con el codigo del programa */
	@Si el boton esta en alto (1), fue presionado y valida el contador
	teq r0,#0
	addne r8,#1
	
	/* Se lee el puerto 21 */
	mov r0,#21
	bl GetGpio


	/* Si el boton se apacha, procede con el codigo del programa */
	@Si el boton esta en alto (1), fue presionado y valida el contador
	teq r0,#0
	addne r8,#-1

	mov r0,r8
	b motor
	/* De no ser asi, corre en un ciclo infinito */
	b loop
motor:
	mov r9,r0
	//Enciende el pulso
	mov r0, #21
	mov r1,#1
	bl SetGpio 
	mov r0,r9
	bl better_sleep
//Apaga el pulso
	mov r0, #21
	mov r1,#0
	bl SetGpio 

fin:	
	@@ r0, r3 <- 0 como sennal de no error al sistema operativo
	mov	r3, #0
	mov	r0, r3
	@ colocar registro de enlace para desactivar la pila y retorna al SO
	ldmfd	sp!, {lr}
	bx	lr
Num_Mal:
	ldr r0,= mal
	bl puts
	bl getchar
	b ingreso
.data
.align 2
.global myloc
delayReg:.word 465000 
delayRegQuarter: .word 110000
myloc: .word 0
MEntrada:
	.asciz "Ingreso la opcion:"
mal:
	.asciz "Ingreso invalido"
Entrada:
	.asciz "%d"
Ingreso:
	.word 0
Contador:
	.word 0
MensajeBienvenida:
	.asciz "Ingrese el numero de la opcion que desea:  \n1. Manejar el motor por botones  \n2.Ingresar la posicion del motor \n3.Salir"
MensajeSoftware:
	.asciz "Ingrese el numero de la movimiento que desea que desea"
