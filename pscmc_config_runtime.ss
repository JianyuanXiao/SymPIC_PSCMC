;(prefix runtime . extra_paras)
(define runtimes
  `(
     (c_ C 1)
     (openmp_ OpenMP 1)
     ;(swmc_ SWMC 1)
     ;(cuda_ CUDA 32)
     ;(opencl_ OpenCL 32)
     )
  )
(define LIBNAME "yeefdtd")
(load "general_kernel_files.ss")
