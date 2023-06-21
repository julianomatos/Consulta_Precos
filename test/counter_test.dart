import 'package:consulta_precos/models/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter', () {
    test('O valor de Counter deve ser incrementado', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });
  });
}
