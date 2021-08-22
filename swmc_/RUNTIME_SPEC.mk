RUNTIME   := SWMC
PREFIX    := swmc_
FILEEXT   := c
D_FILEEXT   := c
D_CC      := swgcc
H_CC      := swgcc
D_CFLAGS    := -w -O3 -ffast-math  -msimd -mieee -faddress_align=64 -mslave -mfma -funroll-loops -c #Here the 512 bit SIMD is enabled
H_CFLAGS    := -O3 -ffast-math -c

