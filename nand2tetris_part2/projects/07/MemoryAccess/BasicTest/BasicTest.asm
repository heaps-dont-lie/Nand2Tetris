@10
D=A	// D = 10


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

@21
D=A	// D = 21


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@22
D=A	// D = 22


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@ARG
D=M


@2
D=D+A	// *ARG + offset 2


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


@1
D=D+A	// *ARG + offset 1


@LOC_3
M=D	// Storing the address at LOC_3


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_3
A=M
M=D	// Store D @ LOC_3

@36
D=A	// D = 36


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@THIS
D=M


@6
D=D+A	// *THIS + offset 6


@LOC_4
M=D	// Storing the address at LOC_4


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_4
A=M
M=D	// Store D @ LOC_4

@42
D=A	// D = 42


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@45
D=A	// D = 45


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@THAT
D=M


@5
D=D+A	// *THAT + offset 5


@LOC_5
M=D	// Storing the address at LOC_5


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_5
A=M
M=D	// Store D @ LOC_5

@THAT
D=M


@2
D=D+A	// *THAT + offset 2


@LOC_6
M=D	// Storing the address at LOC_6


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_6
A=M
M=D	// Store D @ LOC_6

@510
D=A	// D = 510


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@5
D=A


@6
D=D+A	// *5 + offset 6


@LOC_7
M=D	// Storing the address at LOC_7


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_7
A=M
M=D	// Store D @ LOC_7

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

@THAT
D=M


@5
D=D+A	// *THAT + offset 5
A=D
D=M	// D = RAM[*THAT + 5]


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



@THIS
D=M


@6
D=D+A	// *THIS + offset 6
A=D
D=M	// D = RAM[*THIS + 6]


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@THIS
D=M


@6
D=D+A	// *THIS + offset 6
A=D
D=M	// D = RAM[*THIS + 6]


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



@5
D=A


@6
D=D+A	// *5 + offset 6
A=D
D=M	// D = RAM[*5 + 6]


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



