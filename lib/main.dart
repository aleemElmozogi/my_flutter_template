// ********************************************************************************
// * This project structure was built by Abdul-Aleem El-Mozughi.                  *
// * I hope you find the template useful!                                         *
// *                                                                              *
// * GitHub: https://github.com/aleemElmozogi                                     *
// *                                                                              *
// ********************************************************************************

import 'package:bloc/bloc.dart';
import 'package:pretty_bloc_observer/pretty_bloc_observer.dart';
import 'core/di/injection.dart' as di;
import 'package:flutter/material.dart';

import 'app.dart';
import 'core/enums/environment_types.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.configureDependencies(environment: EnvironmentType.mock.name);
  Bloc.observer = PrettyBlocObserver();
  runApp(const MyTemplateApp());
}
