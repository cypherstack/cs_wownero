import 'package:cs_wownero_flutter_libs_android_x86_64/cs_wownero_flutter_libs_android_x86_64.dart';
import 'package:cs_wownero_flutter_libs_android_x86_64/cs_wownero_flutter_libs_android_x86_64_method_channel.dart';
import 'package:cs_wownero_flutter_libs_android_x86_64/cs_wownero_flutter_libs_android_x86_64_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCsWowneroFlutterLibsAndroidX8664Platform
    with MockPlatformInterfaceMixin
    implements CsWowneroFlutterLibsAndroidX8664Platform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CsWowneroFlutterLibsAndroidX8664Platform initialPlatform =
      CsWowneroFlutterLibsAndroidX8664Platform.instance;

  test('$MethodChannelCsWowneroFlutterLibsAndroidX8664 is the default instance',
      () {
    expect(
      initialPlatform,
      isInstanceOf<MethodChannelCsWowneroFlutterLibsAndroidX8664>(),
    );
  });

  test('getPlatformVersion', () async {
    final CsWowneroFlutterLibsAndroidX8664Plugin =
        CsWowneroFlutterLibsAndroidX8664();
    final fakePlatform = MockCsWowneroFlutterLibsAndroidX8664Platform();
    CsWowneroFlutterLibsAndroidX8664Platform.instance = fakePlatform;

    expect(
      await CsWowneroFlutterLibsAndroidX8664Plugin.getPlatformVersion(),
      '42',
    );
  });
}
