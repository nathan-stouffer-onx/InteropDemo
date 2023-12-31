#!/bin/sh

export DEVICE_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk
export SIMULATOR_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk

# configure and build for arm64 ios device
cmake --fresh -S . -B build -DTARGET_DIRECTORY=device/arm64-ios -DCMAKE_CXX_COMPILER_TARGET=arm64-ios -DCMAKE_OSX_SYSROOT=${DEVICE_SYSROOT}
make -C build install

# configure and build for x64 ios simulator
cmake --fresh -S . -B build -DTARGET_DIRECTORY=simulator/x86_64-ios -DCMAKE_CXX_COMPILER_TARGET=x86_64-ios -DCMAKE_OSX_SYSROOT=${SIMULATOR_SYSROOT}
make -C build install