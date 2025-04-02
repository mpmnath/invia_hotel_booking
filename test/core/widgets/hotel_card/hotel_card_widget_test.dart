import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/types/page_type.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/hotel_card_widget.dart';
import 'package:invia_hotel_booking/features/favorites/presentation/cubits/favorites_cubit.dart';
import 'package:invia_hotel_booking/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/dummy_data.dart';
import '../../../helpers/mocks.dart';

void main() {
  group('HotelCard Widget', () {
    late FavoritesCubit favoritesCubit;

    setUp(() {
      registerFallbackValue(dummyHotel);
      favoritesCubit = MockFavoritesCubit();
      when(() => favoritesCubit.state).thenReturn([dummyHotel]);
      when(
        () => favoritesCubit.stream,
      ).thenAnswer((_) => Stream.value([dummyHotel]));
      when(() => favoritesCubit.toggleFavorite(any())).thenAnswer((_) async {});
    });

    testWidgets('renders hotel card correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          locale: const Locale('de'),
          home: BlocProvider.value(
            value: favoritesCubit,
            child: ScreenUtilInit(
              designSize: const Size(375, 812),
              builder:
                  (context, child) => Scaffold(
                    body: HotelCard(
                      hotel: dummyHotel,
                      onFavoriteToggle: () {},
                      pageType: PageType.hotel,
                    ),
                  ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Check hotel name
      expect(find.text(dummyHotel.name), findsOneWidget);

      // Check destination
      expect(find.text(dummyHotel.destination), findsOneWidget);

      // Check button text
      expect(find.text('Zu den Angeboten'), findsOneWidget);

      // Check favorite icon (it should be filled because dummyHotel is in the favoritesCubit.state)
      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });
  });
}
