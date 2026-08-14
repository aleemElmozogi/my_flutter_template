import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@prod
@LazySingleton(as: NetworkInfo, order: -1)
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectionChecker = Connectivity();

  NetworkInfoImpl();

  @override
  Future<bool> get isConnected async {
    final connectivityResults = await connectionChecker.checkConnectivity();
    return connectivityResults.any(
          (result) => result != ConnectivityResult.none,
    );
  }
}

@Environment('mock')
@LazySingleton(as: NetworkInfo, order: -1)
class MockNetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async => true;
}

