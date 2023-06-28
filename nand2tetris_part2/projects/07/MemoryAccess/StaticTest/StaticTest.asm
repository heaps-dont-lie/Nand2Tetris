@111
D=A	// D = 111


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@333
D=A	// D = 333


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@888
D=A	// D = 888


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@SP
M=M-1
A=M
D=M	// D = POP (Stack)


@StaticTest.8
M=D	// Store D

@SP
M=M-1
A=M
D=M	// D = POP (Stack)


@StaticTest.3
M=D	// Store D

@SP
M=M-1
A=M
D=M	// D = POP (Stack)


@StaticTest.1
M=D	// Store D

@StaticTest.3
D=M	// D = Static Variable


@SP
A=M
M=D	// Push D part 1


@SP
M=M+1	// Push D part 2

@StaticTest.1
D=M	// D = Static Variable


@SP
A=M
M=D	// Push D part 1


@SP
M=M+1	// Push D part 2

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



@StaticTest.8
D=M	// D = Static Variable


@SP
A=M
M=D	// Push D part 1


@SP
M=M+1	// Push D part 2

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



