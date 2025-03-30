import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'network_info.dart';

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected async {
    final List<ConnectivityResult> connectivityResult =
        await connectionChecker.checkConnectivity();
    return connectivityResult.isNotEmpty &&
        connectivityResult[0] != ConnectivityResult.none;
  }
}
