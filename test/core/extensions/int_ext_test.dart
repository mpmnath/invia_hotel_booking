import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/extensions/int_ext.dart';
import 'package:invia_hotel_booking/l10n/l10n.dart';

void main() {
  group('NumberFormatExt', () {
    testWidgets('formats review count correctly in German', (tester) async {
      late String formatted;

      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('de'),
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          home: Builder(
            builder: (context) {
              formatted = 2748.localizedReviews(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(formatted, '2.748 Bew.');
    });

    testWidgets('formats review count correctly in English', (tester) async {
      late String formatted;

      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          home: Builder(
            builder: (context) {
              formatted = 2748.localizedReviews(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(formatted, '2,748 reviews');
    });

    testWidgets('formats review count correctly in French', (tester) async {
      late String formatted;

      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('fr'),
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          home: Builder(
            builder: (context) {
              formatted = 2748.localizedReviews(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(formatted, '2 748 avis');
    });
  });
}
