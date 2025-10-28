import 'cs_wownero_flutter_libs_android_armeabi_v7a_platform_interface.dart';

class CsWowneroFlutterLibsAndroidArmeabiV7a {
  Future<String?> getPlatformVersion() {
    return CsWowneroFlutterLibsAndroidArmeabiV7aPlatform.instance
        .getPlatformVersion();
  }
}
