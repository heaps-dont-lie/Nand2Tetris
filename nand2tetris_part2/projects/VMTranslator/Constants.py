from enum import Enum

'''
GLOBAL Variables defined below

ConditionTag_ALATB:     Provides unique tag to a Conditional Label.
VariableTag_MEMAPOP:    Provides unique tag to a Variable Label.
FunctionTag_CALL:       Provides unique tag to the 'call'  Function Command.
FunctionTag_SETUP:      Provides unique tag to the 'function' Function Command.
'''
ConditionTag_ALATB          =   1
VariableTag_MEMAPOP         =   1
FunctionTag_CALL            =   1
FunctionTag_SETUP           =   1

'''
CALL_STACK: Keeps track of the call stack
'''
CURRENT_FUNCTION  =   ''


class SystemInitializationAssembly(Enum):
    SYS_INIT    =   [   
                        '//Bootstrap code', '\n',
                        '@256', 'D=A', '\n',
                        '@SP', 'M=D', '\n'
                    ]

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
    
class BranchingConditionAssembly(Enum):
    '''
    {0} -> Label
    {1} -> Function Name
    {2} -> VM File Name
    '''
    BRANCHING_ASMBLY_TYPE_A     =   [
                                        '({1}${0})\t// label declaration command'
                                    ]
    
    BRANCHING_ASMBLY_TYPE_B     =   [
                                        '@{1}${0}', 
                                        '0; JMP\t// Jump unconditionally to the label, {1}${0}'
                                    ]
    
    BRANCHING_ASMBLY_TYPE_C     =   [
                                        '@SP', 'M=M-1', 'A=M', 'D=M\t// Condition =  POP', '\n',
                                        '@{1}${0}', 'D; JNE\t// Jump to label, {1}${0}, if TRUE'
                                    ]
    
    BRANCHING_ASMBLY            =   {
                                        'label'     :   BRANCHING_ASMBLY_TYPE_A,
                                        'goto'      :   BRANCHING_ASMBLY_TYPE_B,
                                        'if-goto'   :   BRANCHING_ASMBLY_TYPE_C  
                                    }
    
