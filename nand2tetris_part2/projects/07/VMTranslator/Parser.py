import re
import sys
from enum import Enum
from typing import List


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
                    
            else:                                                   # INVALID CMDS
                self.produceError(ErrorTypes.SYNTAX_ERROR, lineNumber)

            i += 1 + jmp

    def updateCMDList(self, CMDType: CommandInfo, pos: int, commandList: List[str], lineNumber: int) -> int:

        validArg_cnt = CMDType.value[0]
        cmdList_len = len(commandList)

        # CHECKING VALIDITY. VALID IF: [CMD, ARG1, ARG2] or  [CMD, ARG1, ARG2, //<CHAR(s) if any>]
        if pos == cmdList_len-validArg_cnt-1 or (commandList[pos+validArg_cnt+1] == CommandInfo.COMMENT_SYMBOL.value or commandList[pos+validArg_cnt+1][:2] == CommandInfo.COMMENT_SYMBOL.value):

            cmd, arg1, arg2 = commandList[pos], None, None

            if CMDType == CommandInfo.C_ARITHMETIC:
                #TODO Check if ARG(s) are VALID
                pass

            elif CMDType == CommandInfo.C_MEMORY:
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

                            