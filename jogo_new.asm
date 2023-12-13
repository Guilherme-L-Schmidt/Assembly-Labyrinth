pixel: var #1

offsetX: var #1
offsetY: var #1
offsetZ: var #1

color1: var #1
color2: var #1

cbrown: var #1
static cbrown, #256

cblue: var #1
static cblue, #1024

teal: var #1
static teal, #1536

mapSize: var #1
static mapSize, #5

map: var #25
static map + #0, #0
static map + #1, #0
static map + #2, #0
static map + #3, #0
static map + #4, #0
static map + #5, #1
static map + #6, #1
static map + #7, #1
static map + #8, #0
static map + #9, #0
static map + #10, #1
static map + #11, #1
static map + #12, #1
static map + #13, #0
static map + #14, #0
static map + #15, #0
static map + #16, #0
static map + #17, #1
static map + #18, #0
static map + #19, #0
static map + #20, #0
static map + #21, #0
static map + #22, #1
static map + #23, #0
static map + #24, #0

pos: var #1
direction: var #1

viewDist: var #1
static viewDist, #13

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
static squareBottom + #0, #100
static squareBottom + #1, #0
static squareBottom + #2, #100
static squareBottom + #3, #0
static squareBottom + #4, #0
static squareBottom + #5, #100
static squareBottom + #6, #0
static squareBottom + #7, #0
static squareBottom + #8, #0
static squareBottom + #9, #100
static squareBottom + #10, #0
static squareBottom + #11, #0

screen: var #1200

jmp main

main:
	loadn r0, #22
	store pos, r0
	loadn r0, #5
	not r0, r0
	inc r0
	store direction, r0

	load r0, cblue
	store color1, r0
	load r0, teal
	store color2, r0

	call BlankScreen

	call RenderLabyrinth
	
	call PrintScreen

	halt

RenderLabyrinth:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r6
	push r7

	load r0, pos
	load r1, direction
	loadn r2, #25
	loadn r4, #0
	loadn r5, #0
	
	; checks positions in front
	add r0, r0, r1 ; advances one position
	cmp r0, r5
	jle RenderLabyrinthLoop 
	cmp r0, r2
	jeg RenderLabyrinthLoop ; checks uper and lower limits
	loadn r2, #5
	mod r3, r0, r2
	cmp r3, r1
	jeq RenderLabyrinthLoop ; checks if it is going through the right side
	mod r3, r0, r2
	sub r3, r3, r1
	cmp r3, r2
	jeq RenderLabyrinthLoop ; checks if it is going through the left side
	inc r4

	loadn r2, #25
	add r0, r0, r1 ; advances one more position
	cmp r0, r5
	jle RenderLabyrinthLoop 
	cmp r0, r2
	jeg RenderLabyrinthLoop ; checks uper and lower limits
	loadn r2, #5
	mod r3, r0, r2
	cmp r3, r1
	jeq RenderLabyrinthLoop ; checks if it is going through the right side
	mod r3, r0, r2
	sub r3, r3, r1
	cmp r3, r2
	jeq RenderLabyrinthLoop ; checks if it is going through the left side
	inc r4

	RenderLabyrinthLoop:
		loadn r7, #50
		not r7, r7
		inc r7
		loadn r6, #100
		mul r6, r6, r4
		add r7, r7, r6
		store offsetZ, r7
		loadn r7, #40
		not r7, r7
		inc r7
		store offsetY, r7
		loadn r7, #0
		store offsetX, r7 ; stores offsets for consecutive prints

		loadn r7, #luz
		inc r7
		add r7, r7, r4
		loadi r7, r7
		store pixel, r7 ; choses lighting to be used

		load r0, pos
		mul r7, r4, r1
		add r0, r0, r7 ; recalculates position in matrix

		call RenderBlockPosition ; renders chosen block and restarts the loop with the previous one
		dec r4
		cmp r4, r5
		jeg RenderLabyrinthLoop

	pop r7
	pop r6
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0

	rts

RenderBlockPosition: ; receives position in r0 and direction in r1
	push r3
	push r4
	push r5
	push r6

	call RenderCeiling
	call RenderGround ; always render ceiling and ground



	pop r6
	pop r5
	pop r4
	pop r3

	rts

RenderRightWall:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r6
	push r7

	; changes color
	load r3, color1
	load r4, pixel
	add r3, r3, r4
	store pixel, r3

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

	store offsetX, r0 ; returns offset to normal
	store pixel, r4 ; returns color to normal

	pop r7
	pop r6
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0

	rts

RenderLeftWall:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r6
	push r7

	; changes color
	load r3, color1
	load r4, pixel
	add r3, r3, r4
	store pixel, r3

	; right side
	load r0, offsetX
	loadn r1, #50
	sub r2, r0, r1
	store offsetX, r2

	loadn r6, #squareSide
	loadn r7, #square
	call CopySquareReversed

	call ApplyOffset
	call RenderSquare

	store offsetX, r0 ; returns offset to normal
	store pixel, r4 ; returns color to normal

	pop r7
	pop r6
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0

	rts

RenderGround:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r6
	push r7

	load r4, pixel
	load r3, cbrown ; changes color
	add r3, r3, r4
	store pixel, r3

	; ground

	load r0, offsetX
	loadn r1, #50
	sub r2, r0, r1
	store offsetX, r2

	loadn r6, #squareBottom
	loadn r7, #square
	call CopySquare

	call ApplyOffset
	call RenderSquare

	store offsetX, r0 ; returns offset to normal
	store pixel, r4 ; returns color to normal

	pop r7
	pop r6
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0

	rts

RenderCeiling:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7

	load r4, pixel
	load r3, cbrown ; changes color
	add r3, r3, r4
	store pixel, r3

	; ceiling

	load r0, offsetX
	loadn r1, #50
	sub r2, r0, r1
	store offsetX, r2

	load r5, offsetY
	loadn r1, #40
	store offsetY, r1

	loadn r6, #squareBottom
	loadn r7, #square
	call CopySquareReversed

	call ApplyOffset
	call RenderSquare

	store offsetX, r0 ; returns offset to normal
	store offsetY, r5 ; returns offset to normal

	store pixel, r4 ; returns color to normal

	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0

	rts

RenderFront:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7

	; right side
	load r0, offsetX
	loadn r1, #50
	sub r2, r0, r1
	store offsetX, r2
	
	; changes color
	load r3, color2
	load r4, pixel
	add r3, r3, r4
	store pixel, r3

	; front
	loadn r6, #squareFront
	loadn r7, #square
	call CopySquareReversed

	call ApplyOffset
	call RenderSquare


	store offsetX, r0 ; returns offset to normal
	store pixel, r4 ; returns color to normal

	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
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