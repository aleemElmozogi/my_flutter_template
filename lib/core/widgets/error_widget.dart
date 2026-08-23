import 'package:my_flutter_template/core/utils/media_query_values.dart';
import 'package:my_flutter_template/core/widgets/app_custom_button.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_template/generated/l10n.dart';

class AppErrorWidget extends StatelessWidget {
  final VoidCallback? onPress;
  final String? message;
  const AppErrorWidget({super.key, this.onPress, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.warning_amber_rounded,
            color: Theme.of(context).colorScheme.primary,
            size: 150,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: AppText(
            message ?? S.current.somethingWentWrong,
            fontSize: 20,
            maxLines: 10,
          ),
        ),
        AppText(S.current.tryAgain, fontSize: 18),
        Container(
          height: 55,
          width: context.width * 0.55,
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: AppCustomButton(
            child: AppText(S.current.reloadScreen, fontWeight: FontWeight.w700),
            onPressed: () {
              if (onPress != null) {
                onPress!();
              }
            },
          ),
        ),
      ],
    );
  }
}
