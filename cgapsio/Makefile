CC      := mpicc
CFLAGS  := -O2 -fPIC
AR      := ar
ARFLAGS := rcs

all: libcgapsio.a gapsio2to0

libcgapsio.a: cgapsio.o
	$(AR) $(ARFLAGS) $@ $^

cgapsio.o: cgapsio.c cgapsio.h
	$(CC) $(CFLAGS) -Dcgapsio_MAIN_PROC $< -c
gapsio2to0: main2.c
	$(CC) $(CFLAGS) $< libcgapsio.a -o gapsio2to0
gapsio1to0: main.c
	$(CC) $(CFLAGS) $< libcgapsio.a -o gapsio1to0

clean:
	rm libcgapsio.a cgapsio.o
