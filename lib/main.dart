// ********************************************************************************
// * This project structure was built by Eng. Abdul-Aleem El-Mozughi.             *
// * I hope you find the template useful!                                          *
// *                                                                              *
// * My GitHub: https://github.com/aleemElmozogi                                  *
// *                                                                              *
// ********************************************************************************

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pretty_bloc_observer/pretty_bloc_observer.dart';
import 'core/di/injection.dart' as di;
import 'package:flutter/material.dart';

import 'app.dart';
import 'core/enums/environment_types.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  di.configureDependencies(environment: EnvironmentType.mock);
  Bloc.observer = PrettyBlocObserver();
  runApp(MyTemplateApp());
}
