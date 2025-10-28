import 'package:cs_wownero_flutter_libs_platform_interface/cs_wownero_flutter_libs_platform_interface.dart';

class CsWowneroFlutterLibs {
  Future<String?> getPlatformVersion() {
    return CsWowneroFlutterLibsPlatform.instance.getPlatformVersion();
  }
}
