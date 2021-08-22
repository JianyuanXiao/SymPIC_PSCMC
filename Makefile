
SCMC2C    := scmc_compile_passes
PSCMC2C   := scmc_parallel_compile_passes

DEPDIR := .deps
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d


MPI_LINKFLAGS := $(shell mpicc -showme:link)

CC        := mpicc
CFLAGS    := -O2 -g -ffast-math -I./ -I./cgapsio -I./cscheme
LD        := mpicc
LDFLAGS   := -lm -fopenmp #-lcudart -lcuda
AR        := ar
ARFLAG    := rcs

SOURCES = space_filling_curve.c init_adjoint_relation.c split_shell.c init_field3d_mpi.c genrand.c init_particle.c init_implicit_particle.c sort_particle.c checkpoint.c run_particle.c run_particle_call_fun.c pass_xyzzyx.c hydroAshell.c dmshell.c mpifields.c nonlinear_jfnk.c call_curl_kernel.c blas_shell.c field_sync_h2d_d2h.c sync_fields.c smalllib.c mpi_fieldio.c seqfields.c main.c user_defined_particle_distribution.c

DIRS = smallmpi cgapsio cscheme c_ openmp_ #can add cuda_ swmc_ ... here

HEADERS = $(patsubst %.c,%.h,$(SOURCES))



OBJS = $(patsubst %.c,%.o,$(SOURCES)) cfgcst.o

EXTRA_LIBS = cgapsio/libcgapsio.a cscheme/libcscheme.a smallmpi/libsmallmpi.a c_yeefdtd.a openmp_yeefdtd.a #swmc_yeefdtd.a cuda_yeefdtd.a

all: sympic
all_dirs: $(DIRS)
all_headers: $(SOURCES) $(HEADERS)

sympic: $(OBJS) $(EXTRA_LIBS)
	 $(LD) $(OBJS) $(EXTRA_LIBS) -o $@ $(LDFLAGS) 

%.o: %.c c_yeefdtd.h libsmallmpi.h cfgcst.h $(DEPDIR)/%.d | $(DEPDIR)
	$(CC) $(CFLAGS) $< -c

%.c: %.scmc
	$(SCMC2C) $<

%.h: %.c
	./gen_scmc_defs.sh $<.def.ss

#.PRECIOUS: %.c %.c.def.ss %.h

mpifields.c: mpifields.scmc mur_abc.kernel.def.ss yeefdtd.kernel.def.ss geo_yeefdtd.kernel.def.ss geo_yeefdtd_rect.kernel.def.ss

blas_shell.c: blas_shell.scmc miniblas.kernel.def.ss

dmshell.c: dmshell.scmc dm.kernel.def.ss dmbihamt.kernel.def.ss dm8x8.kernel.def.ss

fdtd_helper.c: fdtd_helper.scmc yeefdtd.kernel.def.ss

hydroAshell.c: hydroAshell.scmc hydro_A.kernel.def.ss

run_particle.c: run_particle.scmc particle_iter.kernel.def.ss

blas_shell.c: blas_shell.scmc miniblas.kernel.def.ss

%.kernel.def.ss: c_/%.kernel.c.def.ss
	(cd c_/; make $(notdir $<))&& cp $< $@
#%.c.def.ss: %.c
#	touch $(notdir $*).c.def.ss

$(DEPDIR): ; @mkdir -p $@

DEPFILES := $(SRCS:%.c=$(DEPDIR)/%.d)
$(DEPFILES):

include $(wildcard $(DEPFILES))

$(DIRS):
	$(MAKE) -C $@

.PHONY: $(DIRS)

clean:
	-rm -f *.o sympic
clean_all:
	-rm -f $(SOURCES) *.o sympic
