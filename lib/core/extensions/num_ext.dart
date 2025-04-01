import 'package:intl/intl.dart';

extension PriceFormatter on num {
  String get formattedEuro {
    final amount = this / 100;
    final format = NumberFormat.currency(
      locale: 'de_DE',
      symbol: '€',
      decimalDigits: 2,
    );
    return format.format(amount);
  }
}
