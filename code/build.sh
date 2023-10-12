#!/bin/sh

# configure and build for arm64 ios
cmake -S . -B build -DTARGET_ARCHITECTURE=arm64-ios
make -C build install

# configure and build for x64 ios
cmake -S . -B build -DTARGET_ARCHITECTURE=x64-ios
make -C build install