#!/bin/bash

SDK_VERSION=net6.0
# =================================================================================
# self-contained, single file
# =================================================================================

# osx-x64
DOTNET_RID_SUFFIX=osx-x64

PUBLISH_PATH=deploy-$SDK_VERSION
PUBLISH_PATH_X64=$PUBLISH_PATH
rm -f PUBLISH_PATH/*

dotnet publish EntryPoint.MacOS/EntryPoint.MacOS.csproj -f $SDK_VERSION --self-contained \
       -r $DOTNET_RID_SUFFIX -p:AssemblyNameSuffix=$DOTNET_RID_SUFFIX -o $PUBLISH_PATH

# osx-arm64
DOTNET_RID_SUFFIX=osx-arm64

PUBLISH_PATH=deploy-$SDK_VERSION
PUBLISH_PATH_ARM64=$PUBLISH_PATH
rm -f PUBLISH_PATH/*

DOTNET_RID_SUFFIX=osx-arm64
dotnet publish EntryPoint.MacOS/EntryPoint.MacOS.csproj -f $SDK_VERSION --self-contained \
       -r $DOTNET_RID_SUFFIX -p:AssemblyNameSuffix=$DOTNET_RID_SUFFIX -o $PUBLISH_PATH

UNIVERSAL_PATH=deploy-$SDK_VERSION
MULTIARCH_EXE=$UNIVERSAL_PATH/EntryPoint.MacOS

mkdir $UNIVERSAL_PATH
lipo -create -output $MULTIARCH_EXE $PUBLISH_PATH_X64/EntryPoint.MacOS-osx-x64 $PUBLISH_PATH_ARM64/EntryPoint.MacOS-osx-arm64

rm $PUBLISH_PATH_X64/EntryPoint.MacOS-osx-x64 $PUBLISH_PATH_ARM64/EntryPoint.MacOS-osx-arm64

lipo -info $MULTIARCH_EXE
file $MULTIARCH_EXE

echo
echo Running the generated binary
echo

$MULTIARCH_EXE
