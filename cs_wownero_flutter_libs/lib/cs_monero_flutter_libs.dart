import 'package:cs_wownero_flutter_libs_platform_interface/cs_wownero_flutter_libs_platform_interface.dart';

class CsMoneroFlutterLibs {
  Future<String?> getPlatformVersion() {
    return CsMoneroFlutterLibsPlatform.instance.getPlatformVersion();
  }
}
