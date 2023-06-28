from enum import Enum

ConditionTag_ALATB   =   1
VariableTag_MEMAPOP  =   1

class ArithmeticLogicalAssembly(Enum):

    '''

    TYPE_<N> STRUCTURE: 
        ( { <cmd: cmd_symbol> }, [ <Assembly Instructions> ] )

    TYPE_A: add, sub, and, or
    TYPE_B: gt, lt, eq
    TYPE_C: not, neg

    '''

    TYPE_A  =   (
                    {
                        'add': '+', 'sub': '-',
                        'and': '&', 'or': '|'
                    },
                    [
                        '@SP', 'M=M-1', 'A=M',
                        'D=M\t// POP = A, tmp = A', '\n',
                        '@SP', 'M=M-1', 'A=M',
                        "D=M{}D\t// POP = B, tmp = B {} A", '\n',
                        'M=D\t// PUSH tmp: part 1',
                        '@SP', 'M=M+1\t//PUSH tmp: part 2', '\n'
                    ]
                )

    TYPE_B  =   (
                    {
                        'gt': 'JGT', 'lt': 'JLT', 'eq': 'JEQ'
                    },
                    [
                        '@SP', 'M=M-1', 'A=M',
                        'D=M\t// POP = A, tmp = A', '\n',
                        '@SP', 'M=M-1', 'A=M\t// POP = B', '\n',
                        'D=M-D',
                        '@IF_THEN_{1}', 'D; {}\t// IF B {} A then JUMP @ IF_THEN -> TRUE/1', '\n',
                        '@ELSE_{1}', '0; JMP\t// ELSE, B !{} A -> FALSE/0', '\n',
                        '(IF_THEN_{1})', '\t@SP', '\tA=M', '\tM=-1\t// PUSH part 1', '\n',
                        '@EXIT_COND_{1}', '0; JMP\t// EXIT CONDITION', '\n',
                        '(ELSE_{1})', '\t@SP', '\tA=M', '\tM=0\t// PUSH part 1', '\n',
                        '(EXIT_COND_{1})', '\t@SP', '\tM=M+1\t// PUSH part 2', '\n'
                    ]
                )

    TYPE_C  =   (
                    {
                        'neg': '-', 'not': '!'
                    },
                    [
                        '@SP', 'M=M-1', 'A=M',
                        'D={}M\t// {} is a bit-wise operation',
                        'M=D',
                        '@SP', 'M=M+1'
                    ]
                )

    END_INSTR   =   '(END)\n\t@END\n\t0; JMP\t//END OF INSTRUCTION'

