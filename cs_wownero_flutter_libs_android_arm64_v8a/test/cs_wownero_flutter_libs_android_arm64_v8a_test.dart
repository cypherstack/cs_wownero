import 'package:cs_wownero_flutter_libs_android_arm64_v8a/cs_wownero_flutter_libs_android_arm64_v8a.dart';
import 'package:cs_wownero_flutter_libs_android_arm64_v8a/cs_wownero_flutter_libs_android_arm64_v8a_method_channel.dart';
import 'package:cs_wownero_flutter_libs_android_arm64_v8a/cs_wownero_flutter_libs_android_arm64_v8a_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCsWowneroFlutterLibsAndroidArm64V8aPlatform
    with MockPlatformInterfaceMixin
    implements CsWowneroFlutterLibsAndroidArm64V8aPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CsWowneroFlutterLibsAndroidArm64V8aPlatform initialPlatform =
      CsWowneroFlutterLibsAndroidArm64V8aPlatform.instance;

  test(
      '$MethodChannelCsWowneroFlutterLibsAndroidArm64V8a is the default instance',
      () {
    expect(
      initialPlatform,
      isInstanceOf<MethodChannelCsWowneroFlutterLibsAndroidArm64V8a>(),
    );
  });

  test('getPlatformVersion', () async {
    final CsWowneroFlutterLibsAndroidArm64V8aPlugin =
        CsWowneroFlutterLibsAndroidArm64V8a();
    final fakePlatform = MockCsWowneroFlutterLibsAndroidArm64V8aPlatform();
    CsWowneroFlutterLibsAndroidArm64V8aPlatform.instance = fakePlatform;

    expect(
      await CsWowneroFlutterLibsAndroidArm64V8aPlugin.getPlatformVersion(),
      '42',
    );
  });
}
