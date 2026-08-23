import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AppToggleSwitch<T> extends FormBuilderField<T> {
  final Map<T, String> labels;
  final bool textDirectionRTL;
  final double? fontSize;

  AppToggleSwitch({
    super.key,
    required String name,
    required this.labels,
    this.textDirectionRTL = true,
    this.fontSize,
    T? initialValue,
    String? Function(T?)? validator,
    ValueChanged<T?>? onChanged,
  }) : super(
         name: name,
         validator: validator,
         initialValue: initialValue,
         builder: (FormFieldState<T> field) {
           return _AppToggleSwitchWidget(
             field: field,
             labels: labels,
             textDirectionRTL: textDirectionRTL,
             minWidth: .6.sw,
             fontSize: fontSize,
           );
         },
       );
}

class _AppToggleSwitchWidget<T> extends StatelessWidget {
  final FormFieldState<T> field;
  final Map<T, String> labels;
  final double minWidth;
  final bool textDirectionRTL;
  final double? fontSize;

  const _AppToggleSwitchWidget({
    required this.field,
    required this.labels,
    required this.textDirectionRTL,
    required this.minWidth,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sortedLabels = labels.entries.toList();
    final labelList = sortedLabels.map((e) => e.value).toList();
    final initialLabelIndex = sortedLabels.indexWhere(
      (e) => e.key == field.value,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ToggleSwitch(
          textDirectionRTL: textDirectionRTL,
          minWidth: minWidth,
          minHeight: 0.04.sh,
          initialLabelIndex: initialLabelIndex != -1 ? initialLabelIndex : 0,
          totalSwitches: labels.length,
          fontSize: fontSize ?? 14.sp,
          labels: labelList,
          inactiveFgColor: theme.colorScheme.onSurface,
          activeBgColor: List.generate(
            labels.length,
            (index) => theme.colorScheme.primary,
          ),
          inactiveBgColor: theme.colorScheme.surfaceContainerHighest,
          dividerColor: theme.colorScheme.primary,
          onToggle: (int? index) {
            if (index != null && index < sortedLabels.length) {
              field.didChange(sortedLabels[index].key);
            }
          },
        ),
        if (field.errorText != null) ...[
          SizedBox(height: 5.h),
          AppText(
            field.errorText ?? '',
            textColor: theme.colorScheme.error,
            fontSize: 10.sp,
          ),
        ],
      ],
    );
  }
}
