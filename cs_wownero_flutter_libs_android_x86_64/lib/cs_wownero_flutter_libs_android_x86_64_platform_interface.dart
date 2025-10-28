import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'cs_wownero_flutter_libs_android_x86_64_method_channel.dart';

abstract class CsWowneroFlutterLibsAndroidX8664Platform
    extends PlatformInterface {
  /// Constructs a CsWowneroFlutterLibsAndroidX8664Platform.
  CsWowneroFlutterLibsAndroidX8664Platform() : super(token: _token);

  static final Object _token = Object();

  static CsWowneroFlutterLibsAndroidX8664Platform _instance =
      MethodChannelCsWowneroFlutterLibsAndroidX8664();

  /// The default instance of [CsWowneroFlutterLibsAndroidX8664Platform] to use.
  ///
  /// Defaults to [MethodChannelCsWowneroFlutterLibsAndroidX8664].
  static CsWowneroFlutterLibsAndroidX8664Platform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CsWowneroFlutterLibsAndroidX8664Platform] when
  /// they register themselves.
  static set instance(CsWowneroFlutterLibsAndroidX8664Platform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
