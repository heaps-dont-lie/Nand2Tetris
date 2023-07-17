//Bootstrap code


@256
D=A


@SP
M=D


@Sys.init$ret.1
D=A


@SP
A=M
M=D
@SP
M=M+1	// PUSH Return Address


@LCL
D=M


@SP
A=M
M=D
@SP
M=M+1	// PUSH LCL


@ARG
D=M


@SP
A=M
M=D
@SP
M=M+1	// PUSH ARG


@THIS
D=M


@SP
A=M
M=D
@SP
M=M+1	// PUSH THIS


@THAT
D=M


@SP
A=M
M=D
@SP
M=M+1	// PUSH THAT


@SP
D=M	// D = SP


@5
D=D-A	// D = SP - 5


@0
D=D-A	// D = SP - 5 - nArgs


@ARG
M=D	// ARG = SP - 5 - nArgs


@SP
D=M	// D = SP


@LCL
M=D	// LCL = SP


@Sys.init
0; JMP


(Sys.init$ret.1)



(Main.fibonacci)


@0
D=A


@COUNT
M=D	// COUNT = nVars


(Main.fibonacci$SETUP.1)
@COUNT
D=M


@Main.fibonacci$EXIT_SETUP.1
D; JEQ	// Jump if COUNT==0


@0
D=A


@SP
A=M
M=D


@SP
M=M+1	// PUSH 0


@COUNT
M=M-1	// COUNT--


@Main.fibonacci$SETUP.1
0; JMP


(Main.fibonacci$EXIT_SETUP.1)



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
A=M	// POP = B


D=M-D
@IF_THEN_1
D; JLT	// IF B JLT A then JUMP @ IF_THEN -> TRUE/1


@ELSE_1
0; JMP	// ELSE, B !JLT A -> FALSE/0


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



@SP
M=M-1
A=M
D=M	// Condition =  POP


@Main.fibonacci$IF_TRUE
D; JNE	// Jump to label, Main.fibonacci$IF_TRUE, if TRUE

@Main.fibonacci$IF_FALSE
0; JMP	// Jump unconditionally to the label, Main.fibonacci$IF_FALSE

(Main.fibonacci$IF_TRUE)	// label declaration command

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


@ENDFRAME
M=D	// ENDFRAME = LCL
D=M


@5
D=D-A	// D = ENDFRAME - 5
A=D
D=M	// D = *(ENDFRAME - 5)


@RETURN
M=D	// RETURN = *(ENDFRAME - 5)


@ARG
D=M


@0
D=D+A	// *ARG + offset 0


@LOC_FUNC_TEMP
M=D	// Storing the address at LOC_FUNC_TEMP


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_FUNC_TEMP
A=M
M=D	// Store D @ LOC_FUNC_TEMP


@ARG
D=M+1	// D = ARG + 1


@SP
M=D	// SP = ARG + 1


@ENDFRAME
D=M
@1
D=D-A
A=D
D=M	// D = *(ENDFRAME - 1)
@THAT
M=D	// THAT = *(ENDFRAME - 1)


@ENDFRAME
D=M
@2
D=D-A
A=D
D=M	// D = *(ENDFRAME - 2)
@THIS
M=D	// THIS = *(ENDFRAME - 2)


@ENDFRAME
D=M
@3
D=D-A
A=D
D=M	// D = *(ENDFRAME - 3)
@ARG
M=D	// ARG = *(ENDFRAME - 3)


@ENDFRAME
D=M
@4
D=D-A
A=D
D=M	// D = *(ENDFRAME - 4)
@LCL
M=D	// LCL = *(ENDFRAME - 4)


@RETURN
A=M
0; JMP	// goto RETURN

(Main.fibonacci$IF_FALSE)	// label declaration command

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



@Main.fibonacci$ret.2
D=A


@SP
A=M
M=D
@SP
M=M+1	// PUSH Return Address


@LCL
D=M


@SP
A=M
M=D
@SP
M=M+1	// PUSH LCL


@ARG
D=M


@SP
A=M
M=D
@SP
M=M+1	// PUSH ARG


@THIS
D=M


@SP
A=M
M=D
@SP
M=M+1	// PUSH THIS


@THAT
D=M


@SP
A=M
M=D
@SP
M=M+1	// PUSH THAT


@SP
D=M	// D = SP


