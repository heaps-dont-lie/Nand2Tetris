@LCL
D=M


@3
D=D+A	// *LCL + offset 3


@LOC_1
M=D	// Storing the address at LOC_1


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_1
A=M
M=D	// Store D @ LOC_1

@LCL
D=M


@5
D=D+A	// *LCL + offset 5


@LOC_2
M=D	// Storing the address at LOC_2


@SP
M=M-1
A=M
D=M	// D = POP (STACK)


@LOC_2
A=M
M=D	// Store D @ LOC_2

