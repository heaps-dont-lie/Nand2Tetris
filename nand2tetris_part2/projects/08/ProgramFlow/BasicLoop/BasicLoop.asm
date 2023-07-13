@0
D=A	// D = 0


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@LCL
D=M


@0
D=D+A	// *LCL + offset 0


@LOC_1
M=D	// Storing the address at LOC_1


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_1
A=M
M=D	// Store D @ LOC_1

(LOOP_START)	// label declaration command

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

@LCL
D=M


@0
D=D+A	// *LCL + offset 0
A=D
D=M	// D = RAM[*LCL + 0]


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



@LCL
D=M


@0
D=D+A	// *LCL + offset 0


@LOC_2
M=D	// Storing the address at LOC_2


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_2
A=M
M=D	// Store D @ LOC_2

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

@SP
M=M-1
A=M
D=M	// Condition =  POP


@LOOP_START
D; JNE	// Jump to label, LOOP_START, if TRUE

@LCL
D=M


@0
D=D+A	// *LCL + offset 0
A=D
D=M	// D = RAM[*LCL + 0]


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

