import 'package:cs_wownero_flutter_libs_platform_interface/cs_wownero_flutter_libs_platform_interface.dart';
import 'package:cs_wownero_flutter_libs_windows/cs_wownero_flutter_libs_windows.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("$CsWowneroFlutterLibsWindows", () {
    final platform = CsWowneroFlutterLibsWindows();
    const MethodChannel channel =
        MethodChannel("cs_wownero_flutter_libs_windows");

    setUp(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
        channel,
        (MethodCall methodCall) async {
          return "42";
        },
      );
    });

    tearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null);
    });

    test("getPlatformVersion", () async {
      expect(await platform.getPlatformVersion(), "42");
    });
  });

  test("registerWith", () {
    CsWowneroFlutterLibsWindows.registerWith();
    expect(
      CsWowneroFlutterLibsPlatform.instance,
      isA<CsWowneroFlutterLibsWindows>(),
    );
  });
}
