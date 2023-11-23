pixel: var #1
static pixel, #125

jmp main

main:
	loadn r0, #0
	loadn r1, #0
	loadn r2, #8
	loadn r3, #22
	
	call drawLine

	loadn r2, #22
	loadn r3, #8

	call drawLine

	loadn r0, #8
	loadn r1, #22
	loadn r2, #29
	loadn r3, #29

	call drawLine

	loadn r0, #22
	loadn r1, #8

	call drawLine

	loadn r0, #29
	loadn r1, #29
	loadn r2, #0
	loadn r3, #0

	call drawLine

	halt


drawLine: ; Implementacao do algoritmo de Bresenham
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5

	cmp r2, r0 ; bloco para calcular o modulo de r2 - r0
	jgr drawLineCheckGreaterX
		sub r4, r0, r2 ; calcula r0 - r2
		jmp drawLineCheckEndX
	drawLineCheckGreaterX:
		sub r4, r2, r0 ; calcula r2 - r0
	drawLineCheckEndX:

	cmp r3, r1 ; bloco para calcular o modulo de r3 - r1
	jgr drawLineCheckGreaterY
		sub r5, r1, r3 ; calcula r1 - r3
		jmp drawLineCheckEndY
	drawLineCheckGreaterY:
		sub r5, r3, r1 ; calcula r3 - r1
	drawLineCheckEndY:

	cmp r5, r4
	jgr drawLineIfHigh ; decide se desenha linha com coeficiente angular acima ou abaixo de 1
		cmp r2, r0
		jle drawLineLowCallReversed ; reverte o ponto inicial e final da linha se necessario
			call drawLineLow
			jmp drawLineEnd		
		drawLineLowCallReversed:
			push r2
			push r3
			mov r2, r0
			mov r3, r1
			pop r1
			pop r0
			call drawLineLow
			jmp drawLineEnd
	drawLineIfHigh:
		cmp r3, r1
		jle drawLineHighCallReversed ; reverte o ponto inicial e final da linha se necessario
			call drawLineHigh
			jmp drawLineEnd		
		drawLineHighCallReversed:
			push r2
			push r3
			mov r2, r0
			mov r3, r1
			pop r1
			pop r0
			call drawLineHigh
			jmp drawLineEnd

	drawLineEnd:
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts


drawLineHigh:
	push r0
	push r1
	push r2
	push r4
	push r5
	push r6
	push r7

	cmp r2, r0
	jle secondCheckHigh
		sub r4, r2, r0 ; r4 eh o dx
		loadn r2, #1
		jmp fimCheckHigh
	secondCheckHigh:
		sub r4, r0, r2 ; r4 eh o dx
		loadn r2, #1
		not r2, r2
		inc r2 ; define r2 como o step a ser adotado

	fimCheckHigh:

	add r4, r4, r4 ; duplica dx

	sub r5, r3, r1 ; r5 eh o dy
	not r5, r5
	inc r5 ; torna dy negativo
	
	add r6, r4, r5 ; calcula D

	add r5, r5, r5 ; dobra dy
	
	loopDrawLineHigh:
		loadn r7, #40
		mul r7, r1, r7 
		add r7, r0, r7 ; calcula posicao do cursor
		push r2
		load r2, pixel ; temporariamente da a r2 o valor do pixel
		outchar r2, r7 ; imprime caracter

		loadn r2, #0 ; usa entao r2 para comparacao
		
		; checa se D eh menor que 0
		cmp r6, r2
		pop r2
		jel nextDrawLineHigh
			add r0, r0, r2
			add r6, r6, r4
			add r6, r6, r5 ; recalcula D
			inc r1
			cmp r3, r1
			jne loopDrawLineHigh
			jmp endDrawHigh
		nextDrawLineHigh:
		add r6, r6, r4 ; recalcula D
		inc r1
		cmp r3, r1
		jne loopDrawLineHigh
		
	endDrawHigh:

	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r1
	pop r0
	
	rts

drawLineLow:
	push r0
	push r1
	push r2
	push r4
	push r5
	push r6
	push r7

	cmp r3, r0
	jle secondCheckLow
		sub r5, r3, r1 ; r5 eh o dy
		loadn r3, #1
		jmp fimCheckLow
	secondCheckLow:
		sub r5, r1, r3 ; r5 eh o dy
		loadn r3, #1
		not r3, r3
		inc r3 ; define r3 como o step a ser adotado

	fimCheckLow:

	add r5, r5, r5 ; duplica dy

	sub r4, r2, r0 ; r4 eh o dx
	not r4, r4
	inc r4 ; torna dx negativo
	
	add r6, r5, r4 ; calcula D

	add r4, r4, r4 ; dobra dx
	
	loopDrawLineLow:
		loadn r7, #40
		mul r7, r1, r7 
		add r7, r0, r7 ; calcula posicao do cursor
		push r3
		load r3, pixel ; temporariamente da a r3 o valor do pixel
		outchar r3, r7 ; imprime caracter

		loadn r3, #0 ; usa entao r3 para comparacao
		
		; checa se D eh menor que 0
		cmp r6, r3
		pop r3
		jel nextDrawLineLow
			add r1, r1, r3
			add r6, r6, r5
			add r6, r6, r4 ; recalcula D
			inc r0
			cmp r2, r0
			jne loopDrawLineLow
			jmp endDrawLow
		nextDrawLineLow:
		add r6, r6, r5 ; recalcula D
		inc r0
		cmp r2, r0
		jne loopDrawLineLow
		
	endDrawLow:

	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r1
	pop r0
	
	rts