import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_template/config/routes/app_router.dart';
import 'package:my_flutter_template/core/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_template/core/widgets/loading_indicator.dart';
import 'package:my_flutter_template/features/authentication/auth/presentation/cubit/auth_cubit.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<AuthCubit>().restoreSession().then((isAuthenticated) {
    //   if (!mounted) {
    //     return;
    //   }
    //
    //   if (isAuthenticated) {
    //     final role = context.read<AuthCubit>().state.userEntity?.role;
    //     if (role != null) {
    //       context.router.replaceAll([MainDashboardRoute(userRole: role)]);
    //       return;
    //     }
    //   }
    //
    //   final isFirstStart = context.read<AuthCubit>().getIsFirstStart;
    //   if (isFirstStart) {
    //     context.router.replaceAll([StartUpRoute()]);
    //     return;
    //   }
    //   context.router.replaceAll([LoginRoute()]);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return  AppScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.account_balance_wallet,size: 55.r,),
            SizedBox(height: 10.h,),
            const AppLoadingIndicator(),
          ],
        ),
      ),
    );
  }
}
