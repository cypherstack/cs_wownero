import 'package:cs_wownero_flutter_libs_android_arm64_v8a/cs_wownero_flutter_libs_android_arm64_v8a.dart';
import 'package:cs_wownero_flutter_libs_android_armeabi_v7a/cs_wownero_flutter_libs_android_armeabi_v7a.dart';
import 'package:cs_wownero_flutter_libs_android_x86_64/cs_wownero_flutter_libs_android_x86_64.dart';
import 'package:cs_wownero_flutter_libs_platform_interface/cs_wownero_flutter_libs_platform_interface.dart';
import 'package:flutter/services.dart';

const _channel = MethodChannel('cs_wownero_flutter_libs_android');

class CsWowneroFlutterLibsAndroid extends CsWowneroFlutterLibsPlatform {
  /// Registers this class as the default instance of [CsWowneroFlutterLibsPlatform].
  static void registerWith() {
    CsWowneroFlutterLibsPlatform.instance = CsWowneroFlutterLibsAndroid();
  }

  @override
  Future<String?> getPlatformVersion({
    bool overrideForBasicTestCoverageTesting = false,
  }) async {
    if (!overrideForBasicTestCoverageTesting) {
      // make calls so flutter doesn't tree shake
      await Future.wait([
        CsWowneroFlutterLibsAndroidArm64V8a().getPlatformVersion(),
        CsWowneroFlutterLibsAndroidArmeabiV7a().getPlatformVersion(),
        CsWowneroFlutterLibsAndroidX8664().getPlatformVersion(),
      ]);
    }

    final version = await _channel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
