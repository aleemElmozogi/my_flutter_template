import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_validator/form_validator.dart';
import 'package:my_flutter_template/core/utils/dialog_extension.dart';
import 'package:my_flutter_template/features/authentication/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_flutter_template/features/authentication/auth/presentation/cubit/auth_state.dart';
import 'package:my_flutter_template/features/startUp/splash/presentation/cubit/locale_cubit.dart';
import 'config/routes/app_router.dart';
import 'core/di/injection.dart';
import 'core/enums/auth_status.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/themes/app_theme.dart';
import 'core/di/injection.dart' as di;
import 'generated/l10n.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart'
    as snackBarContent;

part 'auth_listener.dart';

class MyTemplateApp extends StatelessWidget {
  MyTemplateApp({super.key}) : _appRouter = getIt();
  final AppRouter _appRouter;

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
                  locale: state.locale,
                  theme: appTheme(),
                  routerConfig: _appRouter.config(),
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
