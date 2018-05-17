.text
.align		2
.global		main
.type		main, %function
main:
	stmfd	sp!, {lr}
	@@ Mensaje de bienvenida
	ldr r0,= MensajeBienvenida
	bl puts
ingreso:
	@@ Mostrar Tablero
	ldr r0,= MEntrada
	bl puts
	ldr r0,= Entrada
	ldr r1,= Ingreso
	bl scanf
	@@ Revisar que sean numeros lo que se ingreso
	cmp r0,#0
	beq Num_Mal

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
MEntrada:
	.asciz "Ingreso la opcion:"
mal:
	.asciz "Ingreso invalido"
Entrada:
	.asciz "%d"
Ingreso:
	.word 0

MensajeBienvenida:
	.asciz "Ingrese el numero de la opcion que desea:  \n1. Manejar el  \n2. Para salir presione al mismo tiempo las teclas Ctrl y z\n3. Para redirse ingrese -1"
