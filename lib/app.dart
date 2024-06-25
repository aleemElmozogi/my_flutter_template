import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_validator/form_validator.dart';

import 'config/routes/routes.dart';
import 'core/enums/auth_status.dart';
import 'core/utils/dialog_extension.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/auth/presentation/cubit/auth_state.dart';
import 'features/splash/presentation/cubit/locale_cubit.dart';
import 'features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web_plugins/src/navigation_non_web/url_strategy.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'features/auth/presentation/pages/auth_page.dart';
import 'core/di/injection.dart' as di;
import 'generated/l10n.dart';

part 'app_routes.dart';
part 'auth_listener.dart';

class MyTemplateApp extends StatefulWidget {
  const MyTemplateApp({super.key});

  @override
  State<MyTemplateApp> createState() => _MyTemplateAppState();
}

class _MyTemplateAppState extends State<MyTemplateApp> {
  @override
  void initState() {
    super.initState();
    _initRoutes();
  }

  late final GoRouter _router;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.getIt<LocaleCubit>()),
          BlocProvider(create: (context) => di.getIt<AuthCubit>()),
        ],
        child: BlocBuilder<LocaleCubit, LocaleState>(
          buildWhen: (previousState, currentState) {
            return previousState != currentState;
          },
          builder: (context, state) {
            //This is needed to prevent the app from rotating right or left
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]);
            //This sets the form validator locale to the app default
            ValidationBuilder.setLocale(state.locale.languageCode);
            return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              builder: (context, child) {
                return MaterialApp.router(
                  onGenerateTitle: (context) => S.of(context).appName,
                  title: AppStrings.appName,
                  locale: state.locale,
                  theme: appTheme(),
                  routerConfig: _router,
                  builder: (BuildContext context, Widget? child) =>
                      BlocListener<AuthCubit, AuthState>(
                    listenWhen: (previous, current) =>
                        previous.authState != current.authState,
                    listener: _authStatus,
                    child: child ?? const SizedBox.shrink(),
                  ),
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                );
              },
            );
          },
        ));
  }
}
