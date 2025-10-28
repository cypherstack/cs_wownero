import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'cs_wownero_flutter_libs_android_armeabi_v7a_method_channel.dart';

abstract class CsWowneroFlutterLibsAndroidArmeabiV7aPlatform
    extends PlatformInterface {
  /// Constructs a CsWowneroFlutterLibsAndroidArmeabiV7aPlatform.
  CsWowneroFlutterLibsAndroidArmeabiV7aPlatform() : super(token: _token);

  static final Object _token = Object();

  static CsWowneroFlutterLibsAndroidArmeabiV7aPlatform _instance =
      MethodChannelCsWowneroFlutterLibsAndroidArmeabiV7a();

  /// The default instance of [CsWowneroFlutterLibsAndroidArmeabiV7aPlatform] to use.
  ///
  /// Defaults to [MethodChannelCsWowneroFlutterLibsAndroidArmeabiV7a].
  static CsWowneroFlutterLibsAndroidArmeabiV7aPlatform get instance =>
      _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CsWowneroFlutterLibsAndroidArmeabiV7aPlatform] when
  /// they register themselves.
  static set instance(CsWowneroFlutterLibsAndroidArmeabiV7aPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
