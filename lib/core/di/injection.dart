
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_flutter_template/core/api/api_consumer.dart';
import 'package:my_flutter_template/core/network/netwok_info.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies({required String environment}) =>
    getIt.init(environment: environment);
const mock = Environment('mock');
const production = Environment('prod');

