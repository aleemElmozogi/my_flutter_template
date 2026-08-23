import 'package:auto_route/auto_route.dart';
import 'package:my_flutter_template/config/routes/app_router.dart';
import 'package:my_flutter_template/core/utils/app_colors.dart';
import 'package:my_flutter_template/core/utils/assets_manager.dart';
import 'package:my_flutter_template/core/widgets/app_scaffold.dart';
import 'package:my_flutter_template/features/authentication/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_template/core/widgets/loading_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _goNext(bool firstStart) => context.router.replaceAll(
    firstStart ? [OnBoardingRoute()] : [LoginRoute()],
  );

  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().firstStart.then((value) {
      _goNext(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColorGradient: const [
        AppColors.primary,
        AppColors.lightPrimary,
      ],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 35.h),
            const Spacer(),
            Hero(
              tag: 'appLogo',
              child: SvgPicture.asset(
                ImgAssets.appLogo,
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const Spacer(),
            const AppLoadingIndicator(fillColor: AppColors.white),
            SizedBox(height: 35.h),
          ],
        ),
      ),
    );
  }
}
