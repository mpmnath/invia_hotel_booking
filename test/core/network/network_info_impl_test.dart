import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/network/network_info_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mocks.dart';

void main() {
  late NetworkInfoImpl networkInfo;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    networkInfo = NetworkInfoImpl(connectionChecker: mockConnectivity);
  });

  test('should return true when connected', () async {
    when(
      () => mockConnectivity.checkConnectivity(),
    ).thenAnswer((_) async => [ConnectivityResult.wifi]);

    final result = await networkInfo.isConnected;

    expect(result, isTrue);
    verify(() => mockConnectivity.checkConnectivity()).called(1);
  });

  test('should return false when not connected', () async {
    when(
      () => mockConnectivity.checkConnectivity(),
    ).thenAnswer((_) async => [ConnectivityResult.none]);

    final result = await networkInfo.isConnected;

    expect(result, isFalse);
    verify(() => mockConnectivity.checkConnectivity()).called(1);
  });
}
