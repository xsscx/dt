C_FLAGS    ?= -Wall -O3 -framework IOKit -framework CoreFoundation $(CFLAGS)
CC_FLAGS   ?= -arch arm64e
IOS_CC     ?= xcrun -sdk iphoneos clang
IOS_CFLAGS ?= -arch arm64e

.PHONY: all clean

all: dt pmgr

dt: src/dt.c src/dt.h
	$(CC) $(CFLAGS) -o $@ -DDT_MAIN -DDT_IO src/dt.c

pmgr: src/pmgr.c src/dt.c src/pmgr.h src/dt.h
	$(CC) $(CFLAGS) -o $@ -DPMGR_MAIN -DDT_IO src/pmgr.c src/dt.c

clean:
	rm -f dt pmgr
