#!/bin/sh

./build.sh

cp -rv build/artifacts/x86_64-ios/include/* ../CxxTest/include/
mkdir ../CxxTest/x86_64
cp -rv build/artifacts/x86_64-ios/lib ../CxxTest/x86_64/

cp -rv build/artifacts/arm64-ios/include/* ../CxxTest/include/
mkdir ../CxxTest/arm64
cp -rv build/artifacts/arm64-ios/lib ../CxxTest/arm64/