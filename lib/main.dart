// ********************************************************************************
// * This project structure was built by Eng. Abdul-Aleem El-Mozughi.             *
// * I hope you find the template useful!                                          *
// *                                                                              *
// * My GitHub: https://github.com/aleemElmozogi                                  *
// *                                                                              *
// ********************************************************************************

import 'package:bloc/bloc.dart';
import 'bootstrap.dart';
import 'core/di/injection.dart' as di;
import 'package:flutter/material.dart';

import 'app.dart';
import 'core/enums/environment_types.dart';
import 'core/flavors/app_flavor.dart';

Future<void> main() async {
  await bootstrap(resolveCurrentFlavor());
}
