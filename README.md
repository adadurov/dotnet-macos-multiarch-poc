# PoC of NET 6.0 'hello world' app published as Apple's universal binary

To build the app, clone the repository and run ```build.sh```

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
