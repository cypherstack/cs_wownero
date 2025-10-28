import 'package:cs_wownero_flutter_libs_android_armeabi_v7a/cs_wownero_flutter_libs_android_armeabi_v7a.dart';
import 'package:cs_wownero_flutter_libs_android_armeabi_v7a/cs_wownero_flutter_libs_android_armeabi_v7a_method_channel.dart';
import 'package:cs_wownero_flutter_libs_android_armeabi_v7a/cs_wownero_flutter_libs_android_armeabi_v7a_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCsWowneroFlutterLibsAndroidArmeabiV7aPlatform
    with MockPlatformInterfaceMixin
    implements CsWowneroFlutterLibsAndroidArmeabiV7aPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CsWowneroFlutterLibsAndroidArmeabiV7aPlatform initialPlatform =
      CsWowneroFlutterLibsAndroidArmeabiV7aPlatform.instance;

  test(
      '$MethodChannelCsWowneroFlutterLibsAndroidArmeabiV7a is the default instance',
      () {
    expect(
      initialPlatform,
      isInstanceOf<MethodChannelCsWowneroFlutterLibsAndroidArmeabiV7a>(),
    );
  });

  test('getPlatformVersion', () async {
    final CsWowneroFlutterLibsAndroidArmeabiV7aPlugin =
        CsWowneroFlutterLibsAndroidArmeabiV7a();
    final fakePlatform = MockCsWowneroFlutterLibsAndroidArmeabiV7aPlatform();
    CsWowneroFlutterLibsAndroidArmeabiV7aPlatform.instance = fakePlatform;

    expect(
      await CsWowneroFlutterLibsAndroidArmeabiV7aPlugin.getPlatformVersion(),
      '42',
    );
  });
}
