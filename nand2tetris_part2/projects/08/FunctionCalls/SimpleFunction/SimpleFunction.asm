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



(SimpleFunction.test)


@2
D=A


@COUNT
M=D	// COUNT = nVars


(SimpleFunction.test$SETUP.1)
@COUNT
D=M


@SimpleFunction.test$EXIT_SETUP.1
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


@SimpleFunction.test$SETUP.1
0; JMP


(SimpleFunction.test$EXIT_SETUP.1)



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

@LCL
D=M


@1
D=D+A	// *LCL + offset 1
A=D
D=M	// D = RAM[*LCL + 1]


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
D=!M	// ! is a bit-wise operation
M=D
@SP
M=M+1

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

