CC=gcc
CFLAGS=-I./include -fPIC 
DEPS = libgifextra.h 

all: libgifextra
UNAME_S := $(shell uname -s);

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS) -lgif

# libgifextra.a: libgifextra.o
# 	ar rcs $@ $^ 

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	LIBEXT=so
	SHARED_BEGIN=-Wl,-whole-archive,-V
	SHARED_END=-Wl,-no-whole-archive,-V
	TYPE=-shared
endif
ifeq ($(UNAME_S),Darwin)
	LIBEXT=dylib
	LIBFOOCFLAGS=-mmacosx-version-min=10.1
	SHARED_BEGIN=
	TYPE=-dynamiclib 
	SHARED_END=
endif
ifeq ($(UNAME_S),MSYS_NT-6.3)
	LIBEXT=dll
	SHARED_BEGIN=
	TYPE=-shared
	SHARED_END=
endif


libgifextra: libgifextra.o
	$(CC) $(TYPE) $(SHARED_BEGIN) $^ $(SHARED_END) -o $@.$(LIBEXT) -lgif 

# ------------
# To install the shared objects in their respective locations

install: libgifextra.$(LIBEXT)
	install -d $(prefix)/lib/
	install -m 644 libgifextra.$(LIBEXT) $(prefix)/lib/
	install -d $(prefix)/include/
	install -m 644 ./include/libgifextra.h $(prefix)/include/


# make clean 
# ----------
# To remove .o,.a,.so files in the current directory

clean :
	-rm *.o *.so 
	echo Cleared
