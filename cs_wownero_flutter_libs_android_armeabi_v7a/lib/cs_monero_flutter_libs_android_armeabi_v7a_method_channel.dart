import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cs_wownero_flutter_libs_android_armeabi_v7a_platform_interface.dart';

/// An implementation of [CsMoneroFlutterLibsAndroidArmeabiV7aPlatform] that uses method channels.
class MethodChannelCsMoneroFlutterLibsAndroidArmeabiV7a extends CsMoneroFlutterLibsAndroidArmeabiV7aPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('cs_wownero_flutter_libs_android_armeabi_v7a');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