class MemoryAccessAssembly(Enum):

    PUSH_ASMBLY_CONST           =   [
                                        '@{}', 'D=A\t// D = {}', '\n',
                                        '@SP', 'A=M', 'M=D\t// *SP = D', '\n',
                                        '@SP', 'M=M+1\t// SP++'
                                    ]

    PUSH_ASMBLY_SEG_TYPE_A     =   [
                                        '@{0}', 'D=M', '\n',
                                        '@{1}', 'D=D+A\t// *{0} + offset {1}',
                                        'A=D', 'D=M\t// D = RAM[*{0} + {1}]', '\n',
                                        '@SP', 'A=M', 'M=D\t// *SP = D', '\n',
                                        '@SP', 'M=M+1\t// SP++'
                                    ]
    
    POP_ASMBLY_SEG_TYPE_A      =   [
                                        '@{0}', 'D=M', '\n',
                                        '@{1}', 'D=D+A\t// *{0} + offset {1}', '\n',
                                        '@LOC_{2}', 'M=D\t// Storing the address at LOC_{2}', '\n',
                                        '@SP', 'M=M-1', 'A=M', 'D=M\t// D = POP (STACK)', '\n',
                                        '@LOC_{2}', 'A=M', 'M=D\t// Store D @ LOC_{2}' 
                                    ]
    
    PUSH_ASMBLY_SEG_TYPE_B      =   [
                                        '@{0}', 'D=A', '\n',
                                        '@{1}', 'D=D+A\t// *{0} + offset {1}',
                                        'A=D', 'D=M\t// D = RAM[*{0} + {1}]', '\n',
                                        '@SP', 'A=M', 'M=D\t// *SP = D', '\n',
                                        '@SP', 'M=M+1\t// SP++'
                                    ]
    
    POP_ASMBLY_SEG_TYPE_B       =   [
                                        '@{0}', 'D=A', '\n',
                                        '@{1}', 'D=D+A\t// *{0} + offset {1}', '\n',
                                        '@LOC_{2}', 'M=D\t// Storing the address at LOC_{2}', '\n',
                                        '@SP', 'M=M-1', 'A=M', 'D=M\t// D = POP (STACK)', '\n',
                                        '@LOC_{2}', 'A=M', 'M=D\t// Store D @ LOC_{2}'
                                    ]
    
    PUSH_ASMBLY_SEG_TYPE_C      =   [
                                        '@{0}.{1}', 'D=M\t// D = Static Variable', '\n',
                                        '@SP', 'A=M', 'M=D\t// Push D part 1', '\n',
                                        '@SP', 'M=M+1\t// Push D part 2'
                                    ]
    
    POP_ASMBLY_SEG_TYPE_C       =   [
                                        '@SP', 'M=M-1', 'A=M', 'D=M\t// D = POP (Stack)', '\n',
                                        '@{0}.{1}', 'M=D\t// Store D'
                                    ]
    
    MEM_SEG_TYPE_A              =   (
                                       {
                                            'local': 'LCL', 'argument': 'ARG',
                                            'this': 'THIS', 'that': "THAT"
                                        },
                                        PUSH_ASMBLY_SEG_TYPE_A,
                                        POP_ASMBLY_SEG_TYPE_A 
                                    )

    MEM_SEG_TYPE_B              =   (
                                        {
                                            'temp': '5', 'pointer': '3'
                                        },
                                        PUSH_ASMBLY_SEG_TYPE_B,
                                        POP_ASMBLY_SEG_TYPE_B
                                    )

    MEM_SEG_TYPE_C              =   (
                                        {
                                            'static': None
                                        },
                                        PUSH_ASMBLY_SEG_TYPE_C,
                                        POP_ASMBLY_SEG_TYPE_C
                                    )


'''
Class below describes different types of ERROR.
'''

class ErrorTypes(Enum):
    SYNTAX_ERROR = "ERROR: There is a syntax error at line "

'''

CONSTANTS class defined below (More to be added later...)

NOTE Any text beyond the elements mentioned in the CONSTANTS
class below are INVALID and should terminate execution with
an ERROR message.

'''

class CommandInfo(Enum):

    #COMMAND LISTS
    ARITHMETIC_LOGICAL_CMD      =   ['add', 'sub', 'neg', 'eq', 'gt',
                                    'lt', 'and', 'or', 'not']

    MEMORY_ACCESS_CMD           =   ['push', 'pop']


    #VALID ARGUMENT COUNT
    ARITHMETIC_LOGICAL_ARG_CNT  =   0

    MEMORY_ACCESS_ARG_CNT       =   2


    #COMMAND TYPE                   (<ARGUMENT EXPEXTED>, <VALID COMMANDS LIST>)
    C_ARITHMETIC                =   (ARITHMETIC_LOGICAL_ARG_CNT, ARITHMETIC_LOGICAL_CMD)

    C_MEMORY                    =   (MEMORY_ACCESS_ARG_CNT, MEMORY_ACCESS_CMD)


    #VALID NON-TRIVIAL SYMBOLS
    MEMORY_SEGMENTS             =   ['local', 'argument', 'this',
                                    'that', 'constant', 'static',
                                    'pointer', 'temp']

    #VALID TRIVIAL SYMBOLS
    COMMENT_SYMBOL              =   '//'    # Ignore this symbol and any thing that comes after it.
