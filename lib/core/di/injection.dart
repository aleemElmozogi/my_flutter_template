import 'package:my_flutter_template/core/enums/environment_types.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
    initializerName: 'init', preferRelativeImports: true, asExtension: true)
void configureDependencies({required EnvironmentType environment}) {
  getIt.init(
    environment: environment.name,
  );
  getIt.registerSingleton(AppSettings(environment));
}

@module
abstract class FirebaseModule {
  @lazySingleton
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;
}

const mock = Environment('mock');

class AppSettings {
  final EnvironmentType environment;

  AppSettings(this.environment);
}
