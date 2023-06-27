@3030
D=A	// D = 3030


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@3
D=A


@0
D=D+A	// *3 + offset 0


@LOC_1
M=D	// Storing the address at LOC_1


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_1
A=M
M=D	// Store D @ LOC_1

@3040
D=A	// D = 3040


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@3
D=A


@1
D=D+A	// *3 + offset 1


@LOC_2
M=D	// Storing the address at LOC_2


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_2
A=M
M=D	// Store D @ LOC_2

@32
D=A	// D = 32


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@THIS
D=M


@2
D=D+A	// *THIS + offset 2


@LOC_3
M=D	// Storing the address at LOC_3


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_3
A=M
M=D	// Store D @ LOC_3

@46
D=A	// D = 46


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@THAT
D=M


@6
D=D+A	// *THAT + offset 6


@LOC_4
M=D	// Storing the address at LOC_4


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_4
A=M
M=D	// Store D @ LOC_4

@3
D=A


@0
D=D+A	// *3 + offset 0
A=D
D=M	// D = RAM[*3 + 0]


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

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



@THIS
D=M


@2
D=D+A	// *THIS + offset 2
A=D
D=M	// D = RAM[*THIS + 2]


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



@THAT
D=M


@6
D=D+A	// *THAT + offset 6
A=D
D=M	// D = RAM[*THAT + 6]


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