class FunctionAssembly(Enum):
    '''
    {0} -> Unique Tag
    {1} -> Function Name
    {2} -> nArgs or nVars
    {3} -> VM File Name
    '''
    FUNCTION_ASMBLY_TYPE_A    =   [
                                        '@{1}$ret.{0}', 'D=A', '\n',
                                        '@SP', 'A=M', 'M=D', '@SP', 
                                        'M=M+1\t// PUSH Return Address', '\n',
                                        '@LCL', 'D=M', '\n',
                                        '@SP', 'A=M', 'M=D', '@SP', 
                                        'M=M+1\t// PUSH LCL', '\n',
                                        '@ARG', 'D=M', '\n',
                                        '@SP', 'A=M', 'M=D', '@SP', 
                                        'M=M+1\t// PUSH ARG', '\n',
                                        '@THIS', 'D=M', '\n',
                                        '@SP', 'A=M', 'M=D', '@SP', 
                                        'M=M+1\t// PUSH THIS', '\n',
                                        '@THAT', 'D=M', '\n',
                                        '@SP', 'A=M', 'M=D', '@SP', 
                                        'M=M+1\t// PUSH THAT', '\n',
                                        '@SP', 'D=M\t// D = SP', '\n',
                                        '@5', 'D=D-A\t// D = SP - 5', '\n',
                                        '@{2}', 'D=D-A\t// D = SP - 5 - nArgs', '\n',
                                        '@ARG', 'M=D\t// ARG = SP - 5 - nArgs', '\n',
                                        '@SP', 'D=M\t// D = SP', '\n',
                                        '@LCL', 'M=D\t// LCL = SP', '\n',
                                        '@{1}', '0; JMP', '\n',
                                        '({1}$ret.{0})', '\n'
                                    ]
    
    FUNCTION_ASMBLY_TYPE_B    =   [
                                        '({1})', '\n',
                                        '@{2}', 'D=A', '\n',
                                        '@COUNT', 'M=D\t// COUNT = nVars', '\n',
                                        '({1}$SETUP.{0})', '@COUNT', 'D=M', '\n',
                                        '@{1}$EXIT_SETUP.{0}', 'D; JEQ\t// Jump if COUNT==0', '\n',
                                        '@0', 'D=A', '\n',
                                        '@SP', 'A=M', 'M=D', '\n',
                                        '@SP', 'M=M+1\t// PUSH 0', '\n',
                                        '@COUNT', 'M=M-1\t// COUNT--', '\n',
                                        '@{1}$SETUP.{0}', '0; JMP', '\n',
                                        '({1}$EXIT_SETUP.{0})', '\n'
                                    ]
    
    FUNCTION_ASMBLY_TYPE_C    =   [
                                        '@LCL', 'D=M', '\n',
                                        '@ENDFRAME', 'M=D\t// ENDFRAME = LCL', 'D=M', '\n',
                                        '@5', 'D=D-A\t// D = ENDFRAME - 5',
                                        'A=D', 'D=M\t// D = *(ENDFRAME - 5)', '\n',
                                        '@RETURN', 'M=D\t// RETURN = *(ENDFRAME - 5)', '\n',
                                        #pop argument 0
                                        '@ARG', 'D=M', '\n',
                                        '@0', 'D=D+A\t// *ARG + offset 0', '\n',
                                        '@LOC_FUNC_TEMP', 
                                        'M=D\t// Storing the address at LOC_FUNC_TEMP', '\n',
                                        '@SP', 'M=M-1', 'A=M', 'D=M\t// D = POP (STACK)', '\n',
                                        '@LOC_FUNC_TEMP', 'A=M',
                                        'M=D\t// Store D @ LOC_FUNC_TEMP', '\n',

                                        '@ARG', 'D=M+1\t// D = ARG + 1', '\n',
                                        '@SP', 'M=D\t// SP = ARG + 1', '\n',

                                        '@ENDFRAME', 'D=M', '@1', 'D=D-A',
                                        'A=D', 'D=M\t// D = *(ENDFRAME - 1)',
                                        '@THAT', 'M=D\t// THAT = *(ENDFRAME - 1)', '\n',
                                        '@ENDFRAME', 'D=M', '@2', 'D=D-A',
                                        'A=D', 'D=M\t// D = *(ENDFRAME - 2)',
                                        '@THIS', 'M=D\t// THIS = *(ENDFRAME - 2)', '\n',
                                        '@ENDFRAME', 'D=M', '@3', 'D=D-A',
                                        'A=D', 'D=M\t// D = *(ENDFRAME - 3)',
                                        '@ARG', 'M=D\t// ARG = *(ENDFRAME - 3)', '\n',
                                        '@ENDFRAME', 'D=M', '@4', 'D=D-A',
                                        'A=D', 'D=M\t// D = *(ENDFRAME - 4)',
                                        '@LCL', 'M=D\t// LCL = *(ENDFRAME - 4)', '\n',

                                        '@RETURN', 'A=M', '0; JMP\t// goto RETURN'
                                    ]
    
    FUNCTION_ASMBLY             =   {
                                        'call'      :   FUNCTION_ASMBLY_TYPE_A,
                                        'function'  :   FUNCTION_ASMBLY_TYPE_B,
                                        'return'    :   FUNCTION_ASMBLY_TYPE_C
                                    }


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

    BRANCHING_CMD               =   ['goto', 'if-goto', 'label']

    FUNCTION_CMD                =   ['call', 'function', 'return']


    #VALID ARGUMENT COUNT
    ARITHMETIC_LOGICAL_ARG_CNT  =   0

    MEMORY_ACCESS_ARG_CNT       =   2

    BRANCHING_ARG_CNT           =   1

    FUNCTION_ARG_CNT            =   2


    #COMMAND TYPE       (<ARGUMENT EXPEXTED>, <VALID COMMANDS LIST>)
    C_ARITHMETIC    =   (ARITHMETIC_LOGICAL_ARG_CNT, ARITHMETIC_LOGICAL_CMD)

    C_MEMORY        =   (MEMORY_ACCESS_ARG_CNT, MEMORY_ACCESS_CMD)

    C_BRANCHING     =   (BRANCHING_ARG_CNT, BRANCHING_CMD)

    C_FUNCTION      =   (FUNCTION_ARG_CNT, FUNCTION_CMD)


    #VALID NON-TRIVIAL SYMBOLS
    MEMORY_SEGMENTS             =   ['local', 'argument', 'this',
                                    'that', 'constant', 'static',
                                    'pointer', 'temp']

    #VALID TRIVIAL SYMBOLS
    COMMENT_SYMBOL              =   '//'    # Ignore this symbol and any thing that comes after it.
