# PoC of NET 6.0 'hello world' app published as Apple's universal binary

The app consists of a shared lib (to mimic the design of my actual cross-platform project) and an entry point (executable) for Mac OS.
IRL, there would also be a separate entry point module for Linux that configures DI the the proper way, but it is not needed for  the PoC.

To build the app, clone the repository and run ```build.sh```

The size of the single file supporting both Intel and Apple silicone is about 22 MB (~11 MB per each architecture), which seems in line with that other people see.

## Prerequisites

- NET 6.0 SDK for Mac OS
- XCode (for lipo tool)

## Keywords

- dotnet publish self-contained
- dotnet publish single file
- Apple lipo tool

## Links

The links are not guaranteed to be useful -- just added what I found useful during research.

- https://learn.microsoft.com/en-us/dotnet/core/deploying/single-file/overview?tabs=cli
- https://learn.microsoft.com/en-us/dotnet/core/deploying/trimming/trimming-options?pivots=dotnet-6-0
- https://developer.apple.com/documentation/apple-silicon/building-a-universal-macos-binary
- https://www.kenmuse.com/blog/notarizing-dotnet-console-apps-for-macos/
- https://github.com/dotnet/runtime/issues/41127

## Further improvements

### Reduce size of the package
- Check advanced trimming options for .NET

### Reduce startup time
- Avoid compressions
- Use AOT compilation ('publish ready to run')
- Consider NET  8.0 AOT compilation features
