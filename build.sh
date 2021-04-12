#!/bin/bash

if [[ "$OSTYPE" == "linux"* ]]; then
    ##  Build SO
    make both BINUTILS=binutils-gdb
    ## Build DLL
    # https://stackoverflow.com/questions/33903276/how-to-build-hsdis-dll-for-windows-32-bit
    make OS=Linux MINGW=i686-w64-mingw32 AR=i686-w64-mingw32-ar BINUTILS=binutils-gdb CONFIGURE_ARGS=--host=i686-w64-mingw32
    make OS=Linux MINGW=x86_64-w64-mingw32 AR=x86_64-w64-mingw32-ar BINUTILS=binutils-gdb CONFIGURE_ARGS=--host=x86_64-w64-mingw32
elif [[ "$OSTYPE" == "darwin"* ]]; then
    ## Build dylib
    make all64 BINUTILS=binutils-gdb
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo "FreeBSD doesn't support"
else
    echo "Current system doesn't support"
fi
