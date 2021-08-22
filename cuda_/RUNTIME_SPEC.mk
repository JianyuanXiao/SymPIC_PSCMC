RUNTIME   := CUDA
PREFIX    := cuda_
FILEEXT   := cu
D_FILEEXT   := cu
D_CC      := echo
H_CC      := nvcc -arch=sm_52
D_CFLAGS    := 
H_CFLAGS    := -O3 -c

