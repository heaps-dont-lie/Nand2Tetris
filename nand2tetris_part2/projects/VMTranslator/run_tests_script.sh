#!/bin/bash

# List of directories containing .vm files
directories=(
    "../MemoryAccess/StaticTest/"
    "../MemoryAccess/BasicTest/"
    "../MemoryAccess/PointerTest/"
    "../StackArithmetic/SimpleAdd/"
    "../StackArithmetic/StackTest/"
    # Add more directories here
)

# Path to your Python script
python_script="VMTranslator.py"

# Iterate over the directories
for directory in "${directories[@]}"; do
    # Check if the directory exists
    if [ -d "$directory" ]; then
        # Get the .vm files in the directory
        vm_files="$directory/*.vm"
        # Iterate over the .vm files
        for vm_file in $vm_files; do
            # Run the Python script with the current .vm file as input
            python2.7 "$python_script" "$vm_file"
        done
    else
        echo "Directory not found: $directory"
    fi
done
