from enum import Enum

ConditionTag = 1

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

    PUSH_ASMBLY_CONST   =   [
                                '@{}', 'D=A\t// D = {}', '\n',
                                '@SP', 'A=M', 'M=D\t// *SP = D', '\n',
                                '@SP', 'M=M+1\t// SP++'
                            ]

    PUSH_ASMBLY_SEG     =   [
                                '@{0}', 'A=M', 'D=A', '\n',
                                '@{1}', 'D=D+A\t// *{0} + offset {1}',
                                'A=D', 'D=M\t// D = RAM[*{0} + {1}]', '\n',
                                '@SP', 'A=M', 'M=D\t// *SP = D', '\n',
                                '@SP', 'M=M+1\t// SP++'
                            ]



class CodeWriter:
    def __init__(self, asmCodeFile):
        self.asmCodeFileHandle = open(asmCodeFile, 'w')

    def writeArithmetic(self, cmdInfo):

        '''

        cmdInfo = <{'cmdtype': CMDType, 'cmd': cmd, 'arg1': arg1, 'arg2': arg2}>

        '''

        _, cmd, _, _ = cmdInfo['cmdtype'], cmdInfo['cmd'], cmdInfo['arg1'], cmdInfo['arg2']
        ALType = self.getArithmeticLogicalType(cmd)
        global ConditionTag

        if ALType is not None:
            op = ALType.value[0][cmd]
            for instr in ALType.value[1]:
                if '{}' in instr:    # check for placeholder and format instruction if it exists
                    instr = instr.format(op, op)
                if '{1}' in instr:
                    print(instr)
                    instr = instr.format('', ConditionTag)
                self.asmCodeFileHandle.write(instr + '\n')
            self.asmCodeFileHandle.write('\n')
            ConditionTag += 1

        else:
            #TODO ERROR
            pass


    def getArithmeticLogicalType(self, cmd) -> ArithmeticLogicalAssembly:
        if cmd in ArithmeticLogicalAssembly.TYPE_A.value[0].keys():
            return ArithmeticLogicalAssembly.TYPE_A

        elif cmd in ArithmeticLogicalAssembly.TYPE_B.value[0].keys():
            return ArithmeticLogicalAssembly.TYPE_B

        elif cmd in ArithmeticLogicalAssembly.TYPE_C.value[0].keys():
            return ArithmeticLogicalAssembly.TYPE_C 

        return None

    def writePushPop(self, cmdInfo):

        '''

        cmdInfo = <{'cmdtype': CMDType, 'cmd': cmd, 'arg1': arg1, 'arg2': arg2}>

        '''

        CMDType, cmd, arg1, arg2 = cmdInfo['cmdtype'], cmdInfo['cmd'], cmdInfo['arg1'], cmdInfo['arg2']

        for instr in MemoryAccessAssembly.PUSH_ASMBLY_CONST.value:
            if '{}' in instr:    # check for placeholder and format instruction if it exists
                instr = instr.format(arg2)
            self.asmCodeFileHandle.write(instr + '\n')
        self.asmCodeFileHandle.write('\n')