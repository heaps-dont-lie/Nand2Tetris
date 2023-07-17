import os
import sys
import glob
import Parser as prs
import CodeWriter as cdw

'''
CONSTANTS
'''
BOOTSTRAP_FLAG = True

'''

TODO    Input:  fileName.vm or Directory
        Output: fileName.asm or DirectoryName.asm

        1. Constructs a Parser object to handle the input file.
        2. Constructs a CodeWriter object to handle the output file.
        3. Marches through the input file, parsing each line and generating code from it.

        After parsing and generating lexical elements we can then pass this to the CodeWriter
        to generate appropriate assembly.

'''
def main(vmCodeFile, fd):

    if fd[0] == 'f':   #file
        asmCodeFile = vmCodeFile[:-3]+".asm"    # To write in this file and return it.
    elif fd[0] == 'd': #directory
        asmCodeFile = fd[1]+os.path.basename(fd[1][:-1])+".asm"         # To write in this file and return it.

    parser = prs.Parser(vmCodeFile)         # Parse the file and prepare input into pre-defined structure.

    vmCodeFile_truncated = os.path.basename(parser.vmCodeFileHandle.name[:-3])
    codeWriter = cdw.CodeWriter(asmCodeFile, vmCodeFile_truncated)
    convertToAssembly(parser, codeWriter)
    #print(parser.vmCMDList)

    # parser.vmCodeFileHandle.close()
    # codeWriter.asmCodeFileHandle.close()

def convertToAssembly(parser, codeWriter):
    global BOOTSTRAP_FLAG

    if BOOTSTRAP_FLAG:
        codeWriter.writeBootstrap()
        BOOTSTRAP_FLAG = False

    for vmCmd in parser.vmCMDList:
        if vmCmd['cmdtype'] == prs.CommandInfo.C_ARITHMETIC:
            codeWriter.writeArithmetic(vmCmd)
        elif vmCmd['cmdtype'] == prs.CommandInfo.C_MEMORY:
            codeWriter.writePushPop(vmCmd)
        elif vmCmd['cmdtype'] == prs.CommandInfo.C_BRANCHING:
            codeWriter.writeBranchingCondition(vmCmd)
        elif vmCmd['cmdtype'] == prs.CommandInfo.C_FUNCTION:
            codeWriter.writeFunction(vmCmd)
        else:
            pass

def delASMFile(dir):
    asm_files = glob.glob(os.path.join(dir, '*.asm'))    # Deleting old .asm file.
    if len(asm_files) > 0:
        for asm_file in asm_files:
            os.remove(asm_file)
        print("Deleted existing .asm files.")


if __name__ == "__main__":
    if len(sys.argv) > 1:
        input_File_Dir = sys.argv[1]        # Extracting the provided input file

        #Delete any existing .asm file from the directory.
        delASMFile(input_File_Dir if os.path.isdir(input_File_Dir) else os.path.dirname(input_File_Dir))

        if os.path.isfile(input_File_Dir):
            if input_File_Dir[-3:] != ".vm":    # Checking if extension is .vm   
                print("Error: Please provide a .vm file.")
                sys.exit(1)
            print("Translating the VM Code file,", input_File_Dir, " to Hack assembly language...\n")
            main(input_File_Dir, ('f', None))
            print("Translation successfull!\nA new {} assembly file has been generated.".format(input_File_Dir[:-3]+".asm"))

        elif os.path.isdir(input_File_Dir):
            vm_files = glob.glob(os.path.join(input_File_Dir, '*.vm'))
            
            if len(vm_files) == 0:
                print("Error: Please provide a directory that has at least one .vm file.")
                sys.exit(1)

            for vmFile in vm_files:
                print("Translating the VM Code file,", vmFile, " inside the ", input_File_Dir, " directory to Hack assembly language...\n")
                main(vmFile, ('d', input_File_Dir))
            print("Translation successfull!\nA new {} assembly file has been generated.".format(input_File_Dir+os.path.basename(input_File_Dir[:-1])+".asm"))
        
    else:
        print("Error: Please provide a .vm file or a directory that has at least one .vm file.")
        sys.exit(1)

