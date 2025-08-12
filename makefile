
all:
		fpc -Miso ptc.pas

test:
		./ptc < test.pas > test.c
		cc -std=gnu89 -include ptc_runtime.h -o test test.c

