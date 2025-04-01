import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/extensions/num_ext.dart';

void main() {
  group('PriceFormatter Extension', () {
    test('formats price in Euro with correct format', () {
      expect(123456.formattedEuro, '1.234,56 €');
      expect(1000.formattedEuro, '10,00 €');
      expect(99.formattedEuro, '0,99 €');
      expect(0.formattedEuro, '0,00 €');
    });
  });
}
