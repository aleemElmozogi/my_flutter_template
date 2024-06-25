import 'package:my_flutter_template/core/utils/app_colors.dart';
import 'package:my_flutter_template/core/utils/media_query_values.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_template/generated/l10n.dart';

class ErrorWidget extends StatelessWidget {
  final VoidCallback? onPress;
  const ErrorWidget({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Icon(
            Icons.warning_amber_rounded,
            color: AppColors.primary,
            size: 150,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: AppText(
            S.current.somethingWentWrong,
            fontSize: 20,
          ),
        ),
        AppText(
          S.current.tryAgain,
          fontSize: 18,
        ),
        Container(
          height: 55,
          width: context.width * 0.55,
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: AppColors.primary,
                elevation: 500,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: AppText(S.current.reloadScreen,
                textColor: Colors.white, fontWeight: FontWeight.w700),
            onPressed: () {
              if (onPress != null) {
                onPress!();
              }
            },
          ),
        )
      ],
    );
  }
}
