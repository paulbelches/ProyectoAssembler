.global motor

@@reciben en r0: la poscion deseada a donde se quiere mover el motor
motor:
	push {lr}
	@@Se chequea cual es la posicion que se desea
	cmp r0,#0 
	beq option6
	cmp r0, #1 
	beq option5
	cmpne r0, #2   
	beq	option4
	cmpne r0, #3  
	beq	option3
	cmpne r0, #4  
	beq option2
	cmpne r0, #5   
	beq option1
	cmpne r0, #6 
	beq option0 

	option0:
		@Contador para el tiempo que se mantiene el pulso
		mov r6,#50
		servoMove0:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 21
				mov r0,#21
				mov r1,#1
				bl SetGpio
			
				ldr r0,=on0
				ldr r0,[r0]
				bl gotoSleep

			@apagar GPIO 21
				mov r0,#21
				mov r1,#0
				bl SetGpio

				ldr r0,=off0
				ldr r0,[r0]
				bl gotoSleep
			pop {r6}
		b servoMove0
	option1:
		@Contador para el tiempo que se mantiene el pulso
		mov r6,#50
		servoMove1:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 21
				mov r0,#21
				mov r1,#1
				bl SetGpio
			
				ldr r0,=on30
				ldr r0,[r0]
				bl gotoSleep

			@apagar GPIO 21
				mov r0,#21
				mov r1,#0
				bl SetGpio

				ldr r0,=off30
				ldr r0,[r0]
				bl gotoSleep
			pop {r6}
		b servoMove1


	option2:
		@Contador para el tiempo que se mantiene el pulso
		mov r6,#50
		servoMove2:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 21
				mov r0,#21
				mov r1,#1
				bl SetGpio
			
				ldr r0,=on60
				ldr r0,[r0]
				bl gotoSleep

			@apagar GPIO 21
				mov r0,#21
				mov r1,#0
				bl SetGpio

				ldr r0,=off60
				ldr r0,[r0]
				bl gotoSleep
			pop {r6}
		b servoMove2

	option3:
		@Contador para el tiempo que se mantiene el pulso
		mov r6,#50
		servoMove3:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 21
				mov r0,#21
				mov r1,#1
				bl SetGpio
			
				ldr r0,=on90
				ldr r0,[r0]
				bl gotoSleep

			@apagar GPIO 21
				mov r0,#21
				mov r1,#0
				bl SetGpio

				ldr r0,=off90
				ldr r0,[r0]
				bl gotoSleep
			pop {r6}
		b servoMove3
	option4:
		mov r6,#50
		servoMove4:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 21
				mov r0,#21
				mov r1,#1
				bl SetGpio
			
				ldr r0,=on120
				ldr r0,[r0]
				bl gotoSleep

			@apagar GPIO 21
				mov r0,#21
				mov r1,#0
				bl SetGpio

				ldr r0,=off120
				ldr r0,[r0]
				bl gotoSleep
			pop {r6}
		b servoMove4
	option5:
		@Contador para el tiempo que se mantiene el pulso
		mov r6,#50
		servoMove5:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 21
				mov r0,#21
				mov r1,#1
				bl SetGpio
			
				ldr r0,=on150
				ldr r0,[r0]
				bl gotoSleep

			@apagar GPIO 21
				mov r0,#21
				mov r1,#0
				bl SetGpio

				ldr r0,=off150
				ldr r0,[r0]
				bl gotoSleep
			pop {r6}
		b servoMove5
	option6:
		@Contador para el tiempo que se mantiene el pulso
		mov r6,#50
		servoMove6:
			sub r6,r6,#1
			cmp r6,#0
			beq salida
			push {r6}
			@encender GPIO 21
				mov r0,#21
				mov r1,#1
				bl SetGpio
			
				ldr r0,=on180
				ldr r0,[r0]
				bl gotoSleep

			@apagar GPIO 21
				mov r0,#21
				mov r1,#0
				bl SetGpio

				ldr r0,=off180
				ldr r0,[r0]
				bl gotoSleep
			pop {r6}
		b servoMove6


salida:
	pop {pc}
	@datos
.data
.align 2
	

@@----Time for differents degrees----	

	@@ 0 Degrees
	off0: .word 19565000
	on0: .word 435000
	@@ 30 Degrees
	off30: .word 19400000
	on30: .word 600000
	@@ 60 Degrees
	off60: .word 19205000
	on60: .word 795000
	@@ 90 Degrees
	off90: .word 18761000
	on90: .word 1239000
	@@ 120 Degrees
	off120: .word 18500000
	on120: .word 1500000
	@@ 150 Degrees
	off150: .word 18125000
	on150: .word 1875000
	@@ 180 Degrees
	off180: .word 17750000
	on180: .word 2250000

