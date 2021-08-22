RUNTIME   := C
PREFIX    := c_
FILEEXT   := c
D_FILEEXT   := c
D_CC      := gcc
H_CC      := gcc
D_CFLAGS    := -w -O3 -ffast-math -march=skylake -c #Here the AVX2 is enabled
H_CFLAGS    := $(D_CFLAGS)

