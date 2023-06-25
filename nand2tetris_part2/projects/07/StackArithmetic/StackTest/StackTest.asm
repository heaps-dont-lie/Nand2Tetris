@17
D=A	// D = 17


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@17
D=A	// D = 17


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
A=M	// POP = B


D=M-D
@IF_THEN_1
D; JEQ	// IF B JEQ A then JUMP @ IF_THEN -> TRUE/1


@ELSE_1
0; JMP	// ELSE, B !JEQ A -> FALSE/0


(IF_THEN_1)
	@SP
	A=M
	M=-1	// PUSH part 1


@EXIT_COND_1
0; JMP	// EXIT CONDITION


(ELSE_1)
	@SP
	A=M
	M=0	// PUSH part 1


(EXIT_COND_1)
	@SP
	M=M+1	// PUSH part 2



@17
D=A	// D = 17


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@16
D=A	// D = 16


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
A=M	// POP = B


D=M-D
@IF_THEN_2
D; JEQ	// IF B JEQ A then JUMP @ IF_THEN -> TRUE/1


@ELSE_2
0; JMP	// ELSE, B !JEQ A -> FALSE/0


(IF_THEN_2)
	@SP
	A=M
	M=-1	// PUSH part 1


@EXIT_COND_2
0; JMP	// EXIT CONDITION


(ELSE_2)
	@SP
	A=M
	M=0	// PUSH part 1


(EXIT_COND_2)
	@SP
	M=M+1	// PUSH part 2



@16
D=A	// D = 16


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@17
D=A	// D = 17


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
A=M	// POP = B


D=M-D
@IF_THEN_3
D; JEQ	// IF B JEQ A then JUMP @ IF_THEN -> TRUE/1


@ELSE_3
0; JMP	// ELSE, B !JEQ A -> FALSE/0


(IF_THEN_3)
	@SP
	A=M
	M=-1	// PUSH part 1


@EXIT_COND_3
0; JMP	// EXIT CONDITION


(ELSE_3)
	@SP
	A=M
	M=0	// PUSH part 1


(EXIT_COND_3)
	@SP
	M=M+1	// PUSH part 2



@892
D=A	// D = 892


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@891
D=A	// D = 891


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
A=M	// POP = B


D=M-D
@IF_THEN_4
D; JLT	// IF B JLT A then JUMP @ IF_THEN -> TRUE/1


@ELSE_4
0; JMP	// ELSE, B !JLT A -> FALSE/0


(IF_THEN_4)
	@SP
	A=M
	M=-1	// PUSH part 1


@EXIT_COND_4
0; JMP	// EXIT CONDITION


(ELSE_4)
	@SP
	A=M
	M=0	// PUSH part 1


(EXIT_COND_4)
	@SP
	M=M+1	// PUSH part 2



@891
D=A	// D = 891


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@892
D=A	// D = 892


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
A=M	// POP = B


D=M-D
@IF_THEN_5
D; JLT	// IF B JLT A then JUMP @ IF_THEN -> TRUE/1


@ELSE_5
0; JMP	// ELSE, B !JLT A -> FALSE/0


(IF_THEN_5)
	@SP
	A=M
	M=-1	// PUSH part 1


@EXIT_COND_5
0; JMP	// EXIT CONDITION


(ELSE_5)
	@SP
	A=M
	M=0	// PUSH part 1


(EXIT_COND_5)
	@SP
	M=M+1	// PUSH part 2



@891
D=A	// D = 891


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@891
D=A	// D = 891


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
A=M	// POP = B


D=M-D
@IF_THEN_6
D; JLT	// IF B JLT A then JUMP @ IF_THEN -> TRUE/1


@ELSE_6
0; JMP	// ELSE, B !JLT A -> FALSE/0


(IF_THEN_6)
	@SP
	A=M
	M=-1	// PUSH part 1


@EXIT_COND_6
0; JMP	// EXIT CONDITION


(ELSE_6)
	@SP
	A=M
	M=0	// PUSH part 1


(EXIT_COND_6)
	@SP
	M=M+1	// PUSH part 2



@32767
D=A	// D = 32767


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@32766
D=A	// D = 32766


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
A=M	// POP = B


D=M-D
@IF_THEN_7
D; JGT	// IF B JGT A then JUMP @ IF_THEN -> TRUE/1


@ELSE_7
0; JMP	// ELSE, B !JGT A -> FALSE/0


(IF_THEN_7)
	@SP
	A=M
	M=-1	// PUSH part 1


@EXIT_COND_7
0; JMP	// EXIT CONDITION


(ELSE_7)
	@SP
	A=M
	M=0	// PUSH part 1


(EXIT_COND_7)
	@SP
	M=M+1	// PUSH part 2



@32766
D=A	// D = 32766


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@32767
D=A	// D = 32767


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
A=M	// POP = B


D=M-D
@IF_THEN_8
D; JGT	// IF B JGT A then JUMP @ IF_THEN -> TRUE/1


@ELSE_8
0; JMP	// ELSE, B !JGT A -> FALSE/0


(IF_THEN_8)
	@SP
	A=M
	M=-1	// PUSH part 1


@EXIT_COND_8
0; JMP	// EXIT CONDITION


(ELSE_8)
	@SP
	A=M
	M=0	// PUSH part 1


(EXIT_COND_8)
	@SP
	M=M+1	// PUSH part 2



@32766
D=A	// D = 32766


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@32766
D=A	// D = 32766


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
A=M	// POP = B


D=M-D
@IF_THEN_9
D; JGT	// IF B JGT A then JUMP @ IF_THEN -> TRUE/1


@ELSE_9
0; JMP	// ELSE, B !JGT A -> FALSE/0


(IF_THEN_9)
	@SP
	A=M
	M=-1	// PUSH part 1


@EXIT_COND_9
0; JMP	// EXIT CONDITION


(ELSE_9)
	@SP
	A=M
	M=0	// PUSH part 1


(EXIT_COND_9)
	@SP
	M=M+1	// PUSH part 2



@57
D=A	// D = 57


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@31
D=A	// D = 31


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@53
D=A	// D = 53


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



@112
D=A	// D = 112


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



@SP
M=M-1
A=M
D=-M	// - is a bit-wise operation
M=D
@SP
M=M+1

@SP
M=M-1
A=M
D=M	// POP = A, tmp = A


@SP
M=M-1
A=M
D=M&D	// POP = B, tmp = B & A


M=D	// PUSH tmp: part 1
@SP
M=M+1	//PUSH tmp: part 2



@82
D=A	// D = 82


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
D=M|D	// POP = B, tmp = B | A


M=D	// PUSH tmp: part 1
@SP
M=M+1	//PUSH tmp: part 2



@SP
M=M-1
A=M
D=!M	// ! is a bit-wise operation
M=D
@SP
M=M+1

