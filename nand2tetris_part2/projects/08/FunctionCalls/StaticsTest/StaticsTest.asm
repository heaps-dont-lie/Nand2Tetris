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



(Class1.set)


@0
D=A


@COUNT
M=D	// COUNT = nVars


(Class1.set$SETUP.1)
@COUNT
D=M


@Class1.set$EXIT_SETUP.1
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


@Class1.set$SETUP.1
0; JMP


(Class1.set$EXIT_SETUP.1)



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
D=M	// D = POP (Stack)


@Class1.0
M=D	// Store D

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
D=M	// D = POP (Stack)


@Class1.1
M=D	// Store D

@0
D=A	// D = 0


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

(Class1.get)


@0
D=A


@COUNT
M=D	// COUNT = nVars


(Class1.get$SETUP.2)
@COUNT
D=M


@Class1.get$EXIT_SETUP.2
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


@Class1.get$SETUP.2
0; JMP


(Class1.get$EXIT_SETUP.2)



@Class1.0
D=M	// D = Static Variable


@SP
A=M
M=D	// Push D part 1


@SP
M=M+1	// Push D part 2

@Class1.1
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


(Sys.init$SETUP.3)
@COUNT
D=M


@Sys.init$EXIT_SETUP.3
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


@Sys.init$SETUP.3
0; JMP


(Sys.init$EXIT_SETUP.3)



@6
D=A	// D = 6


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

@Class1.set$ret.2
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


@2
D=D-A	// D = SP - 5 - nArgs


@ARG
M=D	// ARG = SP - 5 - nArgs


@SP
D=M	// D = SP


@LCL
M=D	// LCL = SP


@Class1.set
0; JMP


(Class1.set$ret.2)



@5
D=A


@0
D=D+A	// *5 + offset 0


@LOC_3
M=D	// Storing the address at LOC_3


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_3
A=M
M=D	// Store D @ LOC_3

@23
D=A	// D = 23


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@15
D=A	// D = 15


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@Class2.set$ret.3
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


@2
D=D-A	// D = SP - 5 - nArgs


@ARG
M=D	// ARG = SP - 5 - nArgs


@SP
D=M	// D = SP


@LCL
M=D	// LCL = SP


@Class2.set
0; JMP


(Class2.set$ret.3)



@5
D=A


@0
D=D+A	// *5 + offset 0


@LOC_4
M=D	// Storing the address at LOC_4


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_4
A=M
M=D	// Store D @ LOC_4

@Class1.get$ret.4
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


@Class1.get
0; JMP


(Class1.get$ret.4)



@Class2.get$ret.5
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


@Class2.get
0; JMP


(Class2.get$ret.5)



(Sys.init$WHILE)	// label declaration command

@Sys.init$WHILE
0; JMP	// Jump unconditionally to the label, Sys.init$WHILE

(Class2.set)


@0
D=A


@COUNT
M=D	// COUNT = nVars


(Class2.set$SETUP.4)
@COUNT
D=M


@Class2.set$EXIT_SETUP.4
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


@Class2.set$SETUP.4
0; JMP


(Class2.set$EXIT_SETUP.4)



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
D=M	// D = POP (Stack)


@Class2.0
M=D	// Store D

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
D=M	// D = POP (Stack)


@Class2.1
M=D	// Store D

@0
D=A	// D = 0


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

(Class2.get)


@0
D=A


@COUNT
M=D	// COUNT = nVars


(Class2.get$SETUP.5)
@COUNT
D=M


@Class2.get$EXIT_SETUP.5
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


@Class2.get$SETUP.5
0; JMP


(Class2.get$EXIT_SETUP.5)



@Class2.0
D=M	// D = Static Variable


@SP
A=M
M=D	// Push D part 1


@SP
M=M+1	// Push D part 2

@Class2.1
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

