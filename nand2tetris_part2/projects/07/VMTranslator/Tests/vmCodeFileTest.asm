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
A=M	// POP = B


D=M-D
@IF_THEN
D; JGT	// IF B JGT A then JUMP @ IF_THEN -> TRUE/1


@ELSE
0; JMP	// ELSE, B !JGT A -> FALSE/0


(IF_THEN)
	@SP
	A=M
	M=1	// PUSH part 1


@EXIT_COND
0; JMP	// EXIT CONDITION


(ELSE)
	@SP
	A=M
	M=0	// PUSH part 1


(EXIT_COND)
	@SP
	M=M+1	// PUSH part 2



