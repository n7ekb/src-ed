# Sample makefile to add version/compiler info via an extra
# object module linked to final binary.
#
COMPILER_VER:=$(shell gcc --version)
COMPILER_OPTS=-fopenmp
GIT_DESCRIBE:=$(shell git describe --abbrev=7 --dirty --always --tags --long)

.PHONY: all
all:    hello-omp
  
versioninfo.txt:
	@echo "@(#) Compiler version: ${COMPILER_VER}." >versioninfo.txt
	@echo "@(#) Compiler options: ${COMPILER_OPTS}." >>versioninfo.txt
	@echo "@(#) Git info: ${GIT_DESCRIBE}" >>versioninfo.txt
        
versioninfo.o:  versioninfo.txt
	objcopy --input binary \
		--output elf64-x86-64 \
		--binary-architecture i386 \
		--add-section versioninfo=versioninfo.txt \
		--set-section-flags versioninfo=contents,noload \
		versioninfo.txt versioninfo.o

hello-omp:  hello-omp.c Makefile versioninfo.o
	gcc $(COMPILER_OPTS) -DVERSIONINFO="\"$(GIT_DESCRIBE)\"" hello-omp.c \
		versioninfo.o -o hello-omp

.PHONY: test
test:
	(export OMP_NUM_THREADS=2; ./hello-omp)
	sleep 5
	(export OMP_NUM_THREADS=24; ./hello-omp)
	sleep 5
	(export OMP_NUM_THREADS=500; ./hello-omp)

.PHONY: clean
clean:
	rm -f hello-omp	versioninfo.*
