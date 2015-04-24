#!/bin/bash
#
# Sample Hello World! bash script...
#

declare -a animals=("camel" "llama" "owl")
declare -A FRUIT_COLOR
FRUIT_COLOR=( ["apple"]="red" ["banana"]="yellow")
VERINFO=`git describe --abbrev=7 --dirty --always --tags`

# Obligatory Hello World with some version info
echo "Hello Bash World!  Version: $VERINFO"

# Show list of command line arguments
echo "Command line args: $*"

# Determine number of physical CPU sockets
SOCKETCOUNT=`cat /proc/cpuinfo | grep 'physical id' | sort | uniq | wc -l`
echo "CPU socket count: $SOCKETCOUNT"

# print out our animals array in reverse-sorted order
echo ""; echo "Value of animals array:"
for i in `(for animal in "${animals[@]}"; do echo "$animal"; done | sort --reverse)`
do
	echo "item = $i"
	if [[ "$i" == "${animals[0]}" ]]; then
		echo "   Condition is TRUE, $i == ${animals[0]}"
	else
		echo "   Condition is FALSE, $i != ${animals[0]}"
	fi
done

# print out our FRUIT_COLOR associative array (key/value pairs)
echo ""; echo "Value of fruit_color hash:"
declare -A sorted_fruit
for fruit in "${!FRUIT_COLOR[@]}"; do
	echo "$fruit = ${FRUIT_COLOR["$fruit"]}";
done | sort --reverse

# Read a non-existent environment variable and supply default value...
SOME_ENV_VAR=${PROBABLY_NOT_THERE-Default Value}
echo ""
echo "PROBABLY_NOT_THERE is set to '$SOME_ENV_VAR'"
echo ""

# Let's read in the PATH variable from the OS and print it out...
PATH_ENV_VAR=$PATH
echo "OS PATH var is set to: '$PATH'"
echo ""

# Let's manipulate PATH variable and then restore it
echo "Adding :/test to PATH variable"
PATH=$PATH:/test
echo "OS PATH var is set to: '$PATH'"
echo ""
echo "Restoring original PATH value."
PATH=$PATH_ENV_VAR
echo "OS PATH var is set to: '$PATH'"
echo ""

# Let's create the file test.out and write animals array to it...
echo ""
echo "Writing test.out file..."
rm -f test.out
for i in ${animals[@]}
do 
	echo $i >> test.out
done

# Now open the file we wrote and read it back...
echo ""
echo "Contents of test.out file:"
LINECOUNT=1
while read line
do
	echo "line $LINECOUNT: $line"
	LINECOUNT=$[$LINECOUNT +1]
done <test.out

# All done, finish with normal exit code.
exit 0
