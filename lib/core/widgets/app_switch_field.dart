import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppToggleSwitch<T extends Object> extends StatelessWidget {
  final Map<T, String> labels;
  final bool textDirectionRTL;
  final double? fontSize;
  final String name;
  final String? label;
  final T? initialValue;
  final FormFieldValidator<T>? validator;
  final ValueChanged<T?>? onChanged;

  const AppToggleSwitch({
    super.key,
    required this.name,
    required this.labels,
    this.textDirectionRTL = true,
    this.fontSize,
    this.initialValue,
    this.label,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<T>(
      name: name,
      initialValue: initialValue,
      validator: validator,
      builder: (FormFieldState<T> field) {
        return _AppToggleSwitchWidget<T>(
          field: field,
          labels: labels,
          label: label,
          textDirectionRTL: textDirectionRTL,
          minWidth: .9.sw,
          fontSize: fontSize,
          onChanged: onChanged,
        );
      },
    );
  }
}

class _AppToggleSwitchWidget<T extends Object> extends StatelessWidget {
  final FormFieldState<T> field;
  final Map<T, String> labels;
  final double minWidth;
  final String? label;
  final bool textDirectionRTL;
  final double? fontSize;
  final ValueChanged<T?>? onChanged;

  const _AppToggleSwitchWidget({
    required this.field,
    required this.labels,
    required this.textDirectionRTL,
    required this.minWidth,
    required this.fontSize,
    this.onChanged,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final sortedLabels = labels.entries.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          AppText(
            label!,
            fontSize: 13.sp,
            textColor: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          SizedBox(height: 4.h),
        ],
        Container(
          width: minWidth,
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: field.hasError
                  ? Theme.of(context).colorScheme.error
                  : Colors.transparent,
            ),
          ),
          child: CupertinoSlidingSegmentedControl<T>(
            groupValue: field.value,
            thumbColor: Theme.of(context).colorScheme.primary,
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            children: {
              for (final entry in sortedLabels)
                entry.key: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  child: AppText(
                    entry.value,
                    textAlign: TextAlign.center,
                    fontSize: fontSize ?? 13.sp,
                    textColor: (field.value) == entry.key
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
            },
            onValueChanged: (value) {
              field.didChange(value);
              onChanged?.call(value);
            },
          ),
        ),
        if (field.errorText != null) ...[
          SizedBox(height: 5.h),
          AppText(
            field.errorText ?? '',
            textColor: Theme.of(context).colorScheme.error,
            fontSize: 10.sp,
          ),
        ],
      ],
    );
  }
}
