#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

# Extract the directory path from the file path
writedir=$(dirname "$writefile")

# Create the directory path if it does not exist
if [ ! -d "$writedir" ]; then
    mkdir -p "$writedir"
    if [ "$?" -ne 0 ]; then
        echo "Error: Could not create directory $writedir."
        exit 1
    fi
fi

# Create or overwrite the file with the provided content
echo "$writestr" > "$writefile"
if [ "$?" -ne 0 ]; then
    echo "Error: Could not create or write to file $writefile."
    exit 1
fi

echo "Successfully wrote to $writefile."
