#!/bin/sh

./build.sh

cp -r build/artifacts/x64-ios/include/* ../CxxTest/include/
cp -r build/artifacts/x64-ios/lib/libonyx.a ../CxxTest/