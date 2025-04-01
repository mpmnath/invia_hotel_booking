import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/hotel_details/hotel_details_widget.dart';

import '../../../../helpers/dummy_data.dart';

void main() {
  group('HotelDetailsWidget', () {
    testWidgets('renders hotel name, destination, and stars', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (context, child) {
              return Scaffold(body: HotelDetailsWidget(hotel: dummyHotel));
            },
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Check hotel name
      expect(find.text(dummyHotel.name), findsOneWidget);

      // Check hotel destination
      expect(find.text(dummyHotel.destination), findsOneWidget);

      // Check number of star icons
      expect(
        find.byIcon(Icons.star_rounded),
        findsNWidgets(dummyHotel.category),
      );

      // Check categoryType help icon
      expect(find.byIcon(Icons.help_outline), findsOneWidget);
    });
  });
}
