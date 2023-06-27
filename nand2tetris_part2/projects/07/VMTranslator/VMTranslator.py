import sys
import Parser as prs
import CodeWriter as cdw



'''

TODO    Input:  fileName.vm
        Output: fileName.asm

        1. Constructs a Parser object to handle the input file.
        2. Constructs a CodeWriter object to handle the output file.
        3. Marches through the input file, parsing each line and generating code from it.

        After parsing and generating lexical elements we can then pass this to the CodeWriter
        to generate appropriate assembly.

'''
def main(vmCodeFile):
    asmCodeFile = vmCodeFile[:-3]+".asm"    # To write in this file and return it.

    parser = prs.Parser(vmCodeFile)         # Parse the file and prepare input into pre-defined structure.
    codeWriter = cdw.CodeWriter(asmCodeFile)
    convertToAssembly(parser, codeWriter)
    print("Translation successfull!\nA new {} assembly file has been generated.".format(asmCodeFile))

def convertToAssembly(parser, codeWriter):
    for vmCmd in parser.vmCMDList:
        if vmCmd['cmdtype'] == prs.CommandInfo.C_ARITHMETIC:
            codeWriter.writeArithmetic(vmCmd)
        elif vmCmd['cmdtype'] == prs.CommandInfo.C_MEMORY:
            codeWriter.writePushPop(vmCmd)
        else:
            pass


if __name__ == "__main__":
    if len(sys.argv) > 1:
        inputFile = sys.argv[1]        # Extracting the provided input file
        if inputFile[-3:] != ".vm":    # Checking if extension is .vm   
            print("Error: Please provide a .vm file.")
            sys.exit(1)

        print("Translating the VM Code file,", inputFile, " to Hack assembly language...\n")
        main(inputFile)
        
    else:
        print("Error: Please provide a .vm file.")
        sys.exit(1)

