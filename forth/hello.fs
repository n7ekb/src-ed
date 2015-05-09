#! /usr/bin/gforth
\  
\  Sample Hello World! Forth script...
\

\ Define "verinfo"
: verinfo s" git describe --abbrev=7 --dirty --always --tags" system ;

\ Define "printargs"
: printargs
	\ The argc variable contains the count of cmd line args 
	\ in gforth, so we put it's value (@) on the stack plus
	\ the number one and test if the value is greater than one.
        argc @ 1 > if
		\ condition is true, so put the value of argc (@)
		\ on the stack and the value one as the range of
		\ our do loop - we don't pring arg 0 which is the
		\ name of the program.
        	argc @ 1 do i arg type space loop cr
	else
		\ condition is false, so don't print anything
		cr
	then ;


\ Obligatory Hello World with some version info
.( Hello Forth World!  Version: ) verinfo cr


\ Show list of command line arguments
.( Command line args: ) printargs

bye
