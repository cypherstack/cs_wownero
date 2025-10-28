import 'package:cs_wownero/cs_wownero.dart';
import 'package:test/test.dart';

void main() {
  group("$MinConfirms", () {
    test("contains one values", () {
      expect(MinConfirms.values.length, 1);
    });

    test("each confirmation type has the correct associated value", () {
      expect(MinConfirms.wownero.value, 15);
    });

    test("values are accessible by index", () {
      expect(MinConfirms.values[0], MinConfirms.wownero);
    });

    test("toString returns correct value", () {
      expect(MinConfirms.wownero.toString(), "MinConfirms.wownero");
    });
  });
}
