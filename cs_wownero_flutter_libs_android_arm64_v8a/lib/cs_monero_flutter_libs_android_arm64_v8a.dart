
import 'cs_wownero_flutter_libs_android_arm64_v8a_platform_interface.dart';

class CsMoneroFlutterLibsAndroidArm64V8a {
  Future<String?> getPlatformVersion() {
    return CsMoneroFlutterLibsAndroidArm64V8aPlatform.instance.getPlatformVersion();
  }
}
