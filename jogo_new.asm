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
static mapSize, #11

map: var #121
static map + #0, #1
static map + #1, #1
static map + #2, #1
static map + #3, #1
static map + #4, #0
static map + #5, #1
static map + #6, #1
static map + #7, #1
static map + #8, #1
static map + #9, #1
static map + #10, #1
static map + #11, #1
static map + #12, #0
static map + #13, #0
static map + #14, #0
static map + #15, #0
static map + #16, #1
static map + #17, #0
static map + #18, #0
static map + #19, #0
static map + #20, #0
static map + #21, #1
static map + #22, #1
static map + #23, #0
static map + #24, #1
static map + #25, #1
static map + #26, #1
static map + #27, #1
static map + #28, #0
static map + #29, #1
static map + #30, #1
static map + #31, #0
static map + #32, #1
static map + #33, #1
static map + #34, #1
static map + #35, #1
static map + #36, #0
static map + #37, #0
static map + #38, #0
static map + #39, #0
static map + #40, #1
static map + #41, #0
static map + #42, #0
static map + #43, #0
static map + #44, #0
static map + #45, #0
static map + #46, #1
static map + #47, #1
static map + #48, #1
static map + #49, #1
static map + #50, #1
static map + #51, #1
static map + #52, #1
static map + #53, #1
static map + #54, #1
static map + #55, #0
static map + #56, #1
static map + #57, #0
static map + #58, #0
static map + #59, #0
static map + #60, #1
static map + #61, #0
static map + #62, #0
static map + #63, #0
static map + #64, #1
static map + #65, #0
static map + #66, #0
static map + #67, #1
static map + #68, #1
static map + #69, #1
static map + #70, #1
static map + #71, #1
static map + #72, #1
static map + #73, #1
static map + #74, #1
static map + #75, #1
static map + #76, #0
static map + #77, #0
static map + #78, #0
static map + #79, #1
static map + #80, #0
static map + #81, #0
static map + #82, #0
static map + #83, #0
static map + #84, #0
static map + #85, #0
static map + #86, #0
static map + #87, #0
static map + #88, #0
static map + #89, #0
static map + #90, #1
static map + #91, #0
static map + #92, #1
static map + #93, #1
static map + #94, #1
static map + #95, #1
static map + #96, #1
static map + #97, #1
static map + #98, #0
static map + #99, #0
static map + #100, #0
static map + #101, #1
static map + #102, #1
static map + #103, #1
static map + #104, #0
static map + #105, #0
static map + #106, #1
static map + #107, #0
static map + #108, #0
static map + #109, #0
static map + #110, #0
static map + #111, #0
static map + #112, #0
static map + #113, #1
static map + #114, #1
static map + #115, #0
static map + #116, #0
static map + #117, #1
static map + #118, #0
static map + #119, #0
static map + #120, #0



pos: var #1
direction: var #1

posVictory: var #1
colorVictory1: var #1
static colorVictory1, #2816
colorVictory2: var #1
static colorVictory1, #1792

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
	loadn r0, #3
	store posVictory, r0

	loadn r0, #117
	store pos, r0

	loadn r0, #11
	not r0, r0
	inc r0
	store direction, r0

	load r0, cblue
	store color1, r0
	load r0, teal
	store color2, r0

	mainLoop:

		call BlankScreen

		call RenderLabyrinth
		
		call PrintScreen

		call CheckVictoryPos

		call PlayerControler

	jmp mainLoop

	halt

Victory:
	call printtelaScreen

	halt

CheckVictoryPos:
	push r0
	push r1

	load r0, pos
	load r1, posVictory
	cmp r0, r1
	jeq Victory

	pop r1
	pop r0

	rts

PlayerControler:
	push r0
	push r1
	push r2

	loadn r2, #255
	PlayerControlerLoop:

		inchar r0

		loadn r1, #119 ; moves with w
		cmp r0, r1
		ceq PMove

		loadn r1, #100
		cmp r0, r1
		ceq PRotateRight

		loadn r1, #97
		cmp r0, r1
		ceq PRotateLeft

		cmp r0, r2
		jne PlayerControlerLoop

	pop r2
	pop r1
	pop r0

	rts

PRotateLeft:
	push r0

	call PRotateRight
	load r0, direction
	not r0, r0
	inc r0
	store direction, r0

	pop r0

	rts

PRotateRight: ; rotates the player to the right
	push r1
	push r2
	push r3

	load r1, color1
	load r2, color2
	store color2, r1
	store color1, r2

	load r1, direction
	loadn r3, #0

	load r2, mapSize
	div r2, r1, r2
	cmp r2, r3
	jeq PRotateCheck
	load r2, mapSize
	div r1, r1, r2 ; if mapSize, only divides by mapSize and inverts
	not r1, r1
	inc r1
	jmp PRotateCheckEnd
	PRotateCheck:
		load r2, mapSize
		mul r1, r2, r1 ; if 1, evaluates the correct direction
	PRotateCheckEnd:

	store direction, r1

	pop r3
	pop r2
	pop r1

	rts

PMove: ; moves the player in the current direction
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r7

	load r0, pos
	load r1, direction
	load r2, mapSize
	mul r2, r2, r2
	loadn r4, #0
	loadn r5, #0

	; checks positions in front
	add r0, r0, r1 ; advances one position
	cmp r0, r5
	jle PMoveUndo 
	cmp r0, r2
	jeg PMoveUndo ; checks uper and lower limits
	load r2, mapSize
	mod r3, r0, r2
	loadn r7, #1
	sub r7, r1, r7
	cmp r3, r7
	jeq PMoveUndo ; checks if it is going through the right side
	mod r3, r0, r2
	mul r3, r3, r1
	load r7, mapSize
	dec r7
	not r7, r7
	inc r7
	cmp r3, r7
	jeq PMoveUndo ; checks if it is going through the left side
	loadn r3, #map
	add r3, r3, r0
	loadi r3, r3
	cmp r3, r5
	jeq PMoveUndo ; checks if the position is vacant
	jmp PMoveEnd

	PMoveUndo:
		sub r0, r0, r1

	PMoveEnd:

	store pos, r0

	pop r7
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0

	rts

