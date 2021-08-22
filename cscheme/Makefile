CC      := clang
CFLAGS  := -O2 -fPIC
AR      := ar
ARFLAGS := rcs

all: libcscheme.a

libcscheme.a: cscheme.o
	$(AR) $(ARFLAGS) $@ $^

cscheme.o: cscheme.c singlemath.h binops.h uthash.h types.h
	$(CC) $(CFLAGS) -DCSCHEME_MAIN_PROC $< -c

clean:
	rm libcscheme.a cscheme.o
