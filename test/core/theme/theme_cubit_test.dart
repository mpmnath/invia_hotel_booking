import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:invia_hotel_booking/core/theme/cubit/theme_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mocks.dart';

void main() {
  late MockStorage storage;

  setUp(() {
    storage = MockStorage();
    HydratedBloc.storage = storage;
  });

  group('ThemeCubit', () {
    test('initial state is ThemeMode.system', () {
      when(() => storage.read(any())).thenReturn(null);
      final cubit = ThemeCubit();
      expect(cubit.state, ThemeMode.system);
    });

    test('emits new theme when toggled', () {
      when(() => storage.write(any(), any())).thenAnswer((_) async {});
      final cubit = ThemeCubit();
      cubit.toggleTheme(ThemeMode.dark);
      expect(cubit.state, ThemeMode.dark);
    });

    test('fromJson returns correct ThemeMode', () {
      final cubit = ThemeCubit();
      final result = cubit.fromJson({'theme': ThemeMode.light.index});
      expect(result, ThemeMode.light);
    });

    test('toJson returns correct Map', () {
      final cubit = ThemeCubit();
      final result = cubit.toJson(ThemeMode.dark);
      expect(result, {'theme': ThemeMode.dark.index});
    });
  });
}
