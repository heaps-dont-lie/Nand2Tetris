// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


@8191
D=A
@height
M=D		// height = 8191 -> it is the number of rows in the Screen Memory Map.

@value
M=0		// value stores -1 or 0. -1 implies black screen and 0 means clear screen.

@SCREEN
D=A
@screenaddr
M=D		// address = 16384 (Base address of Hack Screen Memory Map)

@KBD
D=A
@kbdbaseaddr
M=D		// Base address of Keyboard Memory Map.

(LOOP)

  @kbdbaseaddr
  A=M
  D=M
  @BLKSCREEN
  D;JGT		// if key pressed goto BLKSCREEN.

  @value 
  M=0		// value = 0 -> implies key is not pressed.

  @SMM
  0; JMP	// goto SMM

(BLKSCREEN)

  @value
  M=-1		// value = -1 -> some key is pressed.
  @SMM
  0;JMP		// goto SMM.

(SMM)

  @i
  M=0		// i = 0 -> initialize the iteration variable.

  (FLOOP)	// For Loop

    @i
    D=M
    @height
    D=D-M
    @END
    D;JGT	// if i > height then goto END (terminate loop)

    @value
    D=M
    @screenaddr
    A=M
    M=D		// screen[i] = value -> screen starts from base address of the screen memory map.

    @i
    M=M+1	// i++
    @screenaddr
    M=M+1	// screenaddr++

    @FLOOP
    0;JMP	// goto FLOOP

(END)

  @SCREEN
  D=A
  @screenaddr
  M=D		// reset screenaddr to base address of the SMM.

  @LOOP
  0;JMP		// jump to the start of the main loop.



  
