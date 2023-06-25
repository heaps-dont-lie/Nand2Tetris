@7
D=A	// D = 7


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@8
D=A	// D = 8


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



