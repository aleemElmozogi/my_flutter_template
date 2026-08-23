part of '../onboarding_screen.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.item});
  final OnboardingModel item;
  @override
  Widget build(BuildContext context) {
    bool isFirstItem = item.coverImage == ImgAssets.appLogo;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: .68.sh,
            width: 1.sw,
            child: ColoredBox(
              color: isFirstItem
                  ? colorScheme.primary
                  : Theme.of(context).scaffoldBackgroundColor,
              child: Hero(
                tag: 'appLogo',
                child: SvgPicture.asset(
                  item.coverImage,
                  colorFilter: isFirstItem
                      ? ColorFilter.mode(colorScheme.onPrimary, BlendMode.srcIn)
                      : null,
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  Center(
                    child: AppText(
                      item.title,
                      fontSize: 20.sp,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (item.description.isNotEmpty) SizedBox(height: 15.h),
                  if (item.description.isNotEmpty)
                    AppText(item.description, maxLines: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