RenderLabyrinth:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7

	load r0, pos
	load r1, direction
	load r2, mapSize
	mul r2, r2, r2
	loadn r4, #0
	loadn r5, #0
	
	; checks positions in front
	add r0, r0, r1 ; advances one position
	cmp r0, r5
	jle RenderLabyrinthLoop 
	cmp r0, r2
	jeg RenderLabyrinthLoop ; checks uper and lower limits
	load r2, mapSize
	mod r3, r0, r2
	loadn r7, #1
	sub r7, r1, r7
	cmp r3, r7
	jeq RenderLabyrinthLoop ; checks if it is going through the right side
	mod r3, r0, r2
	mul r3, r3, r1
	load r6, mapSize
	dec r6
	not r6, r6
	inc r6
	cmp r3, r6
	jeq RenderLabyrinthLoop ; checks if it is going through the left side
	inc r4

	load r2, mapSize
	mul r2, r2, r2
	add r0, r0, r1 ; advances one more position
	cmp r0, r5
	jle RenderLabyrinthLoop 
	cmp r0, r2
	jeg RenderLabyrinthLoop ; checks uper and lower limits
	load r2, mapSize
	mod r3, r0, r2
	loadn r7, #1
	sub r7, r1, r7
	cmp r3, r7
	jeq RenderLabyrinthLoop ; checks if it is going through the right side
	mod r3, r0, r2
	mul r3, r3, r1
	load r6, mapSize
	dec r6
	not r6, r6
	inc r6
	cmp r3, r6
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
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0

	rts

RenderBlockPosition: ; receives position in r0 and direction in r1
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7

	push r5 ; special check

	call RenderCeiling
	call RenderGround ; always render ceiling and ground

	; checks position in front
	load r2, mapSize
	mul r2, r2, r2
	loadn r5, #0
	add r7, r0, r1 ; advances one position
	cmp r7, r5
	jle RenderBlockPositionFirst
	cmp r7, r2
	jeg RenderBlockPositionFirst ; checks uper and lower limits
	load r2, mapSize
	mod r3, r7, r2
	loadn r6, #1
	sub r6, r1, r6
	cmp r3, r6
	jeq RenderBlockPositionFirst ; checks if it is going through the right side
	mod r3, r7, r2
	mul r3, r3, r1
	load r6, mapSize
	dec r6
	not r6, r6
	inc r6
	cmp r3, r6
	jeq RenderBlockPositionFirst ; checks if it is going through the left side
	loadn r6, #map
	add r6, r6, r7
	loadi r6, r6
	cmp r6, r5
	jeq RenderBlockPositionFirst ; checks if the position is vacant
	jmp RenderBlockPositionStartSecond

	RenderBlockPositionFirst: ; renders screen if one of the checks fail
		call RenderFront
	
	;breakp

	RenderBlockPositionStartSecond: ; calculates direction to the right
		load r2, mapSize
		div r2, r1, r2
		cmp r2, r5
		jeq RenderBlockPositionStartSecondCheck
		load r2, mapSize
		div r1, r1, r2 ; if 5, only divides by 5 and inverts
		not r1, r1
		inc r1
		jmp RenderBlockPositionStartSecondCheckEnd
		RenderBlockPositionStartSecondCheck:
			load r2, mapSize
			mul r1, r2, r1 ; if 1, evaluates the correct direction
		RenderBlockPositionStartSecondCheckEnd:
			; checks given position
			load r2, mapSize
			mul r2, r2, r2
			loadn r5, #0
			add r7, r0, r1 ; advances one position
			cmp r7, r5
			jle RenderBlockPositionSecond
			cmp r7, r2
			jeg RenderBlockPositionSecond ; checks uper and lower limits
			load r2, mapSize
			mod r3, r7, r2
			loadn r6, #1
			sub r6, r1, r6
			cmp r3, r6
			jeq RenderBlockPositionSecond ; checks if it is going through the right side
			mod r3, r7, r2
			mul r3, r3, r1
			load r6, mapSize
			dec r6
			not r6, r6
			inc r6
			cmp r3, r6
			jeq RenderBlockPositionSecond ; checks if it is going through the left side
			loadn r6, #map
			add r6, r6, r7
			loadi r6, r6
			cmp r6, r5
			jeq RenderBlockPositionSecond ; checks if the position is vacant

				pop r5
				loadn r6, #1
				cmp r5, r6
				push r5
				jeq RenderBlockPositionStartThird

				loadn r6, #128
				load r7, pixel
				mod r7, r7, r6
				loadn r6, #126
				cmp r6, r7
				jeq RenderBlockPositionStartThird ; uses light to check if it must continue

					; calls recursivelly to check further
					load r7, pixel
					inc r7
					store pixel, r7
					load r6, offsetX ; updates position, light and offset
					loadn r7, #100
					add r7, r6, r7
					store offsetX, r7
					mov r7, r0
					add r0, r0, r1
					push r1
					load r1, direction
					loadn r5, #1
					call RenderBlockPosition ; call new check
					loadn r5, #0
					pop r1
					mov r0, r7
					store offsetX, r6 ; returns position, light and offset to original values
					load r7, pixel
					dec r7
					store pixel, r7
				jmp RenderBlockPositionStartThird

	RenderBlockPositionSecond: ; renders screen if one of the checks fail
		call RenderRightWall

	RenderBlockPositionStartThird: ; checks wall to the left
		not r1, r1
		inc r1 ; inverts current direction

		; checks given position
		load r2, mapSize
		mul r2, r2, r2
		loadn r5, #0
		add r7, r0, r1 ; advances one position
		cmp r7, r5
		jle RenderBlockPositionThird
		cmp r7, r2
		jeg RenderBlockPositionThird ; checks uper and lower limits
		load r2, mapSize
		mod r3, r7, r2
		loadn r6, #1
		sub r6, r1, r6
		cmp r3, r6
		jeq RenderBlockPositionThird ; checks if it is going through the right side
		mod r3, r7, r2
		mul r3, r3, r1
		load r6, mapSize
		dec r6
		not r6, r6
		inc r6
		cmp r3, r6
		jeq RenderBlockPositionThird ; checks if it is going through the left side
		loadn r6, #map
		add r6, r6, r7
		loadi r6, r6
		cmp r6, r5
		jeq RenderBlockPositionThird ; checks if the position is vacant

			pop r5
			loadn r6, #1
			cmp r5, r6
			push r5
			jeq RenderBlockPositionEnd

			loadn r6, #128
			load r7, pixel
			mod r7, r7, r6
			loadn r6, #126
			cmp r6, r7
			jeq RenderBlockPositionEnd ; uses light to check if it must continue
			; calls recursivelly to check further
				load r7, pixel
				inc r7
				store pixel, r7
				load r6, offsetX ; updates position, light and offset
				loadn r7, #100
				add r7, r6, r7
				not r7, r7
				inc r7
				store offsetX, r7
				mov r7, r0
				add r0, r0, r1
				push r1
				load r1, direction
				loadn r5, #1
				call RenderBlockPosition ; call new check
				loadn r5, #0
				pop r1
				mov r0, r7
				store offsetX, r6 ; returns position, light and offset to original values
				load r7, pixel
				dec r7
				store pixel, r7
			jmp RenderBlockPositionEnd

	RenderBlockPositionThird: ; renders screen if one of the checks fail
		call RenderLeftWall

	RenderBlockPositionEnd:

	pop r5

	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0

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

	load r1, posVictory
	cmp r0, r1
	jne RenderRightWallNoAlternateColor
		load r3, colorVictory1
		add r3, r3, r4
		store pixel, r3
	RenderRightWallNoAlternateColor:

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

	load r1, posVictory
	cmp r0, r1
	jne RenderLeftWallNoAlternateColor
		load r3, colorVictory1
		add r3, r3, r4
		store pixel, r3
	RenderLeftWallNoAlternateColor:

	; left side
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

	; changes color
	load r3, color2
	load r4, pixel
	add r3, r3, r4
	store pixel, r3

	load r1, posVictory
	cmp r0, r1
	jne RenderFrontWallNoAlternateColor
		load r3, colorVictory2
		add r3, r3, r4
		store pixel, r3
	RenderFrontWallNoAlternateColor:

	; front side
	load r0, offsetX
	loadn r1, #50
	sub r2, r0, r1
	store offsetX, r2

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

