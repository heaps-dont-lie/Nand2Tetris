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
                                    'lt', 'and', 'and', 'or', 'not']

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

    def __init__(self, vmCodeFile):
        self.vmCodeFileHandle = open(vmCodeFile, 'r')
        self.vmCMDList = []     # Each element is a single VM command. List: [{cmdType: <CMDTYPE>, cmd: <CMD>, arg1: <ARG1>, arg2: <ARG2>}]
        self.currentCMD = ''    

        self.flattenVMCodeFile()    # Fill 'vmCMDList'

    def flattenVMCodeFile(self):

        for lineNumber, line in enumerate(self.vmCodeFileHandle, start=1):
            singleLine = re.split(r'\s+', line.strip())
            self.categorizeCommand(singleLine, lineNumber)

    def categorizeCommand(self, commandList: List[str], lineNumber: int):

        i = 0
        while i < len(commandList):
            if commandList[i] == CommandInfo.COMMENT_SYMBOL:        # IGNORE COMMENTS
                break

            elif commandList[i] in CommandInfo.C_ARITHMETIC[1]:     # ARITHMETIC/LOGICAL CMDS
                self.updateCMDList(CommandInfo.C_ARITHMETIC, i, commandList, lineNumber)

            elif commandList[i] in CommandInfo.C_MEMORY[1]:         # MEMORY ACCESS CMDS
                self.updateCMDList(CommandInfo.C_MEMORY, i, commandList, lineNumber)
                    
            else:                                                   # INVALID CMDS
                self.produceError(ErrorTypes.SYNTAX_ERROR, lineNumber)

            i += 1

    def updateCMDList(self, CMDType: CommandInfo, pos: int, commandList: List[str], lineNumber: int):

        validArg_cnt = CMDType[0]
        cmdList_len = len(commandList)

        # CHECKING VALIDITY. VALID IF: [CMD, ARG1, ARG2] or  [CMD, ARG1, ARG2, //]
        if pos == cmdList_len-validArg_cnt-1 or commandList[pos+validArg_cnt+1] == CommandInfo.COMMENT_SYMBOL:

            cmd, arg1, arg2 = commandList[pos], None, None

            if CMDType == CommandInfo.C_ARITHMETIC:
                #TODO Check if ARG(s) are VALID
                pass

            elif CMDType == CommandInfo.C_MEMORY:
                #TODO Check if ARG(s) are VALID
                arg1, arg2 = commandList[pos+1], commandList[pos+2]
            
            push_CMD = {'cmdtype': CMDType, 'cmd': cmd, 'arg1': arg1, 'arg2': arg2}
            self.vmCMDList.append(push_CMD)

        else:
            self.produceError(ErrorTypes.SYNTAX_ERROR, lineNumber)

    def produceError(self, errorType: ErrorTypes, lineNumber: int):
        print(errorType.value + lineNumber)
        sys.exit(1)



'''
elif commandList[i] in CommandInfo.C_ARITHMETIC[1]:
                if i == len(commandList)-CommandInfo.C_ARITHMETIC[0]-1 or commandList[i+CommandInfo.C_ARITHMETIC[0]+1] == CommandInfo.COMMENT_SYMBOL:
                    self.vmCodeLexicalComponents.append([commandList[i], 'C_ARITHMETIC'])
                else:   # ARITHMETIC/LOGICAL commands expects 0 commands, more than that is an error.
                    print(error_message + lineNumber)
                    sys.exit(1)

            elif commandList[i] in CommandInfo.MEMORY_ACCESS_CMD:
                if i == len(commandList)-CommandInfo.MEMORY_ACCESS_ARG_CNT-1 or commandList[i+CommandInfo.MEMORY_ACCESS_ARG_CNT+1] == CommandInfo.COMMENT_SYMBOL:
                    if commandList[i+1] in CommandInfo.MEMORY_SEGMENTS and (commandList[i+2].isdigit() and int(commandList[i+2]>0)):
                        self.vmCodeLexicalComponents.append([commandList[i], commandList[i+1], commandList[i+2], 'C_MEMORY_ACCESS'])
                    else:
                        print(error_message + lineNumber)
                        sys.exit(1)
'''

                            