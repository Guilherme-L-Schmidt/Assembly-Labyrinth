pixel: var #1

offsetX: var #1
offsetY: var #1
offsetZ: var #1

viewDist: var #1
static viewDist, #12

width: var #1
static width, #40

height: var #1
static height, #30

luz: var #4
static luz + #0, #123
static luz + #1, #124
static luz + #2, #125
static luz + #3, #126

position: var #3
products: var #12
; square: var #12

square: var #12

squareSide: var #12
static squareSide + #0, #0
static squareSide + #1, #80
static squareSide + #2, #0
static squareSide + #3, #0
static squareSide + #4, #80
static squareSide + #5, #100
static squareSide + #6, #0
static squareSide + #7, #0
static squareSide + #8, #100
static squareSide + #9, #0
static squareSide + #10, #0
static squareSide + #11, #0

squareFront: var #12
static squareFront + #0, #100
static squareFront + #1, #80
static squareFront + #2, #100
static squareFront + #3, #100
static squareFront + #4, #0
static squareFront + #5, #100
static squareFront + #6, #0
static squareFront + #7, #0
static squareFront + #8, #100
static squareFront + #9, #0
static squareFront + #10, #80
static squareFront + #11, #100

squareBottom: var #12
static squareFront + #0, #100
static squareFront + #1, #0
static squareFront + #2, #100
static squareFront + #3, #100
static squareFront + #4, #0
static squareFront + #5, #0
static squareFront + #6, #0
static squareFront + #7, #0
static squareFront + #8, #0
static squareFront + #9, #0
static squareFront + #10, #0
static squareFront + #11, #100

screen: var #1200

jmp main

main:
	load r0, luz
	store pixel, r0

	loadn r0, #50
	not r0, r0
	inc r0
	store offsetZ, r0
	loadn r0, #40
	not r0, r0
	inc r0
	store offsetY, r0
	loadn r0, #0
	not r0, r0
	inc r0
	store offsetX, r0

	call BlankScreen

	call RenderCorridor1
	
	call PrintScreen

	halt

RenderCorridor1:
	push r0
	push r1
	push r2
	push r6
	push r7

	; right side
	load r0, offsetX
	loadn r1, #50
	add r2, r0, r1
	store offsetX, r2

	loadn r6, #squareSide
	loadn r7, #square
	call CopySquare

	call ApplyOffset
	call RenderSquare

	; left side
	sub r2, r0, r1
	store offsetX, r2

	loadn r6, #squareSide
	loadn r7, #square
	call CopySquareReversed

	call ApplyOffset
	call RenderSquare

	; ground

	pop r7
	pop r6
	pop r2
	pop r1
	pop r0

	rts

CopySquare: ; receives the static square at r6 and the square to render at r7
	push r0
	push r1
	loadn r0, #12

	LoopCopySquare:
		loadi r1, r6
		storei r7, r1
		inc r6
		inc r7
		dec r0
		jnz LoopCopySquare

	pop r1
	pop r0

	rts

CopySquareReversed: ; receives the static square at r6 and the square to render at r7
	push r0
	push r1
	push r2
	push r3

	loadn r2, #9
	add r7, r7, r2
	loadn r2, #6
	loadn r3, #4
	LoopOverCopySquareReversed:
		loadn r0, #3
		LoopCopySquareReversed:
			loadi r1, r6
			storei r7, r1
			inc r6
			inc r7
			dec r0
			jnz LoopCopySquareReversed
		sub r7, r7, r2
		dec r3
		jnz LoopOverCopySquareReversed
	
	pop r3
	pop r2
	pop r1
	pop r0

	rts

