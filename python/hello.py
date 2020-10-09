#!/usr/bin/env python
#
# Sample Hello World! python script...
#

import subprocess
import sys
import os

animals = ["camel", "llama", "owl"]
fruit_color = { "apple":"red", "banana":"yellow"}
fruits = fruit_color.keys()
colors = fruit_color.items()
verinfo = subprocess.check_output(["git", "describe", "--abbrev=7",
		"--dirty", "--always", "--tags"])

# Obligatory Hello World with some version info
print("Hello Python World!  Version: {}".format(verinfo))

# Show list of command line arguments
print("Command line args: "),
for i in sys.argv[1:]:
	print(" {}".format(i))
print("")

# Determine number of physical CPU sockets 
if os.name == 'nt':
	pass
else:
	socketcount = subprocess.check_output(["bash","-c",
            "(cat /proc/cpuinfo | grep 'physical id' | sort | uniq | wc -l)"])
	print("CPU socket count: {}".format(socketcount))

# print out our animals array in reverse-sorted order
print("\nValue of animals array:")
for i in sorted(animals, reverse=True):
	print("item = " + i)
	if (i == animals[0]):
		print("   Condition is TRUE, \"" +i+ "\" == " + animals[0]) 
	else:
		print("   Condition is FALSE, \"" +i+ "\" != " + animals[0]) 

# print our fruit_color dictionary (key/value pairs)
print("\nValue of fruit_color hash:")
for fruit,color in sorted(fruit_color.items(), reverse=True):
	print(fruit, " = ", color)

# Read a non-existent environment variable and supply default value...
some_env_var = os.getenv("PROBABLY_NOT_THERE", "Default Value")
print("\nPROBABLY_NOT_THERE is set to '"+some_env_var+"'\n")

# Let's read in the PATH variable from the OS and print it out...
path_env_var = os.environ['PATH']
print("OS PATH var is set to: '"+path_env_var+"'\n")

# Let's manipulate PATH variable and then restore it
print("Adding :/test to PATH variable")
os.environ['PATH'] = os.environ['PATH'] + ":/test"
print("OS PATH var is set to: '"+os.environ['PATH']+"'\n")
print("Restoring original PATH value.")
os.environ['PATH'] = path_env_var
print("OS PATH var is set to: '"+path_env_var+"'\n")


# Let's create the file test.out and write animals array to it...
print("\nWriting test.out file...")
file = open("test.out", "w")
for i in animals:
	file.write(i+"\n")
file.close()

# Now open the file we wrote and read it back...
print("\nContents of test.out file:")
file = open("test.out", "r")
linenum = 1
for line in file:
	print("line "+str(linenum)+": "+line)
	linenum += 1
file.close()

# All done, finish with normal exit code.
sys.exit(0)
