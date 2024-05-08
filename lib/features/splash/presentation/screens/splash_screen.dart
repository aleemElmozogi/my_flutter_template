import 'dart:async';

import 'package:my_flutter_template/config/routes/routes.dart';
import 'package:my_flutter_template/core/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_template/core/widgets/loading_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() => GoRouter.of(context).replace(AppRoute.login.toPath);

  _startDelay() {
    _timer = Timer(const Duration(seconds: 4), () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
