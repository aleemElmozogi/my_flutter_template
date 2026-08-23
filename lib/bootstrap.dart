import 'package:flutter/material.dart';

import 'app.dart';
import 'core/di/injection.dart' as di;
import 'core/flavors/app_flavor.dart';

Future<void> bootstrap(AppFlavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  di.configureDependencies(flavor: flavor);
  runApp(MyTemplateApp());
}
