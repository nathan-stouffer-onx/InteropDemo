#!/bin/sh

rm -rf onyx.xcframework

cd ../code
./build.sh
cd ${OLDPWD}

PREFIX=../code/build/installed

cp CxxTest.hpp ${PREFIX}/device/arm64-ios/include/
cp module.modulemap ${PREFIX}/device/arm64-ios/include/

cp CxxTest.hpp ${PREFIX}/simulator/x86_64-ios/include/
cp module.modulemap ${PREFIX}/simulator/x86_64-ios/include/

xcodebuild -create-xcframework \
    -library ${PREFIX}/device/arm64-ios/lib/libonyx.a -headers ${PREFIX}/device/arm64-ios/include \
    -library ${PREFIX}/simulator/x86_64-ios/lib/libonyx.a -headers ${PREFIX}/simulator/x86_64-ios/include \
    -output onyx.xcframework