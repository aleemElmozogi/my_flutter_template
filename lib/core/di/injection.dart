import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_flutter_template/core/flavors/app_flavor.dart';
import 'package:my_flutter_template/data/repositories/auth_repository.dart';
import 'package:my_flutter_template/features/authentication/shared/domain/repositories/auth_shared_repository.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies({required AppFlavor flavor}) {
  getIt.init(environment: flavor.diEnvironment);
  getIt.registerSingleton(AppSettings(flavor));
}

@module
abstract class FirebaseModule {
  @lazySingleton
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;
}

const mock = Environment('mock');

class AppSettings {
  final AppFlavor flavor;

  AppSettings(this.flavor);

  bool get isMock => flavor.isMock;
  bool get isProd => flavor.isProd;
}

@module
abstract class RepositoryBindingsModule {
  @lazySingleton
  AuthRepository authRepository(AuthRepositoryImpl impl) => impl;

  @lazySingleton
  AuthSharedRepository authSharedRepository(AuthRepositoryImpl impl) => impl;
}
