# SymPIC_PSCMC
This is the PSCMC source code of SymPIC, you will need PSCMC

https://github.com/JianyuanXiao/PSCMC

to compile it. When scmc_compile_passes and scmc_parallel_compile_passes are in the PATH and ready to run, you can use ./compile.sh to compile SymPIC.

By default, C and OpenMP backends (device codes are generated in c_ and openmp_ directories) with AVX2 optimization is used (USE_VLO must be set to 1 in the configuration file of SymPIC to enable the vectorized code). Edit Makefile, pscmc_config_runtime.ss, compile.sh, */*mk to specify other runtime and optimizations.
