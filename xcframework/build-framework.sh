#!/bin/sh

set -e

rm -rf shader.xcframework
rm -rf onyx.xcframework

cd ../code
./build.sh
cd ${OLDPWD}

PREFIX=../code/build/installed
ARM_PREFIX=${PREFIX}/device/arm64-ios
X64_PREFIX=${PREFIX}/simulator/x86_64-ios

cp onyx.hpp ${ARM_PREFIX}/include/
cp module.modulemap ${ARM_PREFIX}/include/

cp onyx.hpp ${X64_PREFIX}/include/
cp module.modulemap ${X64_PREFIX}/include/

xcodebuild -create-xcframework \
    -library ${ARM_PREFIX}/lib/libshader.a \
    -library ${X64_PREFIX}/lib/libshader.a \
    -output shader.xcframework

xcodebuild -create-xcframework \
    -library ${ARM_PREFIX}/lib/libonyx.a -headers ${ARM_PREFIX}/include \
    -library ${X64_PREFIX}/lib/libonyx.a -headers ${X64_PREFIX}/include \
    -output onyx.xcframework