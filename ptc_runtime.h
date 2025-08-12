#ifndef PTC_RUNTIME_H
#define PTC_RUNTIME_H

#include <stdio.h>
#include <stdlib.h>

/* File wrapper expected by ptc output for Pascal 'input'/'output' */
typedef struct {
    FILE *fp;
    int eoln;
    int buf;
} PtcFile;

/* Provide the standard Pascal file variables */
static PtcFile input = { NULL, 0, 0 };
static PtcFile output = { NULL, 0, 0 };

/* Initialize stdio bindings early */
static void __ptc_init_stdio(void) {
    if (!input.fp) input.fp = stdin;
    if (!output.fp) output.fp = stdout;
}

/* GCC/Clang: run before main() */
#if defined(__GNUC__) || defined(__clang__)
__attribute__((constructor))
static void __ptc_ctor(void) { __ptc_init_stdio(); }
#endif

/* The ptc output already defines Fwrite/Put/Putx/Putchr/Putl macros.
   If you include this header with -include, make sure our definitions
   don't conflict if they were also emitted. (Usually ptc emits only
   Fwrite/Put* macros but not 'input'/'output' structs.) */

#endif /* PTC_RUNTIME_H */
