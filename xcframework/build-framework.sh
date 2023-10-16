#!/bin/sh

rm -rf shaderlib.xcframework
rm -rf onyxlib.xcframework
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
    -library ${ARM_PREFIX}/lib/libshader.a -headers ${ARM_PREFIX}/include \
    -library ${X64_PREFIX}/lib/libshader.a -headers ${X64_PREFIX}/include \
    -output shaderlib.xcframework

xcodebuild -create-xcframework \
    -library ${ARM_PREFIX}/lib/libonyx.a -headers ${ARM_PREFIX}/include \
    -library ${X64_PREFIX}/lib/libonyx.a -headers ${X64_PREFIX}/include \
    -output onyxlib.xcframework

xcodebuild -create-xcframework -framework shaderlib.xcframework -framework onyxlib.xcframework -output onyx.xcframework