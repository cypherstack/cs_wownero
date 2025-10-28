import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cs_wownero_flutter_libs_android_arm64_v8a_platform_interface.dart';

/// An implementation of [CsWowneroFlutterLibsAndroidArm64V8aPlatform] that uses method channels.
class MethodChannelCsWowneroFlutterLibsAndroidArm64V8a
    extends CsWowneroFlutterLibsAndroidArm64V8aPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel('cs_wownero_flutter_libs_android_arm64_v8a');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
