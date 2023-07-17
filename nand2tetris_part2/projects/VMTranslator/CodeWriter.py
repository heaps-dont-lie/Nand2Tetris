import os
from Constants import *

class CodeWriter:
    def __init__(self, asmCodeFile, vmCodeFile_truncated):
        self.asmCodeFileHandle = open(asmCodeFile, 'a')
        self.vmCodeFile = vmCodeFile_truncated

    def writeBootstrap(self):
        for instr in SystemInitializationAssembly.SYS_INIT.value:
            self.asmCodeFileHandle.write(instr + '\n')
        self.writeFunction({'cmdtype': CommandInfo.C_FUNCTION, 'cmd': 'call', 'arg1': 'Sys.init', 'arg2': 0})

    def writeArithmetic(self, cmdInfo):

        '''

        cmdInfo = <{'cmdtype': CMDType, 'cmd': cmd, 'arg1': arg1, 'arg2': arg2}>

        '''

        _, cmd, _, _ = cmdInfo['cmdtype'], cmdInfo['cmd'], cmdInfo['arg1'], cmdInfo['arg2']
        ALType = self.getArithmeticLogicalType(cmd)
        global ConditionTag_ALATB

        if ALType is not None:
            op = ALType.value[0][cmd]
            for instr in ALType.value[1]:
                if '{}' in instr:    # check for placeholder and format instruction if it exists
                    instr = instr.format(op, op)
                if '{1}' in instr:
                    instr = instr.format('', ConditionTag_ALATB)
                self.asmCodeFileHandle.write(instr + '\n')
            self.asmCodeFileHandle.write('\n')
            ConditionTag_ALATB += 1

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

    def writePushPop(self, cmdInfo):

        '''

        cmdInfo = <{'cmdtype': CMDType, 'cmd': cmd, 'arg1': arg1, 'arg2': arg2}>

        '''
        
        CMDType, cmd, arg1, arg2 = cmdInfo['cmdtype'], cmdInfo['cmd'], cmdInfo['arg1'], cmdInfo['arg2']
        global VariableTag_MEMAPOP

        if cmd == 'push':
            if arg1 == 'constant':
                for instr in MemoryAccessAssembly.PUSH_ASMBLY_CONST.value:
                    if '{}' in instr:    # check for placeholder and format instruction if it exists
                        instr = instr.format(arg2)
                    self.asmCodeFileHandle.write(instr + '\n')
            else:   # local/argument/this/that/temp/pointer/static
                MSType = self.getMemorySegmentType(arg1)
                if MSType == MemoryAccessAssembly.MEM_SEG_TYPE_C:
                    arg1 = self.vmCodeFile
                else:
                    arg1 = MSType.value[0][arg1]
                for instr in MSType.value[1]:
                    if ('{0}' in instr) or ('{1}' in instr):    # check for placeholder and format instruction if it exists
                        instr = instr.format(arg1, arg2)
                    self.asmCodeFileHandle.write(instr + '\n')

        elif cmd == 'pop':   # pop
            MSType = self.getMemorySegmentType(arg1)
            if MSType == MemoryAccessAssembly.MEM_SEG_TYPE_C:
                arg1 = self.vmCodeFile
            else:
                arg1 = MSType.value[0][arg1]
            for instr in MSType.value[2]:
                if ('{0}' in instr) or ('{1}' in instr) or ('{2}' in instr):
                    instr = instr.format(arg1, arg2, VariableTag_MEMAPOP)
                self.asmCodeFileHandle.write(instr + '\n')
            VariableTag_MEMAPOP += 1

        self.asmCodeFileHandle.write('\n')

    def getMemorySegmentType(self, seg) -> MemoryAccessAssembly:
        if seg in MemoryAccessAssembly.MEM_SEG_TYPE_A.value[0].keys():
            return MemoryAccessAssembly.MEM_SEG_TYPE_A
        elif seg in MemoryAccessAssembly.MEM_SEG_TYPE_B.value[0].keys():
            return MemoryAccessAssembly.MEM_SEG_TYPE_B
        else:
            return MemoryAccessAssembly.MEM_SEG_TYPE_C


    def writeBranchingCondition(self, cmdInfo):
        '''

        cmdInfo = <{'cmdtype': CMDType, 'cmd': cmd, 'arg1': arg1, 'arg2': arg2}>

        '''
        global CURRENT_FUNCTION

        _, cmd, arg1, _ = cmdInfo['cmdtype'], cmdInfo['cmd'], cmdInfo['arg1'], cmdInfo['arg2']

        for instr in BranchingConditionAssembly.BRANCHING_ASMBLY.value[cmd]:
            if ('{0}' in instr) or ('{1}' in instr):
                instr = instr.format(arg1, CURRENT_FUNCTION)
            self.asmCodeFileHandle.write(instr + '\n')
        self.asmCodeFileHandle.write('\n')

    def writeFunction(self, cmdInfo):
        '''

        cmdInfo = <{'cmdtype': CMDType, 'cmd': cmd, 'arg1': arg1, 'arg2': arg2}>

        '''
        _, cmd, arg1, arg2 = cmdInfo['cmdtype'], cmdInfo['cmd'], cmdInfo['arg1'], cmdInfo['arg2']
        global FunctionTag_CALL
        global FunctionTag_SETUP
        global CURRENT_FUNCTION

        for instr in FunctionAssembly.FUNCTION_ASMBLY.value[cmd]:
            if ('{0}' in instr) or ('{1}' in instr) or ('{2}' in instr):
                instr = instr.format(FunctionTag_CALL if cmd=='call' else FunctionTag_SETUP, arg1, arg2)
            self.asmCodeFileHandle.write(instr + '\n')
        self.asmCodeFileHandle.write('\n')

        if cmd == 'call':
            FunctionTag_CALL += 1
        elif cmd == 'function':
            CURRENT_FUNCTION = arg1
            FunctionTag_SETUP += 1
        elif cmd == 'return':
            pass

        