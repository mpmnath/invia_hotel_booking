import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/features/favorites/presentation/cubits/favorites_cubit.dart';
import 'package:invia_hotel_booking/features/hotels/presentation/cubits/hotels_cubit.dart';
import 'package:invia_hotel_booking/features/hotels/presentation/view/hotels_page.dart';
import 'package:invia_hotel_booking/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/dummy_data.dart';
import '../../../../helpers/mocks.dart';

void main() {
  late HotelsCubit mockHotelsCubit;
  late FavoritesCubit mockFavoritesCubit;

  setUpAll(() {
    registerFallbackValue(dummyHotel);
  });

  setUp(() {
    mockHotelsCubit = MockHotelsCubit();
    mockFavoritesCubit = MockFavoritesCubit();
  });

  Widget buildWidget() {
    return MaterialApp(
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      home: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<HotelsCubit>.value(value: mockHotelsCubit),
              BlocProvider<FavoritesCubit>.value(value: mockFavoritesCubit),
            ],
            child: const HotelsPage(),
          );
        },
      ),
    );
  }

  testWidgets('shows Initial state', (tester) async {
    when(() => mockHotelsCubit.state).thenReturn(HotelsInitial());
    when(() => mockHotelsCubit.stream).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(buildWidget());
    await tester.pumpAndSettle();

    expect(find.text('Initial State'), findsOneWidget);
  });

  testWidgets('shows loading indicator', (tester) async {
    when(() => mockHotelsCubit.state).thenReturn(HotelsLoading());
    when(() => mockHotelsCubit.stream).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(buildWidget());
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('shows hotel list when loaded', (tester) async {
    when(() => mockHotelsCubit.state).thenReturn(HotelsLoaded([dummyHotel]));
    when(
      () => mockHotelsCubit.stream,
    ).thenAnswer((_) => Stream.value(HotelsLoaded([dummyHotel])));
    when(() => mockFavoritesCubit.state).thenReturn([dummyHotel]);
    when(
      () => mockFavoritesCubit.stream,
    ).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(buildWidget());
    await tester.pumpAndSettle();

    expect(find.text(dummyHotel.name), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('shows error message', (tester) async {
    when(
      () => mockHotelsCubit.state,
    ).thenReturn(HotelsError('Error loading hotels'));
    when(() => mockHotelsCubit.stream).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(buildWidget());
    await tester.pumpAndSettle();

    expect(find.text('Error loading hotels'), findsOneWidget);
  });

  testWidgets('calls getHotels() on retry button', (tester) async {
    when(() => mockHotelsCubit.state).thenReturn(HotelsError("Error"));
    when(() => mockHotelsCubit.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockHotelsCubit.getHotels()).thenAnswer((_) async {});

    await tester.pumpWidget(buildWidget());
    await tester.pumpAndSettle();

    await tester.tap(find.byType(TextButton));
    await tester.pumpAndSettle();

    verify(() => mockHotelsCubit.getHotels()).called(1);
  });
}
