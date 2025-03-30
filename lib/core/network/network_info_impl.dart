import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'network_info.dart';

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectionChecker;

  NetworkInfoImpl({required Connectivity connectionChecker})
    : _connectionChecker = connectionChecker;

  @override
  Future<bool> get isConnected async {
    final List<ConnectivityResult> connectivityResult =
        await _connectionChecker.checkConnectivity();
    return connectivityResult.isNotEmpty &&
        connectivityResult[0] != ConnectivityResult.none;
  }
}
