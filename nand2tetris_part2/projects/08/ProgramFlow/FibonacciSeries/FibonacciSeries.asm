@ARG
D=M


@1
D=D+A	// *ARG + offset 1
A=D
D=M	// D = RAM[*ARG + 1]


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@3
D=A


@1
D=D+A	// *3 + offset 1


@LOC_1
M=D	// Storing the address at LOC_1


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_1
A=M
M=D	// Store D @ LOC_1

@0
D=A	// D = 0


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@THAT
D=M


@0
D=D+A	// *THAT + offset 0


@LOC_2
M=D	// Storing the address at LOC_2


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_2
A=M
M=D	// Store D @ LOC_2

@1
D=A	// D = 1


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@THAT
D=M


@1
D=D+A	// *THAT + offset 1


@LOC_3
M=D	// Storing the address at LOC_3


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_3
A=M
M=D	// Store D @ LOC_3

@ARG
D=M


@0
D=D+A	// *ARG + offset 0
A=D
D=M	// D = RAM[*ARG + 0]


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@2
D=A	// D = 2


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@SP
M=M-1
A=M
D=M	// POP = A, tmp = A


@SP
M=M-1
A=M
D=M-D	// POP = B, tmp = B - A


M=D	// PUSH tmp: part 1
@SP
M=M+1	//PUSH tmp: part 2



@ARG
D=M


@0
D=D+A	// *ARG + offset 0


@LOC_4
M=D	// Storing the address at LOC_4


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_4
A=M
M=D	// Store D @ LOC_4

(MAIN_LOOP_START)	// label declaration command

@ARG
D=M


@0
D=D+A	// *ARG + offset 0
A=D
D=M	// D = RAM[*ARG + 0]


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@SP
M=M-1
A=M
D=M	// Condition =  POP


@COMPUTE_ELEMENT
D; JNE	// Jump to label, COMPUTE_ELEMENT, if TRUE

@END_PROGRAM
0; JMP	// Jump unconditionally to the label, END_PROGRAM

(COMPUTE_ELEMENT)	// label declaration command

@THAT
D=M


@0
D=D+A	// *THAT + offset 0
A=D
D=M	// D = RAM[*THAT + 0]


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@THAT
D=M


@1
D=D+A	// *THAT + offset 1
A=D
D=M	// D = RAM[*THAT + 1]


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@SP
M=M-1
A=M
D=M	// POP = A, tmp = A


@SP
M=M-1
A=M
D=M+D	// POP = B, tmp = B + A


M=D	// PUSH tmp: part 1
@SP
M=M+1	//PUSH tmp: part 2



@THAT
D=M


@2
D=D+A	// *THAT + offset 2


@LOC_5
M=D	// Storing the address at LOC_5


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_5
A=M
M=D	// Store D @ LOC_5

@3
D=A


@1
D=D+A	// *3 + offset 1
A=D
D=M	// D = RAM[*3 + 1]


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@1
D=A	// D = 1


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@SP
M=M-1
A=M
D=M	// POP = A, tmp = A


@SP
M=M-1
A=M
D=M+D	// POP = B, tmp = B + A


M=D	// PUSH tmp: part 1
@SP
M=M+1	//PUSH tmp: part 2



@3
D=A


@1
D=D+A	// *3 + offset 1


@LOC_6
M=D	// Storing the address at LOC_6


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_6
A=M
M=D	// Store D @ LOC_6

@ARG
D=M


@0
D=D+A	// *ARG + offset 0
A=D
D=M	// D = RAM[*ARG + 0]


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@1
D=A	// D = 1


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@SP
M=M-1
A=M
D=M	// POP = A, tmp = A


@SP
M=M-1
A=M
D=M-D	// POP = B, tmp = B - A


M=D	// PUSH tmp: part 1
@SP
M=M+1	//PUSH tmp: part 2



@ARG
D=M


@0
D=D+A	// *ARG + offset 0


@LOC_7
M=D	// Storing the address at LOC_7


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_7
A=M
M=D	// Store D @ LOC_7

@MAIN_LOOP_START
0; JMP	// Jump unconditionally to the label, MAIN_LOOP_START

(END_PROGRAM)	// label declaration command

