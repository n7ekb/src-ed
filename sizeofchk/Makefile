# Makefile for Simple Sizeof Utility 
#
# Created 2014-06-26 by Ed Braaten
#

# Variables that may need tweaking...
COMPILER=gcc
#COMPILER=icc
#COMPILER=clang
CCOPTIONS=-O -Wall
INSTALLPATH=/usr/local/bin

# These variables shouldn't need any tweaking
CCVERSION=`${COMPILER} --version | head -1`
BINARYNAME=sizeofchk-${COMPILER}
SHORT_SHA:=$(shell git rev-parse --short HEAD 2>/dev/null || echo "unknown")
PGM_VERSION=1.0 (git-$(SHORT_SHA))


# Target to build the main program...
${BINARYNAME}:	Makefile sizeofchk.c
	@echo "#define COMPILEINFO \"${CCVERSION}\"" >sizeofchk.h
	@echo "#define ARCHINFO \""`uname -m`"\"" >>sizeofchk.h
	@echo "#define SYSINFO \""`uname -s`"\"" >>sizeofchk.h
	@echo "#define RELEASEINFO \""`uname -r`"\"" >>sizeofchk.h
	@echo "#define VERSION_STRING \"${PGM_VERSION}\"" >>sizeofchk.h
	@echo "Header file created..."
	${COMPILER} ${CCOPTIONS} -o ${BINARYNAME} sizeofchk.c
	chmod 755 ${BINARYNAME} 

install:
	mkdir -p /usr/local/bin
	cp ${BINARYNAME} ${INSTALLPATH} 
	chmod 755 ${INSTALLPATH}/${BINARYNAME} 

clean:
	rm -f ${BINARYNAME} sizeofchk.h *.o

tidy:
	rm -f *.o
