#!/bin/bash

PI=$(echo "scale=40;4*a(1)" | bc -l)
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
        echo -n "$(echo "s(2*$PI*$number/$1)" | bc -l), "
        number=$((number + 1))
    done
    echo -e "$(echo "s(2*$PI)" | bc -l)};"
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
