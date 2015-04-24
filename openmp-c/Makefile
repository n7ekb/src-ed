# Sample makefile to add version/compiler info via an extra
# object module linked to final binary.
#
CC=gcc
COMPILER_VER:=$(shell $(CC) --version)
CFLAGS=-fopenmp
LDFLAGS=
GIT_DESCRIBE:=$(shell git describe --abbrev=7 --dirty --always --tags --long)
GIT_AUTHOR:=$(shell git --no-pager log -1 --pretty=format:"%an <%ae>")
BUILD_DATE:=$(shell date +"%F %H:%M:%S")

.PHONY: all
all:    hello-omp
  
versioninfo.txt:
	@echo "@(#) Build date: ${BUILD_DATE}." >versioninfo.txt
	@echo "@(#) Compiler version: ${COMPILER_VER}." >>versioninfo.txt
	@echo "@(#) Compiler options: '${CFLAGS}'." >>versioninfo.txt
	@echo "@(#) Linker options: '${LDFLAGS}'." >>versioninfo.txt
	@echo "@(#) Git info: ${GIT_DESCRIBE}" >>versioninfo.txt
	@echo "@(#) Commit author: ${GIT_AUTHOR}" >>versioninfo.txt
        
versioninfo.o:  versioninfo.txt
	objcopy --input binary \
		--output elf64-x86-64 \
		--binary-architecture i386 \
		--add-section versioninfo=versioninfo.txt \
		--set-section-flags versioninfo=contents,noload \
		versioninfo.txt versioninfo.o

hello-omp:  hello-omp.c Makefile versioninfo.o
	gcc $(CFLAGS) $(LDFLAGS) -DVERSIONINFO="\"$(GIT_DESCRIBE)\"" \
		hello-omp.c versioninfo.o -o hello-omp

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