ApplyOffset: ; applies offset on the square
	push r0
	push r1
	push r2
	push r3
	push r4

	loadn r0, #square ; stores memory position in r0
	load r1, offsetX ; loads each offset
	load r2, offsetY 
	load r3, offsetZ 

	loadi r4, r0 ; applies x offset
	add r4, r4, r1
	storei r0, r4
	inc r0

	loadi r4, r0 ; applies y offset
	add r4, r4, r2
	storei r0, r4
	inc r0

	loadi r4, r0 ; applies z offset
	add r4, r4, r3
	storei r0, r4
	inc r0

	loadi r4, r0 ; applies x offset
	add r4, r4, r1
	storei r0, r4
	inc r0

	loadi r4, r0 ; applies y offset
	add r4, r4, r2
	storei r0, r4
	inc r0

	loadi r4, r0 ; applies z offset
	add r4, r4, r3
	storei r0, r4
	inc r0

	loadi r4, r0 ; applies x offset
	add r4, r4, r1
	storei r0, r4
	inc r0

	loadi r4, r0 ; applies y offset
	add r4, r4, r2
	storei r0, r4
	inc r0

	loadi r4, r0 ; applies z offset
	add r4, r4, r3
	storei r0, r4
	inc r0

	loadi r4, r0 ; applies x offset
	add r4, r4, r1
	storei r0, r4
	inc r0

	loadi r4, r0 ; applies y offset
	add r4, r4, r2
	storei r0, r4
	inc r0

	loadi r4, r0 ; applies z offset
	add r4, r4, r3
	storei r0, r4
	inc r0

	pop r4
	pop r3
	pop r2
	pop r1
	pop r0

	rts

BlankScreen: ; fills the screen with blank spaces
	push r0
	push r1
	push r2
	
	loadn r0, #1200
	loadn r1, #screen
	loadn r2, #0
	add r1, r1, r0
	
	BlankScreenLoop:
		dec r1
		dec r0
		storei r1, r2
		jnz BlankScreenLoop

	pop r2
	pop r1
	pop r0

	rts

PrintScreen:
	push r0
	push r1
	push r2
	
	loadn r0, #1200
	loadn r1, #screen
	add r1, r1, r0
	
	PrintScreenLoop:
		dec r1
		dec r0
		loadi r2, r1
		outchar r2, r0
		jnz PrintScreenLoop

	pop r2
	pop r1
	pop r0

	rts

RenderSquare: ; renders stored square with stored pixels
	push r0
	push r1
	push r2
	push r5
	push r6
	push r7

	loadn r5, #0
	call CalculateCrossesSquare

	load r2, viewDist ; passes over each screen postion checking if it should be printed
	loadn r7, #1199
	RenderSquareLoop:
		call ScreenToXY
		call CheckInsideSquare
		cmp r6, r5
		ceg PlacePixelScreen
		dec r7
		jnz RenderSquareLoop
	call ScreenToXY
	call CheckInsideSquare
	cmp r6, r5
	ceg PlacePixelScreen

	pop r7
	pop r6
	pop r5
	pop r2
	pop r1
	pop r0

	rts

PlacePixelScreen: ; places a pixel on screen position r7
	push r0
	push r1

	loadn r1, #screen
	add r1, r1, r7

	load r0, pixel
	storei r1, r0

	pop r1
	pop r0

	rts

ScreenToXY: ; converts screen coordinates at r7 to x at r0 and y at r1
	push r2
	push r3
	load r2, width
	loadn r3, #2

	mod r0, r7, r2
	div r1, r7, r2

	div r2, r2, r3
	sub r0, r0, r2
	
	load r2, height
	div r2, r2, r3
	sub r1, r1, r2
	not r1, r1
	inc r1

	pop r3
	pop r2
	
	rts

