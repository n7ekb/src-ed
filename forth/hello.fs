#! /usr/bin/gforth
\  
\  Sample Hello World! Forth script...
\

: verinfo s" git describe --abbrev=7 --dirty --always --tags" system ;

\ Obligatory Hello World with some version info
.( Hello Forth World!  Version: ) verinfo cr

\ Show list of command line arguments
: printargs
	argc @ 0 do i arg type cr loop ;
.( Command line args: ) cr
printargs

bye
