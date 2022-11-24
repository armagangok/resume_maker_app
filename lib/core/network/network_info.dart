import '../util/network_connectivity_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImp implements NetworkInfo {
  @override
  Future<bool> get isConnected => NetworkConnectivityChecker.status;
}
