import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectionChecker = Connectivity();
  // final StreamSubscription internetSubscription;
  NetworkInfoImpl();
  @override
  Future<bool> get isConnected async {
    final connectivityResult = await connectionChecker.checkConnectivity();
    final bool isConnected = connectivityResult != ConnectivityResult.none;
    return isConnected;
  }
}
