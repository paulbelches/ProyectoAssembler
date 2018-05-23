.global motor

@@reciben en r0: la poscion actual
motor:
	push {lr}
	@@comparar con las posibles posiciones
	cmp r0,#0 
	beq posicionCero
	cmp r0, #1 
	beq posicionUno
	cmpne r0, #2   
	beq	posicionDos
	cmpne r0, #3  
	beq	posicionTres
	cmpne r0, #4  
	beq posicionCuatro
	cmpne r0, #5   
	beq posicionCinco
	cmpne r0, #6 
	beq posicionSeis 

	posicionCero:
		mov r6,#50
		servoFix1:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 20
				mov r0,#21
				mov r1,#1
				bl SetGpio
			
				ldr r0,=encendido0
				ldr r0,[r0]
				bl better_sleep

			@apagar GPIO 20
				mov r0,#21
				mov r1,#0
				bl SetGpio

				ldr r0,=apagado0
				ldr r0,[r0]
				bl better_sleep
			pop {r6}
		b servoFix1
	posicionUno:
		mov r6,#50
		servoFix2:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 20
				mov r0,#21
				mov r1,#1
				bl SetGpio
			
				ldr r0,=encendido30
				ldr r0,[r0]
				bl better_sleep

			@apagar GPIO 20
				mov r0,#21
				mov r1,#0
				bl SetGpio

				ldr r0,=apagado30
				ldr r0,[r0]
				bl better_sleep
			pop {r6}
		b servoFix2


	posicionDos:
		mov r6,#50
		servoFix3:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 20
				mov r0,#21
				mov r1,#1
				bl SetGpio
			
				ldr r0,=encendido60
				ldr r0,[r0]
				bl better_sleep

			@apagar GPIO 20
				mov r0,#21
				mov r1,#0
				bl SetGpio

				ldr r0,=apagado60
				ldr r0,[r0]
				bl better_sleep
			pop {r6}
		b servoFix3

	posicionTres:
		mov r6,#50
		servoFix4:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 20
				mov r0,#21
				mov r1,#1
				bl SetGpio
			
				ldr r0,=encendido90
				ldr r0,[r0]
				bl better_sleep

			@apagar GPIO 20
				mov r0,#21
				mov r1,#0
				bl SetGpio

				ldr r0,=apagado90
				ldr r0,[r0]
				bl better_sleep
			pop {r6}
		b servoFix4
	posicionCuatro:
		mov r6,#50
		servoFix5:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 20
				mov r0,#21
				mov r1,#1
				bl SetGpio
			
				ldr r0,=encendido120
				ldr r0,[r0]
				bl better_sleep

			@apagar GPIO 20
				mov r0,#21
				mov r1,#0
				bl SetGpio

				ldr r0,=apagado120
				ldr r0,[r0]
				bl better_sleep
			pop {r6}
		b servoFix5
	posicionCinco:
		mov r6,#50
		servoFix6:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 20
				mov r0,#21
				mov r1,#1
				bl SetGpio
			
				ldr r0,=encendido150
				ldr r0,[r0]
				bl better_sleep

			@apagar GPIO 20
				mov r0,#21
				mov r1,#0
				bl SetGpio

				ldr r0,=apagado150
				ldr r0,[r0]
				bl better_sleep
			pop {r6}
		b servoFix6
	posicionSeis:
		mov r6,#50
		servoFix7:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 20
				mov r0,#21
				mov r1,#1
				bl SetGpio
			
				ldr r0,=encendido180
				ldr r0,[r0]
				bl better_sleep

			@apagar GPIO 20
				mov r0,#21
				mov r1,#0
				bl SetGpio

				ldr r0,=apagado180
				ldr r0,[r0]
				bl better_sleep
			pop {r6}
		b servoFix7


salida:
	pop {pc}
	@datos
.data
.align 2
	

@@----TIMER PARA GRADOS----	

	@@para 0 grados
	apagado0: .word 19565000
	encendido0: .word 435000
	@@para 30 grados
	apagado30: .word 19400000
	encendido30: .word 600000
	@@para 60 grados
	apagado60: .word 19205000
	encendido60: .word 795000
	@@para 90 grados
	apagado90: .word 18761000
	encendido90: .word 1239000
	@@para 120 grados
	apagado120: .word 18500000
	encendido120: .word 1500000
	@@para 150 grados
	apagado150: .word 18125000
	encendido150: .word 1875000
	@@para 180 grados
	apagado180: .word 17750000
	encendido180: .word 2250000

