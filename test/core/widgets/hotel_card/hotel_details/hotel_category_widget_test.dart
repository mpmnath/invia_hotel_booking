import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/hotel_details/hotel_category_widget.dart';

void main() {
  group('HotelCategoryWidget', () {
    testWidgets('displays correct number of stars and category icon', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder:
                (context, child) => Scaffold(
                  body: HotelCategoryWidget(
                    category: 3,
                    categoryType: 'Standard',
                  ),
                ),
          ),
        ),
      );

      // Expect 3 stars
      expect(find.byIcon(Icons.star_rounded), findsNWidgets(3));

      // Expect 1 category icon
      expect(find.byIcon(Icons.help_outline), findsOneWidget);
    });
  });
}
