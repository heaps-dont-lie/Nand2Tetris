from enum import Enum

op = None

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
                        '@IF_THEN', 'D; {}\t// IF B {} A then JUMP @ IF_THEN -> TRUE/1', '\n',
                        '@ELSE', '0; JMP\t// ELSE, B !{} A -> FALSE/0', '\n',
                        '(IF_THEN)', '\t@SP', '\tA=M', '\tM=1\t// PUSH part 1', '\n',
                        '@EXIT_COND', '0; JMP\t// EXIT CONDITION', '\n',
                        '(ELSE)', '\t@SP', '\tA=M', '\tM=0\t// PUSH part 1', '\n',
                        '(EXIT_COND)', '\t@SP', '\tM=M+1\t// PUSH part 2', '\n'
                    ]
                )

    TYPE_C  =   (
                    {
                        'neg': '-', 'not': '!'
                    },

                    [
                        '@SP', 'M=M-1', 'A=M',
                        'D={}M\t// {} is a bit-wise operation',
                        '@SP', 'M=M+1'
                    ]
                )

    END_INSTR   =   '(END)\n\t@END\n\t0; JMP\t//END OF INSTRUCTION'


class CodeWriter:
    def __init__(self, asmCodeFile, vmCMDList):
        self.asmCodeFileHandle = open(asmCodeFile, 'w')
        self.vmCMDList = vmCMDList[:]
        self.initiate()

    def initiate(self):
        for vmCmd in self.vmCMDList:
            self.writeArithmetic(vmCmd)
        self.asmCodeFileHandle.close()

    def writeArithmetic(self, cmdInfo):
        '''

        cmdInfo = {'cmdtype': CMDType, 'cmd': cmd, 'arg1': arg1, 'arg2': arg2}

        '''

        CMDType, cmd, arg1, arg2 = cmdInfo['cmdtype'], cmdInfo['cmd'], cmdInfo['arg1'], cmdInfo['arg2']
        ALType = self.getArithmeticLogicalType(cmd)

        if ALType is not None:
            op = ALType[0][cmd]
            for instr in ALType[1]:
                if '{}' in instr:    # check for placeholder and format instruction if it exists
                    instr = instr.format(op, op)
                self.asmCodeFileHandle.write(instr + '\n')
            self.asmCodeFileHandle.write('\n')

        else:
            #TODO ERROR
            pass


    def getArithmeticLogicalType(self, cmd) -> ArithmeticLogicalAssembly:
        if cmd in ArithmeticLogicalAssembly.TYPE_A.value[0].keys():
            return ArithmeticLogicalAssembly.TYPE_A.value

        elif cmd in ArithmeticLogicalAssembly.TYPE_B.value[0].keys():
            return ArithmeticLogicalAssembly.TYPE_B.value

        # else:
        #     return ArithmeticLogicalAssembly.TYPE_C.value 

        return None

    def writePushPop(self, cmd):
        #TODO
        pass