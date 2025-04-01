import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/features/favorites/presentation/cubits/favorites_cubit.dart';
import 'package:invia_hotel_booking/features/favorites/presentation/pages/favorites_page.dart';
import 'package:invia_hotel_booking/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/dummy_data.dart';
import '../../../../helpers/mocks.dart';

void main() {
  late FavoritesCubit mockFavoritesCubit;

  setUpAll(() {
    registerFallbackValue(dummyHotel);
  });

  setUp(() {
    mockFavoritesCubit = MockFavoritesCubit();
  });

  Widget buildWidget() {
    return MaterialApp(
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      locale: const Locale('en'),
      home: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) {
          return BlocProvider<FavoritesCubit>.value(
            value: mockFavoritesCubit,
            child: const FavoritesPage(),
          );
        },
      ),
    );
  }

  testWidgets('shows empty state when favorites is empty', (tester) async {
    when(() => mockFavoritesCubit.state).thenReturn([]);
    when(
      () => mockFavoritesCubit.stream,
    ).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(buildWidget());
    await tester.pumpAndSettle();

    expect(
      find.text('No favorite hotels yet'),
      findsOneWidget,
    );
  });

  testWidgets('renders hotel list when favorites are available', (
    tester,
  ) async {
    when(() => mockFavoritesCubit.state).thenReturn([dummyHotel]);
    when(
      () => mockFavoritesCubit.stream,
    ).thenAnswer((_) => Stream.value([dummyHotel]));

    await tester.pumpWidget(buildWidget());
    await tester.pumpAndSettle();

    expect(find.text(dummyHotel.name), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('calls toggleFavorite when favorite button is tapped', (
    tester,
  ) async {
    when(() => mockFavoritesCubit.state).thenReturn([dummyHotel]);
    when(
      () => mockFavoritesCubit.stream,
    ).thenAnswer((_) => Stream.value([dummyHotel]));
    when(
      () => mockFavoritesCubit.toggleFavorite(any()),
    ).thenAnswer((_) async {});

    await tester.pumpWidget(buildWidget());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle();

    verify(() => mockFavoritesCubit.toggleFavorite(dummyHotel)).called(1);
  });
}
