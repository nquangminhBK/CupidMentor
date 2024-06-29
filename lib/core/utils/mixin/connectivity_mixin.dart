import 'package:connectivity_plus/connectivity_plus.dart';

mixin ConnectivityMixin {
  Connectivity get connectivity;

  Future<bool> isInConnection() async {
    var connectivityResult = await connectivity.checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }
}
