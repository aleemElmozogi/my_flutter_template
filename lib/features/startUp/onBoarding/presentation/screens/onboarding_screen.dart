import 'package:auto_route/auto_route.dart';
import 'package:my_flutter_template/config/routes/app_router.dart';
import 'package:my_flutter_template/core/utils/assets_manager.dart';
import 'package:my_flutter_template/core/widgets/app_button.dart';
import 'package:my_flutter_template/core/widgets/app_scaffold.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_flutter_template/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

part 'widgets/onboardong_item.dart';

@RoutePage()
class OnBoardingPage extends StatefulWidget {
  OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController(keepPage: false);

  List<OnboardingModel> _pages(BuildContext context) => [
    OnboardingModel(
      S.of(context).onboardingWelcomeTitle,
      '',
      ImgAssets.appLogo,
    ),
    OnboardingModel(
      S.of(context).onboardingCampaignsTitle,
      S.of(context).onboardingCampaignsDescription,
      ImgAssets.treeVector,
    ),
    OnboardingModel(
      S.of(context).onboardingTrackingTitle,
      S.of(context).onboardingTrackingDescription,
      ImgAssets.mobileVector,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final pages = _pages(context);
    final colorScheme = Theme.of(context).colorScheme;

    return AppScaffold(
      safeTopArea: false,
      extendBodyBehindAppBar: true,
      contentPadding: EdgeInsets.zero,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const ClampingScrollPhysics(),
              controller: controller,
              children: pages.map((e) => OnboardingItem(item: e)).toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: pages.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 10,
                    activeDotColor: colorScheme.primary,
                    dotColor: colorScheme.outlineVariant,
                    dotWidth: 10,
                  ),
                ),
                SizedBox(height: 20.h),
                AppButton(
                  title: S.of(context).next,
                  onTab: () {
                    if (controller.page == pages.length - 1) {
                      context.router.replace(LoginRoute());
                    } else {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingModel {
  final String title;
  final String description;
  final String coverImage;
  OnboardingModel(this.title, this.description, this.coverImage);
}
