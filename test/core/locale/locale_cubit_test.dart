import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:invia_hotel_booking/core/locale/locale_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mocks.dart';

void main() {
  late MockStorage storage;

  setUp(() {
    storage = MockStorage();
    HydratedBloc.storage = storage;
  });

  group('LocaleCubit', () {
    test('initial state is English locale', () {
      when(() => storage.read(any())).thenReturn(null);
      final cubit = LocaleCubit();
      expect(cubit.state, const Locale('en'));
    });

    test('emits new locale when changed', () {
      when(() => storage.write(any(), any())).thenAnswer((_) async {});
      final cubit = LocaleCubit();
      cubit.changeLocale(const Locale('de'));
      expect(cubit.state, const Locale('de'));
    });

    test('fromJson returns correct Locale', () {
      final cubit = LocaleCubit();
      final result = cubit.fromJson({'languageCode': 'fr'});
      expect(result, const Locale('fr'));
    });

    test('toJson returns correct Map', () {
      final cubit = LocaleCubit();
      final result = cubit.toJson(const Locale('it'));
      expect(result, {'languageCode': 'it'});
    });
  });
}
