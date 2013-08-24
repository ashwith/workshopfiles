#!/bin/bash
# That first line is the shebang. Every 
# shell script should start with it.

# Problem:
# Write a shell script that generates a C program file.
# Features:
# 1.    The filename should be gen.c by default. 
#       However, the user should be able to specify a 
#       filename with a -o option (See examples). If 
#       the file already exists, the user should be 
#       warned and asked if it is ok to overwrite 
#       the existing file.
# 2.    The file should include the headers stdio, 
#       stdlib and math. BONUS question: Include a
#       -l option so that the user can specify 
#       required libraries.
# 3.    The file should have an option -n which 
#       takes in a number. The default value 
#       should be 10. Using this number, create
#       a variable called table which is an array
#       of type int contain 'n' values. The array
#       should be initialized to the numbers from
#       1 to 'n'
# 4.    Follow this with int main() { return 0;}
#
#
# Examples: (Assume that the name of the script is
# gen_c.bash and default C file as gen.c)
#
# Command: ./gen_c.bash
# C file generated: gen.c
# Contents of file:
# #include<stdio.h>
# #include<stdlib.h>
# #include<math.h>
#
# int table[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
#
# int main()
# {
#     return 0;
# }
#
#
# Command: ./gen_c.bash -o table.c
# C file generated: table.c
# Contents of file:
# #include<stdio.h>
# #include<stdlib.h>
# #include<math.h>
#
# int table[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
#
# int main()
# {
#     return 0;
# }
#
#
# Command: ./gen_c.bash -n 5
# C file generated: gen.c
# Contents of file:
# #include<stdio.h>
# #include<stdlib.h>
# #include<math.h>
#
# int table[] = {1, 2, 3, 4, 5};
#
# int main()
# {
#     return 0;
# }
#
#
# Command: ./gen_c.bash -o table.c (Assume 
# that table.c exists already)
# Output:
# The file table.c exists. Overwrite? [y/n]:
# If the user enters 'n' then exit and do not
# generate the file. If the user enters 'y' then
# generate the file as in example 2
#
#
# Example for Bonus question
# Command: ./gen_c bash -o table.c -n 5 -l string time
# C file generated: table.c
# Contents of file:
# #include<stdio.h>
# #include<stdlib.h>
# #include<math.h>
# #include<string.h>
# #include<time.h>
#
# int table[] = {1, 2, 3, 4, 5};
#
# int main()
# {
#     return 0;
# }


#===========#
# Functions #
#===========#


gen_headers()
{
    for i in $@; do
        echo  "#include<$i.h>"
    done
}

gen_array()
{
    number=1
    echo -n "int table[] = {"
    while [ $number -lt $1 ]; do
        echo -n "$number, "
        number=$((number + 1))
    done
    echo -e "$1};"
}

gen_program()
{
    
    echo "int main()"
    echo "{"
    echo "return 0;"
    echo "}"
}


#==========#
#   Main   #
#==========#

filename=gen.c
n=10
headers="stdio stdlib math"
IFS=" "
# Read the Options
while [ "$1" != "" ]; do
    case $1 in
        -o )    shift
                filename=$1;;
        -n ) shift; n=$1 ;;
        -l ) while [ "$2" != "" ]; do
                shift;
                headers="$headers $1"
            done;;
        * ) echo "Option $1 invalid. Ignoring..."
    esac
    shift
done

if [ -f $filename ]; then
    echo -n "The file $filename exists. Overwrite? [y/n]:"
    read reply
    if [ $reply != "y" ]; then
        echo "Exiting..."
        exit 1
    fi
fi

program="$(gen_headers $headers)

$(gen_array $n)

$(gen_program)"

echo $program > $filename
sed -i s/^r/\ \ \ \ r/ $filename
