CC      := mpicc
CFLAGS  := -O2 -fPIC
AR      := ar
ARFLAGS := rcs

all: libcgapsio.a

libcgapsio.a: cgapsio.o
	$(AR) $(ARFLAGS) $@ $^

cgapsio.o: cgapsio.c cgapsio.h
	$(CC) $(CFLAGS) -Dcgapsio_MAIN_PROC $< -c

clean:
	rm libcgapsio.a cgapsio.o
