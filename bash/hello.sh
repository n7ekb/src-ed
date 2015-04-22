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