@5
D=D-A	// D = SP - 5


@1
D=D-A	// D = SP - 5 - nArgs


@ARG
M=D	// ARG = SP - 5 - nArgs


@SP
D=M	// D = SP


@LCL
M=D	// LCL = SP


@Main.fibonacci
0; JMP


(Main.fibonacci$ret.2)



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



@Main.fibonacci$ret.3
D=A


@SP
A=M
M=D
@SP
M=M+1	// PUSH Return Address


@LCL
D=M


@SP
A=M
M=D
@SP
M=M+1	// PUSH LCL


@ARG
D=M


@SP
A=M
M=D
@SP
M=M+1	// PUSH ARG


@THIS
D=M


@SP
A=M
M=D
@SP
M=M+1	// PUSH THIS


@THAT
D=M


@SP
A=M
M=D
@SP
M=M+1	// PUSH THAT


@SP
D=M	// D = SP


@5
D=D-A	// D = SP - 5


@1
D=D-A	// D = SP - 5 - nArgs


@ARG
M=D	// ARG = SP - 5 - nArgs


@SP
D=M	// D = SP


@LCL
M=D	// LCL = SP


@Main.fibonacci
0; JMP


(Main.fibonacci$ret.3)



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


@ENDFRAME
M=D	// ENDFRAME = LCL
D=M


@5
D=D-A	// D = ENDFRAME - 5
A=D
D=M	// D = *(ENDFRAME - 5)


@RETURN
M=D	// RETURN = *(ENDFRAME - 5)


@ARG
D=M


@0
D=D+A	// *ARG + offset 0


@LOC_FUNC_TEMP
M=D	// Storing the address at LOC_FUNC_TEMP


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_FUNC_TEMP
A=M
M=D	// Store D @ LOC_FUNC_TEMP


@ARG
D=M+1	// D = ARG + 1


@SP
M=D	// SP = ARG + 1


@ENDFRAME
D=M
@1
D=D-A
A=D
D=M	// D = *(ENDFRAME - 1)
@THAT
M=D	// THAT = *(ENDFRAME - 1)


@ENDFRAME
D=M
@2
D=D-A
A=D
D=M	// D = *(ENDFRAME - 2)
@THIS
M=D	// THIS = *(ENDFRAME - 2)


@ENDFRAME
D=M
@3
D=D-A
A=D
D=M	// D = *(ENDFRAME - 3)
@ARG
M=D	// ARG = *(ENDFRAME - 3)


@ENDFRAME
D=M
@4
D=D-A
A=D
D=M	// D = *(ENDFRAME - 4)
@LCL
M=D	// LCL = *(ENDFRAME - 4)


@RETURN
A=M
0; JMP	// goto RETURN

(Sys.init)


@0
D=A


@COUNT
M=D	// COUNT = nVars


(Sys.init$SETUP.2)
@COUNT
D=M


@Sys.init$EXIT_SETUP.2
D; JEQ	// Jump if COUNT==0


@0
D=A


@SP
A=M
M=D


@SP
M=M+1	// PUSH 0


@COUNT
M=M-1	// COUNT--


@Sys.init$SETUP.2
0; JMP


(Sys.init$EXIT_SETUP.2)



@4
D=A	// D = 4


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@Main.fibonacci$ret.4
D=A


@SP
A=M
M=D
@SP
M=M+1	// PUSH Return Address


@LCL
D=M


@SP
A=M
M=D
@SP
M=M+1	// PUSH LCL


@ARG
D=M


@SP
A=M
M=D
@SP
M=M+1	// PUSH ARG


@THIS
D=M


@SP
A=M
M=D
@SP
M=M+1	// PUSH THIS


@THAT
D=M


@SP
A=M
M=D
@SP
M=M+1	// PUSH THAT


@SP
D=M	// D = SP


@5
D=D-A	// D = SP - 5


@1
D=D-A	// D = SP - 5 - nArgs


@ARG
M=D	// ARG = SP - 5 - nArgs


@SP
D=M	// D = SP


@LCL
M=D	// LCL = SP


@Main.fibonacci
0; JMP


(Main.fibonacci$ret.4)



(Sys.init$WHILE)	// label declaration command

@Sys.init$WHILE
0; JMP	// Jump unconditionally to the label, Sys.init$WHILE

