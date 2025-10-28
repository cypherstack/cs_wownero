import 'package:cs_wownero_flutter_libs_macos/cs_wownero_flutter_libs_macos.dart';
import 'package:cs_wownero_flutter_libs_platform_interface/cs_wownero_flutter_libs_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("$CsWowneroFlutterLibsMacos", () {
    final platform = CsWowneroFlutterLibsMacos();
    const MethodChannel channel =
        MethodChannel("cs_wownero_flutter_libs_macos");

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
    CsWowneroFlutterLibsMacos.registerWith();
    expect(
      CsWowneroFlutterLibsPlatform.instance,
      isA<CsWowneroFlutterLibsMacos>(),
    );
  });
}
