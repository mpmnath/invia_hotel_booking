import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/rating/ratings_widget.dart';
import 'package:invia_hotel_booking/l10n/app_localizations.dart';
import 'package:invia_hotel_booking/l10n/l10n.dart';

import '../../../../helpers/dummy_data.dart';

void main() {
  testWidgets('displays rating information correctly', (tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder:
            (_, child) => MaterialApp(
              locale: const Locale('de'),
              localizationsDelegates: L10n.localizationsDelegates,
              supportedLocales: L10n.supportedLocales,
              home: Scaffold(body: RatingsWidget(rating: dummyRating)),
            ),
      ),
    );

    await tester.pumpAndSettle();

    final context = tester.element(find.byType(RatingsWidget));
    final l10n = AppLocalizations.of(context)!;

    // Check score text
    expect(find.text('4.5 / 5.0'), findsOneWidget);

    // Check sentiment description
    expect(find.textContaining(l10n.ratingExcellent), findsOneWidget);

    // Check reviews text
    expect(find.textContaining(l10n.ratingReviews('150')), findsOneWidget);
  });
}
