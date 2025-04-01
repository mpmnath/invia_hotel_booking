import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/rating/ratings_widget.dart';

import '../../../../helpers/dummy_data.dart';

void main() {
  testWidgets('displays rating information correctly', (tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder:
            (context, child) => MaterialApp(
              home: Scaffold(body: RatingsWidget(rating: dummyRating)),
            ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('4.5 / 5.0'), findsOneWidget);
    expect(find.textContaining('Sehr Gut'), findsOneWidget);
    expect(find.textContaining('150 Bew.'), findsOneWidget);
  });
}
