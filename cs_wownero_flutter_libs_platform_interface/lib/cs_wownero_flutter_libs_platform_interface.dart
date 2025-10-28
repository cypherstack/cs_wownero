import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel_cs_wownero_flutter_libs.dart';

abstract class CsWowneroFlutterLibsPlatform extends PlatformInterface {
  /// Constructs a CsWowneroFlutterLibsPlatformInterfacePlatform.
  CsWowneroFlutterLibsPlatform() : super(token: _token);

  static final Object _token = Object();

  static CsWowneroFlutterLibsPlatform _instance =
      MethodChannelCsWowneroFlutterLibs();

  /// The default instance of [CsWowneroFlutterLibsPlatform] to use.
  ///
  /// Defaults to [MethodChannelCsWowneroFlutterLibs].
  static CsWowneroFlutterLibsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CsWowneroFlutterLibsPlatform] when
  /// they register themselves.
  static set instance(CsWowneroFlutterLibsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion();
}
