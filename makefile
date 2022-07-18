CC=gcc
CFLAGS=-I./include -fPIC 
DEPS = libgifextra.h 

all: libgifextra
UNAME_S := $(shell uname -s);

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS) -L$(libdir) -lgif

# dlext = so
TYPE = -shared
libgifextra: libgifextra.o
	$(CC) $(TYPE) $^ -o $@.$(dlext) -L$(libdir) -lgif 

# ------------
# To install the shared objects in their respective locations
install: libgifextra.$(dlext)
	install -Dvm 755 libgifextra.$(dlext) $(libdir)/libgifextra.$(dlext)
	install -Dvm 644 include/libgifextra.h $(includedir)/libgifextra.h

# make clean : To remove .o,.a,.so files in the current directory
clean :
	-rm *.o *.so 
	echo Cleared
