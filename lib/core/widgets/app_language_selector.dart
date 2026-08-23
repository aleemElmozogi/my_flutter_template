import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_template/config/themes/app_theme.dart';
import 'package:my_flutter_template/core/utils/app_locale.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:my_flutter_template/features/startUp/splash/presentation/cubit/locale_cubit.dart';
import 'package:my_flutter_template/generated/l10n.dart';

class AppLanguageSelector extends StatelessWidget {
  const AppLanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppText(
          S.of(context).language,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 10),
        BlocBuilder<LocaleCubit, LocaleState>(
          buildWhen: (previous, current) => previous.locale != current.locale,
          builder: (context, state) {
            return SegmentedButton<Locale>(
              selected: {state.locale},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return theme.colorScheme.primaryContainer;
                  }
                  return theme.appColors.fieldFill;
                }),
                foregroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return theme.colorScheme.onPrimaryContainer;
                  }
                  return theme.colorScheme.onSurface;
                }),
                side: WidgetStateProperty.all(
                  BorderSide(color: theme.appColors.border),
                ),
              ),
              segments: [
                ButtonSegment(
                  value: AppLocale.ar,
                  icon: const Icon(Icons.translate_rounded),
                  label: Text(S.of(context).arabicLanguage),
                ),
                ButtonSegment(
                  value: AppLocale.en,
                  icon: const Icon(Icons.language_rounded),
                  label: Text(S.of(context).englishLanguage),
                ),
              ],
              onSelectionChanged: (selection) {
                context.read<LocaleCubit>().changeLang(selection.single);
              },
            );
          },
        ),
      ],
    );
  }
}
