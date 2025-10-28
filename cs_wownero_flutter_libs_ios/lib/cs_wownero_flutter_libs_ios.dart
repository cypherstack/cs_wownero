import 'package:cs_wownero_flutter_libs_platform_interface/cs_wownero_flutter_libs_platform_interface.dart';
import 'package:flutter/services.dart';

const _channel = MethodChannel('cs_wownero_flutter_libs_ios');

class CsWowneroFlutterLibsIos extends CsWowneroFlutterLibsPlatform {
  /// Registers this class as the default instance of [CsWowneroFlutterLibsPlatform].
  static void registerWith() {
    CsWowneroFlutterLibsPlatform.instance = CsWowneroFlutterLibsIos();
  }

  @override
  Future<String?> getPlatformVersion() async {
    final version = await _channel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
