#!/bin/sh

./build.sh

cp -rv build/installed/device/arm64-ios/include/* ../CxxTest/include/
mkdir -p ../CxxTest/device/arm64
cp -rv build/installed/device/arm64-ios/lib ../CxxTest/device/arm64/

cp -rv build/installed/simulator/x86_64-ios/include/* ../CxxTest/include/
mkdir -p ../CxxTest/simulator/x86_64
cp -rv build/installed/simulator/x86_64-ios/lib ../CxxTest/simulator/x86_64/

# cp -rv build/installed/simulator/arm64-ios/include/* ../CxxTest/include/
# mkdir -p ../CxxTest/simulator/arm64
# cp -rv build/installed/simulator/arm64-ios/lib ../CxxTest/simulator/arm64/