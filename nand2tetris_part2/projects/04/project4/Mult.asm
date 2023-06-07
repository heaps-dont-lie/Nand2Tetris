// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

@R0
D=M
@a
M=D		// a = RAM[0]

@R1
D=M
@b
M=D		// b = RAM[1]

@R2
M=0		// RAM[2] = 0 --> It is a good practice to initialize the final output to 0.

@i
M=1		// i = 0

@SUM
M = 0		// SUM = 0

(LOOP)
  @i
  D=M
  @R1
  D=D-M
  @STOP
  D;JGT		// if i==RAM[1] then terminate loop.

  @SUM
  D=M
  @a
  D=D+M
  @SUM
  M=D		// SUM += RAM[0]
  @i
  M=M+1		// i += 1
  @LOOP
  0;JMP

(STOP)
  @SUM
  D=M
  @R2
  M=D		// RAM[2] = SUM

(END)
  @END
  0;JMP		// INFINITE LOOP
