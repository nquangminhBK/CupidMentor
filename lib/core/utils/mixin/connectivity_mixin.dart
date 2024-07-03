import 'package:connectivity_plus/connectivity_plus.dart';

mixin ConnectivityMixin {
  Connectivity get connectivity;

  Future<bool> isInConnection() async {
    final connectivityResult = await connectivity.checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }
}
