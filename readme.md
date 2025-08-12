This is Pascal To C transpiler.

It was probably last touched in 1987 before me, at least there's that date in the makefile.

Unfortunately the license requires to distribute the source unaltered.

As required, I am distributing source unaltered.

Also I provide a statically linked x86 gnu linux binary which I built back in 2005 with gpc.
The only change was replacing "message" with "writeln" in order to compile.

Update: I have altered the code, because it is unbearable to not use it.
So now it builds with fpc!

# Building

```
fpc -Miso ptc.pas
```

We'll get `ptc` executable

# Usage

```
./ptc < test.pas > test.c
cc -std=gnu89 -include ptc_runtime.h -o test test.c
./test
```

you'll see:

```
$ ./test
Hello from Pascal!
Square of          1 is          1
Square of          2 is          4
Square of          3 is          9
Square of          4 is         16
Square of          5 is         25
Total sum of squares from 1 to 5 is         55
```


