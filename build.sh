#!/bin/bash

PUBLISH_PATH=deploy
MULTIARCH_EXE=$PUBLISH_PATH/mac-multiarch

rm -f PUBLISH_PATH/*
dotnet publish EntryPoint.MacOS/EntryPoint.MacOS.csproj -f net6.0 --no-self-contained \
       -r osx-x64 -p:AssemblyNamePostfix=osx-x64 -o $PUBLISH_PATH

#DYLD_PRINT_LIBRARIES=1 

dotnet publish EntryPoint.MacOS/EntryPoint.MacOS.csproj -f net6.0 --no-self-contained \
       -r osx-arm64 -p:AssemblyNamePostfix=osx-arm64 -o $PUBLISH_PATH

#codesign -s 

rm $MULTIARCH_EXE
lipo -create -output $MULTIARCH_EXE $PUBLISH_PATH/EntryPoint.MacOS-osx-x64 $PUBLISH_PATH/EntryPoint.MacOS-osx-arm64
lipo -info $MULTIARCH_EXE

echo
echo Running the generated binary
echo
$PUBLISH_PATH/mac-multiarch