CheckInsideSquare: ; if inside puts positive value in r6, else negative
	push r3
	push r4
	push r5
	push r7

	loadn r7, #products ; loads first stored cross product
	loadi r3, r7
	inc r7
	loadi r4, r7
	inc r7
	loadi r5, r7
	inc r7

	call Dot ; calculates dot product between current position and cross product
	loadn r3, #0
	cmp r6, r3
	jle CheckInsideSquareEnd ; if negative, outside square

	loadi r3, r7 ; loads second stored cross product
	inc r7
	loadi r4, r7
	inc r7
	loadi r5, r7
	inc r7

	call Dot ; calculates dot product between current position and cross product
	loadn r3, #0
	cmp r6, r3
	jle CheckInsideSquareEnd ; if negative, outside square

	loadi r3, r7 ; loads third stored cross product
	inc r7
	loadi r4, r7
	inc r7
	loadi r5, r7
	inc r7

	call Dot ; calculates dot product between current position and cross product
	loadn r3, #0
	cmp r6, r3
	jle CheckInsideSquareEnd ; if negative, outside square

	loadi r3, r7 ; loads fourth stored cross product
	inc r7
	loadi r4, r7
	inc r7
	loadi r5, r7
	inc r7

	call Dot ; calculates dot product between current position and cross product
	loadn r3, #0
	cmp r6, r3
	jle CheckInsideSquareEnd ; if negative, outside square


	CheckInsideSquareEnd:
	pop r7
	pop r5
	pop r4
	pop r3

	rts

Cross: ; cross product algorithm
	; calcula multiplicacoes necessarias
	push r6
	push r7
	mul r6, r1, r5
	mul r7, r2, r4
	push r6
	push r7
	mul r6, r2, r3
	mul r7, r0, r5
	push r6
	push r7
	mul r6, r0, r4
	mul r7, r1, r3

	; subtrai resultado das multiplicacoes em pares
	sub r2, r6, r7

	loadn r7, #100 ; maracutaia para nao dar overflow
	div r2, r2, r7

	pop r7
	pop r6
	sub r1, r6, r7

	loadn r7, #100
	div r1, r1, r7

	pop r7
	pop r6
	sub r0, r6, r7

	loadn r7, #100
	div r0, r0, r7

	pop r7
	pop r6

	rts

Dot: ; dot product algorithm, returns in r6
	push r0
	push r1
	push r2

	mul r0, r0, r3
	mul r1, r1, r4
	mul r2, r2, r5
	add r6, r0, r1
	add r6, r6, r2

	pop r2
	pop r1
	pop r0

	rts

CalculateCrossesSquare: ; calculates the four cross products in a square
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7

	loadn r6, #square ; loads first two square vertices
	loadn r7, #products
	loadi r0, r6
	inc r6
	loadi r1, r6
	inc r6
	loadi r2, r6
	inc r6
	loadi r3, r6
	inc r6
	loadi r4, r6
	inc r6
	loadi r5, r6
	inc r6

	call Cross ; calculates first cross product
	
	storei r7, r0 ; stores calculated cross product
	inc r7
	storei r7, r1
	inc r7
	storei r7, r2
	inc r7

	mov r0, r3 ; moves second vertex to first position
	mov r1, r4
	mov r2, r5

	loadi r3, r6 ; loads next vertex on the new free position
	inc r6
	loadi r4, r6
	inc r6
	loadi r5, r6
	inc r6

	call Cross ; calculates second cross product
	
	storei r7, r0 ; stores calculated cross product
	inc r7
	storei r7, r1
	inc r7
	storei r7, r2
	inc r7

	mov r0, r3 ; moves second vertex to first position
	mov r1, r4
	mov r2, r5

	loadi r3, r6 ; loads next vertex on the new free position
	inc r6
	loadi r4, r6
	inc r6
	loadi r5, r6

	call Cross ; calculates third cross product

	storei r7, r0 ; stores calculated cross product
	inc r7
	storei r7, r1
	inc r7
	storei r7, r2
	inc r7

	mov r0, r3 ; moves second vertex to first position
	mov r1, r4
	mov r2, r5

	loadn r6, #square
	loadi r3, r6 ; loads first vertex on the new free position
	inc r6
	loadi r4, r6
	inc r6
	loadi r5, r6

	call Cross ; calculates fourth cross product
	
	storei r7, r0 ; stores calculated cross product
	inc r7
	storei r7, r1
	inc r7
	storei r7, r2
	inc r7

	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0

	rts