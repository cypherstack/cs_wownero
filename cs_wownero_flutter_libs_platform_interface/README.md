# `cs_wownero_flutter_libs_platform_interface`
A common platform interface for the 
[`cs_wownero`](https://pub.dev/packages/cs_wownero) plugin.

# Usage
To implement a new platform-specific implementation of `cs_wownero`, extend 
`CsWowneroFlutterLibsPlatform` with an implementation that performs the 
platform-specific behavior, and when you register your plugin, set the default 
`CsWowneroFlutterLibsPlatform` by calling 
`CsWowneroFlutterLibsPlatform.instance = CsWowneroFlutterLibsPlatform()`.
