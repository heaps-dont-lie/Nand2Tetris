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



(Sys.init)


@0
D=A


@COUNT
M=D	// COUNT = nVars


(Sys.init$SETUP.1)
@COUNT
D=M


@Sys.init$EXIT_SETUP.1
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


@Sys.init$SETUP.1
0; JMP


(Sys.init$EXIT_SETUP.1)



@4000
D=A	// D = 4000


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

@5000
D=A	// D = 5000


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

@Sys.main$ret.2
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


@Sys.main
0; JMP


(Sys.main$ret.2)



@5
D=A


@1
D=D+A	// *5 + offset 1


@LOC_3
M=D	// Storing the address at LOC_3


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_3
A=M
M=D	// Store D @ LOC_3

(Sys.init$LOOP)	// label declaration command

@Sys.init$LOOP
0; JMP	// Jump unconditionally to the label, Sys.init$LOOP

(Sys.main)


@5
D=A


@COUNT
M=D	// COUNT = nVars


(Sys.main$SETUP.2)
@COUNT
D=M


@Sys.main$EXIT_SETUP.2
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


@Sys.main$SETUP.2
0; JMP


(Sys.main$EXIT_SETUP.2)



@4001
D=A	// D = 4001


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@3
D=A


@0
D=D+A	// *3 + offset 0


@LOC_4
M=D	// Storing the address at LOC_4


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_4
A=M
M=D	// Store D @ LOC_4

@5001
D=A	// D = 5001


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@3
D=A


@1
D=D+A	// *3 + offset 1


@LOC_5
M=D	// Storing the address at LOC_5


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_5
A=M
M=D	// Store D @ LOC_5

@200
D=A	// D = 200


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@LCL
D=M


@1
D=D+A	// *LCL + offset 1


@LOC_6
M=D	// Storing the address at LOC_6


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_6
A=M
M=D	// Store D @ LOC_6

@40
D=A	// D = 40


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@LCL
D=M


@2
D=D+A	// *LCL + offset 2


@LOC_7
M=D	// Storing the address at LOC_7


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_7
A=M
M=D	// Store D @ LOC_7

@6
D=A	// D = 6


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@LCL
D=M


@3
D=D+A	// *LCL + offset 3


@LOC_8
M=D	// Storing the address at LOC_8


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_8
A=M
M=D	// Store D @ LOC_8

@123
D=A	// D = 123


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@Sys.add12$ret.3
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


@Sys.add12
0; JMP


(Sys.add12$ret.3)



@5
D=A


@0
D=D+A	// *5 + offset 0


@LOC_9
M=D	// Storing the address at LOC_9


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_9
A=M
M=D	// Store D @ LOC_9

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

@LCL
D=M


@2
D=D+A	// *LCL + offset 2
A=D
D=M	// D = RAM[*LCL + 2]


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@LCL
D=M


@3
D=D+A	// *LCL + offset 3
A=D
D=M	// D = RAM[*LCL + 3]


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@LCL
D=M


@4
D=D+A	// *LCL + offset 4
A=D
D=M	// D = RAM[*LCL + 4]


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

(Sys.add12)


@0
D=A


@COUNT
M=D	// COUNT = nVars


(Sys.add12$SETUP.3)
@COUNT
D=M


@Sys.add12$EXIT_SETUP.3
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


@Sys.add12$SETUP.3
0; JMP


(Sys.add12$EXIT_SETUP.3)



@4002
D=A	// D = 4002


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@3
D=A


@0
D=D+A	// *3 + offset 0


@LOC_10
M=D	// Storing the address at LOC_10


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_10
A=M
M=D	// Store D @ LOC_10

@5002
D=A	// D = 5002


@SP
A=M
M=D	// *SP = D


@SP
M=M+1	// SP++

@3
D=A


@1
D=D+A	// *3 + offset 1


@LOC_11
M=D	// Storing the address at LOC_11


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_11
A=M
M=D	// Store D @ LOC_11

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

@12
D=A	// D = 12


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

