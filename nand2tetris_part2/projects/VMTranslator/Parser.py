import re
import sys
from typing import List
from Constants import ErrorTypes, CommandInfo

class Parser:

    '''

    vmCMDList : Each element is a single VM command. 
                List: [{cmdType: <CMDTYPE>, cmd: <CMD>, arg1: <ARG1>, arg2: <ARG2>}]

    flattenVMCodeFile() : Fill 'vmCMDList', that is, 'flatten' the .vm file.

    '''

    def __init__(self, vmCodeFile):
        self.vmCodeFileHandle = open(vmCodeFile, 'r')
        self.vmCMDList = []
        self.currentCMD = ''    

        self.flattenVMCodeFile()

    def flattenVMCodeFile(self):

        for lineNumber, line in enumerate(self.vmCodeFileHandle, start=1):
            singleLine = re.split(r'\s+', line.strip())
            if singleLine != ['']:  #SKIP EMPTY lines.
                self.categorizeCommand(singleLine, lineNumber)

    def categorizeCommand(self, commandList: List[str], lineNumber: int):

        i, jmp = 0, 0
        while i < len(commandList):
            if commandList[i] == CommandInfo.COMMENT_SYMBOL.value or commandList[i][:2] == CommandInfo.COMMENT_SYMBOL.value:    # IGNORE COMMENTS
                break

            elif commandList[i] in CommandInfo.C_ARITHMETIC.value[1]:     # ARITHMETIC/LOGICAL CMDS
                jmp = self.updateCMDList(CommandInfo.C_ARITHMETIC, i, commandList, lineNumber)

            elif commandList[i] in CommandInfo.C_MEMORY.value[1]:         # MEMORY ACCESS CMDS
                jmp = self.updateCMDList(CommandInfo.C_MEMORY, i, commandList, lineNumber)

            elif commandList[i] in CommandInfo.C_BRANCHING.value[1]:
                jmp = self.updateCMDList(CommandInfo.C_BRANCHING, i, commandList, lineNumber)

            elif commandList[i] in CommandInfo.C_FUNCTION.value[1]:
                jmp = self.updateCMDList(CommandInfo.C_FUNCTION, i, commandList, lineNumber)
                    
            else:                                                   # INVALID CMDS
                self.produceError(ErrorTypes.SYNTAX_ERROR, lineNumber)

            i += 1 + jmp

    def updateCMDList(self, CMDType: CommandInfo, pos: int, commandList: List[str], lineNumber: int) -> int:

        validArg_cnt = CMDType.value[0]
        cmdList_len = len(commandList)

        # "return" VM command is the ONLY FUNCTION command that has 0 arguments instead of 2. 
        if CMDType == CommandInfo.C_FUNCTION and commandList[pos] == 'return':
            cmd, arg1, arg2 = commandList[pos], None, None
            append_CMD = {'cmdtype': CMDType, 'cmd': cmd, 'arg1': arg1, 'arg2': arg2}
            self.vmCMDList.append(append_CMD)
            return 0

        # CHECKING VALIDITY. VALID IF: [CMD, ARG1, ARG2] or  [CMD, ARG1, ARG2, //<CHAR(s) if any>]
        if pos == cmdList_len-validArg_cnt-1 or (commandList[pos+validArg_cnt+1] == CommandInfo.COMMENT_SYMBOL.value or commandList[pos+validArg_cnt+1][:2] == CommandInfo.COMMENT_SYMBOL.value):

            cmd, arg1, arg2 = commandList[pos], None, None

            if CMDType == CommandInfo.C_ARITHMETIC:
                #TODO Check if ARG(s) are VALID
                pass

            elif CMDType == CommandInfo.C_MEMORY:
                #TODO Check if ARG(s) are VALID
                arg1, arg2 = commandList[pos+1], commandList[pos+2]

            elif CMDType == CommandInfo.C_BRANCHING:
                #TODO Check if ARG(s) are VALID
                arg1 = commandList[pos+1]

            elif CMDType == CommandInfo.C_FUNCTION:
                #TODO Check if ARG(s) are VALID
                arg1, arg2 = commandList[pos+1], commandList[pos+2]
            
            append_CMD = {'cmdtype': CMDType, 'cmd': cmd, 'arg1': arg1, 'arg2': arg2}
            self.vmCMDList.append(append_CMD)
            return validArg_cnt 

        else:
            self.produceError(ErrorTypes.SYNTAX_ERROR, lineNumber)

    def produceError(self, errorType: ErrorTypes, lineNumber: int):
        print(errorType.value + str(lineNumber))
        sys.exit(1)

                            