
import 'bootstrap.dart';
import 'core/flavors/app_flavor.dart';

Future<void> main() async {
  await bootstrap(AppFlavor.mock);
}
