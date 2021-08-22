CC=mpicc
SCMC2C=scmc_compile_passes
PSCMC2C=scmc_parallel_compile

all: libsmallmpi.a

libsmallmpi.a: small_mpi.o
	$(AR) $(ARFLAGS) $@ $<

small_mpi.o: small_mpi.c
	$(CC) $(CPPFLAG) -E $< |sed -e '/^\# /d' -e '/^\ \{0,\}$$/d' | \
	  $(CC) $(CFLAGS) -c -xc - -o $@

small_mpi.c: small_mpi.scmc small_mpi_inc.scmc mpi_fun_proto.scmc
	$(SCMC2C) $<

clean:
	-rm -f small_mpi.o libsmallmpi.a