tela : var #1200
  ;Linha 0
  static tela + #0, #123
  static tela + #1, #123
  static tela + #2, #123
  static tela + #3, #123
  static tela + #4, #123
  static tela + #5, #123
  static tela + #6, #123
  static tela + #7, #123
  static tela + #8, #123
  static tela + #9, #123
  static tela + #10, #123
  static tela + #11, #123
  static tela + #12, #123
  static tela + #13, #123
  static tela + #14, #123
  static tela + #15, #123
  static tela + #16, #123
  static tela + #17, #123
  static tela + #18, #123
  static tela + #19, #123
  static tela + #20, #123
  static tela + #21, #123
  static tela + #22, #123
  static tela + #23, #123
  static tela + #24, #123
  static tela + #25, #123
  static tela + #26, #123
  static tela + #27, #123
  static tela + #28, #123
  static tela + #29, #123
  static tela + #30, #123
  static tela + #31, #123
  static tela + #32, #123
  static tela + #33, #123
  static tela + #34, #123
  static tela + #35, #123
  static tela + #36, #123
  static tela + #37, #123
  static tela + #38, #123
  static tela + #39, #123

  ;Linha 1
  static tela + #40, #123
  static tela + #41, #123
  static tela + #42, #123
  static tela + #43, #123
  static tela + #44, #123
  static tela + #45, #123
  static tela + #46, #123
  static tela + #47, #123
  static tela + #48, #123
  static tela + #49, #123
  static tela + #50, #123
  static tela + #51, #123
  static tela + #52, #123
  static tela + #53, #123
  static tela + #54, #123
  static tela + #55, #123
  static tela + #56, #123
  static tela + #57, #123
  static tela + #58, #123
  static tela + #59, #123
  static tela + #60, #123
  static tela + #61, #123
  static tela + #62, #123
  static tela + #63, #123
  static tela + #64, #123
  static tela + #65, #123
  static tela + #66, #123
  static tela + #67, #123
  static tela + #68, #123
  static tela + #69, #123
  static tela + #70, #123
  static tela + #71, #123
  static tela + #72, #123
  static tela + #73, #123
  static tela + #74, #123
  static tela + #75, #123
  static tela + #76, #123
  static tela + #77, #123
  static tela + #78, #123
  static tela + #79, #123

  ;Linha 2
  static tela + #80, #123
  static tela + #81, #123
  static tela + #82, #123
  static tela + #83, #123
  static tela + #84, #123
  static tela + #85, #123
  static tela + #86, #123
  static tela + #87, #123
  static tela + #88, #123
  static tela + #89, #123
  static tela + #90, #123
  static tela + #91, #123
  static tela + #92, #123
  static tela + #93, #123
  static tela + #94, #123
  static tela + #95, #123
  static tela + #96, #123
  static tela + #97, #123
  static tela + #98, #123
  static tela + #99, #123
  static tela + #100, #123
  static tela + #101, #123
  static tela + #102, #123
  static tela + #103, #123
  static tela + #104, #123
  static tela + #105, #123
  static tela + #106, #123
  static tela + #107, #123
  static tela + #108, #123
  static tela + #109, #123
  static tela + #110, #123
  static tela + #111, #123
  static tela + #112, #123
  static tela + #113, #123
  static tela + #114, #123
  static tela + #115, #123
  static tela + #116, #123
  static tela + #117, #123
  static tela + #118, #123
  static tela + #119, #123

  ;Linha 3
  static tela + #120, #123
  static tela + #121, #123
  static tela + #122, #123
  static tela + #123, #123
  static tela + #124, #123
  static tela + #125, #123
  static tela + #126, #123
  static tela + #127, #123
  static tela + #128, #123
  static tela + #129, #123
  static tela + #130, #123
  static tela + #131, #123
  static tela + #132, #123
  static tela + #133, #123
  static tela + #134, #123
  static tela + #135, #123
  static tela + #136, #123
  static tela + #137, #123
  static tela + #138, #123
  static tela + #139, #123
  static tela + #140, #123
  static tela + #141, #123
  static tela + #142, #123
  static tela + #143, #123
  static tela + #144, #123
  static tela + #145, #123
  static tela + #146, #123
  static tela + #147, #123
  static tela + #148, #123
  static tela + #149, #123
  static tela + #150, #123
  static tela + #151, #123
  static tela + #152, #123
  static tela + #153, #123
  static tela + #154, #123
  static tela + #155, #123
  static tela + #156, #123
  static tela + #157, #123
  static tela + #158, #123
  static tela + #159, #123

  ;Linha 4
  static tela + #160, #123
  static tela + #161, #123
  static tela + #162, #123
  static tela + #163, #123
  static tela + #164, #123
  static tela + #165, #123
  static tela + #166, #123
  static tela + #167, #123
  static tela + #168, #123
  static tela + #169, #123
  static tela + #170, #123
  static tela + #171, #123
  static tela + #172, #123
  static tela + #173, #123
  static tela + #174, #123
  static tela + #175, #123
  static tela + #176, #123
  static tela + #177, #123
  static tela + #178, #123
  static tela + #179, #123
  static tela + #180, #123
  static tela + #181, #123
  static tela + #182, #123
  static tela + #183, #123
  static tela + #184, #123
  static tela + #185, #123
  static tela + #186, #123
  static tela + #187, #123
  static tela + #188, #123
  static tela + #189, #123
  static tela + #190, #123
  static tela + #191, #123
  static tela + #192, #123
  static tela + #193, #123
  static tela + #194, #123
  static tela + #195, #123
  static tela + #196, #123
  static tela + #197, #123
  static tela + #198, #123
  static tela + #199, #123

  ;Linha 5
  static tela + #200, #123
  static tela + #201, #123
  static tela + #202, #123
  static tela + #203, #123
  static tela + #204, #123
  static tela + #205, #123
  static tela + #206, #123
  static tela + #207, #123
  static tela + #208, #123
  static tela + #209, #123
  static tela + #210, #123
  static tela + #211, #123
  static tela + #212, #123
  static tela + #213, #123
  static tela + #214, #123
  static tela + #215, #123
  static tela + #216, #123
  static tela + #217, #123
  static tela + #218, #123
  static tela + #219, #123
  static tela + #220, #123
  static tela + #221, #123
  static tela + #222, #123
  static tela + #223, #123
  static tela + #224, #123
  static tela + #225, #123
  static tela + #226, #123
  static tela + #227, #123
  static tela + #228, #123
  static tela + #229, #123
  static tela + #230, #123
  static tela + #231, #123
  static tela + #232, #123
  static tela + #233, #123
  static tela + #234, #123
  static tela + #235, #123
  static tela + #236, #123
  static tela + #237, #123
  static tela + #238, #123
  static tela + #239, #123

  ;Linha 6
  static tela + #240, #123
  static tela + #241, #123
  static tela + #242, #123
  static tela + #243, #123
  static tela + #244, #123
  static tela + #245, #123
  static tela + #246, #123
  static tela + #247, #123
  static tela + #248, #123
  static tela + #249, #123
  static tela + #250, #2939
  static tela + #251, #2939
  static tela + #252, #2939
  static tela + #253, #2939
  static tela + #254, #2939
  static tela + #255, #2939
  static tela + #256, #123
  static tela + #257, #123
  static tela + #258, #123
  static tela + #259, #123
  static tela + #260, #123
  static tela + #261, #123
  static tela + #262, #123
  static tela + #263, #123
  static tela + #264, #2939
  static tela + #265, #2939
  static tela + #266, #2939
  static tela + #267, #2939
  static tela + #268, #2939
  static tela + #269, #2939
  static tela + #270, #123
  static tela + #271, #123
  static tela + #272, #123
  static tela + #273, #123
  static tela + #274, #123
  static tela + #275, #123
  static tela + #276, #123
  static tela + #277, #123
  static tela + #278, #123
  static tela + #279, #123

  ;Linha 7
  static tela + #280, #123
  static tela + #281, #123
  static tela + #282, #123
  static tela + #283, #123
  static tela + #284, #123
  static tela + #285, #123
  static tela + #286, #123
  static tela + #287, #123
  static tela + #288, #123
  static tela + #289, #123
  static tela + #290, #2939
  static tela + #291, #2939
  static tela + #292, #2939
  static tela + #293, #2939
  static tela + #294, #2939
  static tela + #295, #2939
  static tela + #296, #123
  static tela + #297, #123
  static tela + #298, #123
  static tela + #299, #123
  static tela + #300, #123
  static tela + #301, #123
  static tela + #302, #123
  static tela + #303, #123
  static tela + #304, #2939
  static tela + #305, #2939
  static tela + #306, #2939
  static tela + #307, #2939
  static tela + #308, #2939
  static tela + #309, #2939
  static tela + #310, #123
  static tela + #311, #123
  static tela + #312, #123
  static tela + #313, #123
  static tela + #314, #123
  static tela + #315, #123
  static tela + #316, #123
  static tela + #317, #123
  static tela + #318, #123
  static tela + #319, #123

  ;Linha 8
  static tela + #320, #123
  static tela + #321, #123
  static tela + #322, #123
  static tela + #323, #123
  static tela + #324, #123
  static tela + #325, #123
  static tela + #326, #123
  static tela + #327, #123
  static tela + #328, #2939
  static tela + #329, #2939
  static tela + #330, #2939
  static tela + #331, #2939
  static tela + #332, #2939
  static tela + #333, #2939
  static tela + #334, #2939
  static tela + #335, #2939
  static tela + #336, #2939
  static tela + #337, #2939
  static tela + #338, #123
  static tela + #339, #123
  static tela + #340, #123
  static tela + #341, #123
  static tela + #342, #2939
  static tela + #343, #2939
  static tela + #344, #2939
  static tela + #345, #2939
  static tela + #346, #2939
  static tela + #347, #2939
  static tela + #348, #2939
  static tela + #349, #2939
  static tela + #350, #2939
  static tela + #351, #2939
  static tela + #352, #123
  static tela + #353, #123
  static tela + #354, #123
  static tela + #355, #123
  static tela + #356, #123
  static tela + #357, #123
  static tela + #358, #123
  static tela + #359, #123

  ;Linha 9
  static tela + #360, #123
  static tela + #361, #123
  static tela + #362, #123
  static tela + #363, #123
  static tela + #364, #123
  static tela + #365, #123
  static tela + #366, #123
  static tela + #367, #123
  static tela + #368, #2939
  static tela + #369, #123
  static tela + #370, #2939
  static tela + #371, #2939
  static tela + #372, #2939
  static tela + #373, #2939
  static tela + #374, #2939
  static tela + #375, #2939
  static tela + #376, #123
  static tela + #377, #2939
  static tela + #378, #123
  static tela + #379, #123
  static tela + #380, #123
  static tela + #381, #123
  static tela + #382, #2939
  static tela + #383, #123
  static tela + #384, #2939
  static tela + #385, #2939
  static tela + #386, #2939
  static tela + #387, #2939
  static tela + #388, #2939
  static tela + #389, #2939
  static tela + #390, #123
  static tela + #391, #2939
  static tela + #392, #123
  static tela + #393, #123
  static tela + #394, #123
  static tela + #395, #123
  static tela + #396, #123
  static tela + #397, #123
  static tela + #398, #123
  static tela + #399, #123

  ;Linha 10
  static tela + #400, #123
  static tela + #401, #123
  static tela + #402, #123
  static tela + #403, #123
  static tela + #404, #123
  static tela + #405, #123
  static tela + #406, #123
  static tela + #407, #123
  static tela + #408, #123
  static tela + #409, #2939
  static tela + #410, #2939
  static tela + #411, #2939
  static tela + #412, #2939
  static tela + #413, #2939
  static tela + #414, #2939
  static tela + #415, #2939
  static tela + #416, #2939
  static tela + #417, #123
  static tela + #418, #123
  static tela + #419, #123
  static tela + #420, #123
  static tela + #421, #123
  static tela + #422, #123
  static tela + #423, #2939
  static tela + #424, #2939
  static tela + #425, #2939
  static tela + #426, #2939
  static tela + #427, #2939
  static tela + #428, #2939
  static tela + #429, #2939
  static tela + #430, #2939
  static tela + #431, #123
  static tela + #432, #123
  static tela + #433, #123
  static tela + #434, #123
  static tela + #435, #123
  static tela + #436, #123
  static tela + #437, #123
  static tela + #438, #123
  static tela + #439, #123

  ;Linha 11
  static tela + #440, #123
  static tela + #441, #123
  static tela + #442, #123
  static tela + #443, #123
  static tela + #444, #123
  static tela + #445, #123
  static tela + #446, #123
  static tela + #447, #123
  static tela + #448, #123
  static tela + #449, #123
  static tela + #450, #123
  static tela + #451, #2939
  static tela + #452, #2939
  static tela + #453, #2939
  static tela + #454, #2939
  static tela + #455, #123
  static tela + #456, #123
  static tela + #457, #123
  static tela + #458, #123
  static tela + #459, #123
  static tela + #460, #123
  static tela + #461, #123
  static tela + #462, #123
  static tela + #463, #123
  static tela + #464, #123
  static tela + #465, #2939
  static tela + #466, #2939
  static tela + #467, #2939
  static tela + #468, #2939
  static tela + #469, #123
  static tela + #470, #123
  static tela + #471, #123
  static tela + #472, #123
  static tela + #473, #123
  static tela + #474, #123
  static tela + #475, #123
  static tela + #476, #123
  static tela + #477, #123
  static tela + #478, #123
  static tela + #479, #123

  ;Linha 12
  static tela + #480, #123
  static tela + #481, #123
  static tela + #482, #123
  static tela + #483, #123
  static tela + #484, #123
  static tela + #485, #123
  static tela + #486, #123
  static tela + #487, #123
  static tela + #488, #123
  static tela + #489, #123
  static tela + #490, #123
  static tela + #491, #123
  static tela + #492, #2939
  static tela + #493, #2939
  static tela + #494, #123
  static tela + #495, #123
  static tela + #496, #123
  static tela + #497, #123
  static tela + #498, #123
  static tela + #499, #123
  static tela + #500, #123
  static tela + #501, #123
  static tela + #502, #123
  static tela + #503, #123
  static tela + #504, #123
  static tela + #505, #123
  static tela + #506, #2939
  static tela + #507, #2939
  static tela + #508, #123
  static tela + #509, #123
  static tela + #510, #123
  static tela + #511, #123
  static tela + #512, #123
  static tela + #513, #123
  static tela + #514, #123
  static tela + #515, #123
  static tela + #516, #123
  static tela + #517, #123
  static tela + #518, #123
  static tela + #519, #123

  ;Linha 13
  static tela + #520, #123
  static tela + #521, #123
  static tela + #522, #123
  static tela + #523, #123
  static tela + #524, #123
  static tela + #525, #123
  static tela + #526, #123
  static tela + #527, #123
  static tela + #528, #123
  static tela + #529, #123
  static tela + #530, #123
  static tela + #531, #123
  static tela + #532, #2939
  static tela + #533, #2939
  static tela + #534, #123
  static tela + #535, #123
  static tela + #536, #123
  static tela + #537, #123
  static tela + #538, #123
  static tela + #539, #123
  static tela + #540, #123
  static tela + #541, #123
  static tela + #542, #123
  static tela + #543, #123
  static tela + #544, #123
  static tela + #545, #123
  static tela + #546, #2939
  static tela + #547, #2939
  static tela + #548, #123
  static tela + #549, #123
  static tela + #550, #123
  static tela + #551, #123
  static tela + #552, #123
  static tela + #553, #123
  static tela + #554, #123
  static tela + #555, #123
  static tela + #556, #123
  static tela + #557, #123
  static tela + #558, #123
  static tela + #559, #123

  ;Linha 14
  static tela + #560, #123
  static tela + #561, #123
  static tela + #562, #123
  static tela + #563, #123
  static tela + #564, #123
  static tela + #565, #123
  static tela + #566, #123
  static tela + #567, #123
  static tela + #568, #123
  static tela + #569, #123
  static tela + #570, #2939
  static tela + #571, #2939
  static tela + #572, #2939
  static tela + #573, #2939
  static tela + #574, #2939
  static tela + #575, #123
  static tela + #576, #123
  static tela + #577, #123
  static tela + #578, #123
  static tela + #579, #123
  static tela + #580, #123
  static tela + #581, #123
  static tela + #582, #123
  static tela + #583, #123
  static tela + #584, #123
  static tela + #585, #2939
  static tela + #586, #2939
  static tela + #587, #2939
  static tela + #588, #2939
  static tela + #589, #123
  static tela + #590, #123
  static tela + #591, #123
  static tela + #592, #123
  static tela + #593, #123
  static tela + #594, #123
  static tela + #595, #123
  static tela + #596, #123
  static tela + #597, #123
  static tela + #598, #123
  static tela + #599, #123

  ;Linha 15
  static tela + #600, #123
  static tela + #601, #123
  static tela + #602, #123
  static tela + #603, #123
  static tela + #604, #123
  static tela + #605, #123
  static tela + #606, #123
  static tela + #607, #123
  static tela + #608, #123
  static tela + #609, #123
  static tela + #610, #123
  static tela + #611, #123
  static tela + #612, #123
  static tela + #613, #123
  static tela + #614, #123
  static tela + #615, #123
  static tela + #616, #123
  static tela + #617, #123
  static tela + #618, #123
  static tela + #619, #123
  static tela + #620, #123
  static tela + #621, #123
  static tela + #622, #123
  static tela + #623, #123
  static tela + #624, #123
  static tela + #625, #123
  static tela + #626, #123
  static tela + #627, #123
  static tela + #628, #123
  static tela + #629, #123
  static tela + #630, #123
  static tela + #631, #123
  static tela + #632, #123
  static tela + #633, #123
  static tela + #634, #123
  static tela + #635, #123
  static tela + #636, #123
  static tela + #637, #123
  static tela + #638, #123
  static tela + #639, #123

  ;Linha 16
  static tela + #640, #123
  static tela + #641, #123
  static tela + #642, #123
  static tela + #643, #123
  static tela + #644, #123
  static tela + #645, #123
  static tela + #646, #123
  static tela + #647, #123
  static tela + #648, #123
  static tela + #649, #123
  static tela + #650, #123
  static tela + #651, #123
  static tela + #652, #123
  static tela + #653, #123
  static tela + #654, #123
  static tela + #655, #123
  static tela + #656, #123
  static tela + #657, #123
  static tela + #658, #123
  static tela + #659, #123
  static tela + #660, #123
  static tela + #661, #123
  static tela + #662, #123
  static tela + #663, #123
  static tela + #664, #123
  static tela + #665, #123
  static tela + #666, #123
  static tela + #667, #123
  static tela + #668, #123
  static tela + #669, #123
  static tela + #670, #123
  static tela + #671, #123
  static tela + #672, #123
  static tela + #673, #123
  static tela + #674, #123
  static tela + #675, #123
  static tela + #676, #123
  static tela + #677, #123
  static tela + #678, #123
  static tela + #679, #123

  ;Linha 17
  static tela + #680, #123
  static tela + #681, #123
  static tela + #682, #123
  static tela + #683, #123
  static tela + #684, #123
  static tela + #685, #123
  static tela + #686, #123
  static tela + #687, #123
  static tela + #688, #123
  static tela + #689, #123
  static tela + #690, #123
  static tela + #691, #123
  static tela + #692, #123
  static tela + #693, #123
  static tela + #694, #123
  static tela + #695, #123
  static tela + #696, #123
  static tela + #697, #123
  static tela + #698, #123
  static tela + #699, #123
  static tela + #700, #123
  static tela + #701, #123
  static tela + #702, #123
  static tela + #703, #123
  static tela + #704, #123
  static tela + #705, #123
  static tela + #706, #123
  static tela + #707, #123
  static tela + #708, #123
  static tela + #709, #123
  static tela + #710, #123
  static tela + #711, #123
  static tela + #712, #123
  static tela + #713, #123
  static tela + #714, #123
  static tela + #715, #123
  static tela + #716, #123
  static tela + #717, #123
  static tela + #718, #123
  static tela + #719, #123

  ;Linha 18
  static tela + #720, #123
  static tela + #721, #2427
  static tela + #722, #2427
  static tela + #723, #123
  static tela + #724, #3963
  static tela + #725, #123
  static tela + #726, #123
  static tela + #727, #123
  static tela + #728, #3963
  static tela + #729, #123
  static tela + #730, #3963
  static tela + #731, #3963
  static tela + #732, #3963
  static tela + #733, #123
  static tela + #734, #123
  static tela + #735, #3963
  static tela + #736, #3963
  static tela + #737, #3963
  static tela + #738, #3963
  static tela + #739, #123
  static tela + #740, #3963
  static tela + #741, #3963
  static tela + #742, #3963
  static tela + #743, #3963
  static tela + #744, #3963
  static tela + #745, #123
  static tela + #746, #3963
  static tela + #747, #3963
  static tela + #748, #3963
  static tela + #749, #3963
  static tela + #750, #123
  static tela + #751, #3963
  static tela + #752, #3963
  static tela + #753, #3963
  static tela + #754, #123
  static tela + #755, #123
  static tela + #756, #3963
  static tela + #757, #123
  static tela + #758, #3963
  static tela + #759, #123

  ;Linha 19
  static tela + #760, #123
  static tela + #761, #2427
  static tela + #762, #2427
  static tela + #763, #123
  static tela + #764, #3963
  static tela + #765, #123
  static tela + #766, #123
  static tela + #767, #123
  static tela + #768, #3963
  static tela + #769, #123
  static tela + #770, #123
  static tela + #771, #3963
  static tela + #772, #123
  static tela + #773, #123
  static tela + #774, #123
  static tela + #775, #3963
  static tela + #776, #123
  static tela + #777, #123
  static tela + #778, #123
  static tela + #779, #123
  static tela + #780, #123
  static tela + #781, #123
  static tela + #782, #3963
  static tela + #783, #123
  static tela + #784, #123
  static tela + #785, #123
  static tela + #786, #3963
  static tela + #787, #123
  static tela + #788, #123
  static tela + #789, #3963
  static tela + #790, #123
  static tela + #791, #3963
  static tela + #792, #123
  static tela + #793, #123
  static tela + #794, #3963
  static tela + #795, #123
  static tela + #796, #3963
  static tela + #797, #123
  static tela + #798, #3963
  static tela + #799, #123

  ;Linha 20
  static tela + #800, #123
  static tela + #801, #2427
  static tela + #802, #2427
  static tela + #803, #123
  static tela + #804, #3963
  static tela + #805, #123
  static tela + #806, #123
  static tela + #807, #123
  static tela + #808, #3963
  static tela + #809, #123
  static tela + #810, #123
  static tela + #811, #3963
  static tela + #812, #123
  static tela + #813, #123
  static tela + #814, #123
  static tela + #815, #3963
  static tela + #816, #123
  static tela + #817, #123
  static tela + #818, #123
  static tela + #819, #123
  static tela + #820, #123
  static tela + #821, #123
  static tela + #822, #3963
  static tela + #823, #123
  static tela + #824, #123
  static tela + #825, #123
  static tela + #826, #3963
  static tela + #827, #123
  static tela + #828, #123
  static tela + #829, #3963
  static tela + #830, #123
  static tela + #831, #3963
  static tela + #832, #123
  static tela + #833, #123
  static tela + #834, #3963
  static tela + #835, #123
  static tela + #836, #3963
  static tela + #837, #123
  static tela + #838, #3963
  static tela + #839, #123

  ;Linha 21
  static tela + #840, #1915
  static tela + #841, #2427
  static tela + #842, #2427
  static tela + #843, #123
  static tela + #844, #123
  static tela + #845, #3963
  static tela + #846, #123
  static tela + #847, #3963
  static tela + #848, #123
  static tela + #849, #123
  static tela + #850, #123
  static tela + #851, #3963
  static tela + #852, #123
  static tela + #853, #123
  static tela + #854, #123
  static tela + #855, #3963
  static tela + #856, #123
  static tela + #857, #123
  static tela + #858, #123
  static tela + #859, #123
  static tela + #860, #123
  static tela + #861, #123
  static tela + #862, #3963
  static tela + #863, #123
  static tela + #864, #123
  static tela + #865, #123
  static tela + #866, #3963
  static tela + #867, #123
  static tela + #868, #123
  static tela + #869, #3963
  static tela + #870, #123
  static tela + #871, #3963
  static tela + #872, #3963
  static tela + #873, #3963
  static tela + #874, #123
  static tela + #875, #123
  static tela + #876, #123
  static tela + #877, #3963
  static tela + #878, #123
  static tela + #879, #123

  ;Linha 22
  static tela + #880, #123
  static tela + #881, #2427
  static tela + #882, #2427
  static tela + #883, #123
  static tela + #884, #123
  static tela + #885, #3963
  static tela + #886, #123
  static tela + #887, #3963
  static tela + #888, #123
  static tela + #889, #123
  static tela + #890, #123
  static tela + #891, #3963
  static tela + #892, #123
  static tela + #893, #123
  static tela + #894, #123
  static tela + #895, #3963
  static tela + #896, #123
  static tela + #897, #123
  static tela + #898, #123
  static tela + #899, #123
  static tela + #900, #123
  static tela + #901, #123
  static tela + #902, #3963
  static tela + #903, #123
  static tela + #904, #123
  static tela + #905, #123
  static tela + #906, #3963
  static tela + #907, #123
  static tela + #908, #123
  static tela + #909, #3963
  static tela + #910, #123
  static tela + #911, #3963
  static tela + #912, #123
  static tela + #913, #123
  static tela + #914, #3963
  static tela + #915, #123
  static tela + #916, #123
  static tela + #917, #3963
  static tela + #918, #123
  static tela + #919, #123

  ;Linha 23
  static tela + #920, #123
  static tela + #921, #123
  static tela + #922, #123
  static tela + #923, #123
  static tela + #924, #123
  static tela + #925, #3963
  static tela + #926, #123
  static tela + #927, #3963
  static tela + #928, #123
  static tela + #929, #123
  static tela + #930, #123
  static tela + #931, #3963
  static tela + #932, #123
  static tela + #933, #123
  static tela + #934, #123
  static tela + #935, #3963
  static tela + #936, #123
  static tela + #937, #123
  static tela + #938, #123
  static tela + #939, #123
  static tela + #940, #123
  static tela + #941, #123
  static tela + #942, #3963
  static tela + #943, #123
  static tela + #944, #123
  static tela + #945, #123
  static tela + #946, #3963
  static tela + #947, #123
  static tela + #948, #123
  static tela + #949, #3963
  static tela + #950, #123
  static tela + #951, #3963
  static tela + #952, #123
  static tela + #953, #123
  static tela + #954, #3963
  static tela + #955, #123
  static tela + #956, #123
  static tela + #957, #3963
  static tela + #958, #123
  static tela + #959, #123

  ;Linha 24
  static tela + #960, #123
  static tela + #961, #2427
  static tela + #962, #2427
  static tela + #963, #123
  static tela + #964, #123
  static tela + #965, #123
  static tela + #966, #3963
  static tela + #967, #123
  static tela + #968, #123
  static tela + #969, #123
  static tela + #970, #3963
  static tela + #971, #3963
  static tela + #972, #3963
  static tela + #973, #123
  static tela + #974, #123
  static tela + #975, #3963
  static tela + #976, #3963
  static tela + #977, #3963
  static tela + #978, #3963
  static tela + #979, #123
  static tela + #980, #123
  static tela + #981, #123
  static tela + #982, #3963
  static tela + #983, #123
  static tela + #984, #123
  static tela + #985, #123
  static tela + #986, #3963
  static tela + #987, #3963
  static tela + #988, #3963
  static tela + #989, #3963
  static tela + #990, #123
  static tela + #991, #3963
  static tela + #992, #123
  static tela + #993, #123
  static tela + #994, #3963
  static tela + #995, #123
  static tela + #996, #123
  static tela + #997, #3963
  static tela + #998, #123
  static tela + #999, #123

  ;Linha 25
  static tela + #1000, #123
  static tela + #1001, #123
  static tela + #1002, #123
  static tela + #1003, #123
  static tela + #1004, #123
  static tela + #1005, #123
  static tela + #1006, #123
  static tela + #1007, #123
  static tela + #1008, #123
  static tela + #1009, #123
  static tela + #1010, #123
  static tela + #1011, #123
  static tela + #1012, #123
  static tela + #1013, #123
  static tela + #1014, #123
  static tela + #1015, #123
  static tela + #1016, #123
  static tela + #1017, #123
  static tela + #1018, #123
  static tela + #1019, #123
  static tela + #1020, #123
  static tela + #1021, #123
  static tela + #1022, #123
  static tela + #1023, #123
  static tela + #1024, #123
  static tela + #1025, #123
  static tela + #1026, #123
  static tela + #1027, #123
  static tela + #1028, #123
  static tela + #1029, #123
  static tela + #1030, #123
  static tela + #1031, #123
  static tela + #1032, #123
  static tela + #1033, #123
  static tela + #1034, #123
  static tela + #1035, #123
  static tela + #1036, #123
  static tela + #1037, #123
  static tela + #1038, #123
  static tela + #1039, #123

  ;Linha 26
  static tela + #1040, #123
  static tela + #1041, #123
  static tela + #1042, #123
  static tela + #1043, #123
  static tela + #1044, #123
  static tela + #1045, #123
  static tela + #1046, #123
  static tela + #1047, #123
  static tela + #1048, #123
  static tela + #1049, #123
  static tela + #1050, #123
  static tela + #1051, #123
  static tela + #1052, #123
  static tela + #1053, #123
  static tela + #1054, #123
  static tela + #1055, #123
  static tela + #1056, #123
  static tela + #1057, #123
  static tela + #1058, #123
  static tela + #1059, #123
  static tela + #1060, #123
  static tela + #1061, #123
  static tela + #1062, #123
  static tela + #1063, #123
  static tela + #1064, #123
  static tela + #1065, #123
  static tela + #1066, #123
  static tela + #1067, #123
  static tela + #1068, #123
  static tela + #1069, #123
  static tela + #1070, #123
  static tela + #1071, #123
  static tela + #1072, #123
  static tela + #1073, #123
  static tela + #1074, #123
  static tela + #1075, #123
  static tela + #1076, #123
  static tela + #1077, #123
  static tela + #1078, #123
  static tela + #1079, #123

  ;Linha 27
  static tela + #1080, #123
  static tela + #1081, #123
  static tela + #1082, #123
  static tela + #1083, #123
  static tela + #1084, #123
  static tela + #1085, #123
  static tela + #1086, #123
  static tela + #1087, #123
  static tela + #1088, #123
  static tela + #1089, #123
  static tela + #1090, #123
  static tela + #1091, #123
  static tela + #1092, #123
  static tela + #1093, #123
  static tela + #1094, #123
  static tela + #1095, #123
  static tela + #1096, #123
  static tela + #1097, #123
  static tela + #1098, #123
  static tela + #1099, #123
  static tela + #1100, #123
  static tela + #1101, #123
  static tela + #1102, #123
  static tela + #1103, #123
  static tela + #1104, #123
  static tela + #1105, #123
  static tela + #1106, #123
  static tela + #1107, #123
  static tela + #1108, #123
  static tela + #1109, #123
  static tela + #1110, #123
  static tela + #1111, #123
  static tela + #1112, #123
  static tela + #1113, #123
  static tela + #1114, #123
  static tela + #1115, #123
  static tela + #1116, #123
  static tela + #1117, #123
  static tela + #1118, #123
  static tela + #1119, #123

  ;Linha 28
  static tela + #1120, #123
  static tela + #1121, #123
  static tela + #1122, #123
  static tela + #1123, #123
  static tela + #1124, #123
  static tela + #1125, #123
  static tela + #1126, #123
  static tela + #1127, #123
  static tela + #1128, #123
  static tela + #1129, #123
  static tela + #1130, #123
  static tela + #1131, #123
  static tela + #1132, #123
  static tela + #1133, #123
  static tela + #1134, #123
  static tela + #1135, #123
  static tela + #1136, #123
  static tela + #1137, #123
  static tela + #1138, #123
  static tela + #1139, #123
  static tela + #1140, #123
  static tela + #1141, #123
  static tela + #1142, #123
  static tela + #1143, #123
  static tela + #1144, #123
  static tela + #1145, #123
  static tela + #1146, #123
  static tela + #1147, #123
  static tela + #1148, #123
  static tela + #1149, #123
  static tela + #1150, #123
  static tela + #1151, #123
  static tela + #1152, #123
  static tela + #1153, #123
  static tela + #1154, #123
  static tela + #1155, #123
  static tela + #1156, #123
  static tela + #1157, #123
  static tela + #1158, #123
  static tela + #1159, #123

  ;Linha 29
  static tela + #1160, #123
  static tela + #1161, #123
  static tela + #1162, #123
  static tela + #1163, #123
  static tela + #1164, #123
  static tela + #1165, #123
  static tela + #1166, #123
  static tela + #1167, #123
  static tela + #1168, #123
  static tela + #1169, #123
  static tela + #1170, #123
  static tela + #1171, #123
  static tela + #1172, #123
  static tela + #1173, #123
  static tela + #1174, #123
  static tela + #1175, #123
  static tela + #1176, #123
  static tela + #1177, #123
  static tela + #1178, #123
  static tela + #1179, #123
  static tela + #1180, #123
  static tela + #1181, #123
  static tela + #1182, #123
  static tela + #1183, #123
  static tela + #1184, #123
  static tela + #1185, #123
  static tela + #1186, #123
  static tela + #1187, #123
  static tela + #1188, #123
  static tela + #1189, #123
  static tela + #1190, #123
  static tela + #1191, #123
  static tela + #1192, #123
  static tela + #1193, #123
  static tela + #1194, #123
  static tela + #1195, #123
  static tela + #1196, #123
  static tela + #1197, #123
  static tela + #1198, #123
  static tela + #1199, #123

printtelaScreen:
  push R0
  push R1
  push R2
  push R3

  loadn R0, #tela
  loadn R1, #0
  loadn R2, #1200

  printtelaScreenLoop:

    add R3,R0,R1
    loadi R3, R3
    outchar R3, R1
    inc R1
    cmp R1, R2

    jne printtelaScreenLoop

  pop R3
  pop R2
  pop R1
  pop R0
  rts