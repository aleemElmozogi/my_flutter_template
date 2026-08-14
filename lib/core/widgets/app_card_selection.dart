import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';

enum AppCardSelectionLayout { horizontal, grid2 }

class AppCardSelectionOption<T> {
  const AppCardSelectionOption({
    required this.value,
    required this.label,
    this.iconData,
    this.icon,
  });

  final T value;
  final String label;
  final IconData? iconData;
  final Widget? icon;
}

class AppCardSelection<T> extends StatelessWidget {
  const AppCardSelection({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    this.layout = AppCardSelectionLayout.horizontal,
    this.spacing = 8,
    this.runSpacing = 8,
    this.cardHeight = 42,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.gridChildAspectRatio = 3.2,
    this.horizontalPadding = EdgeInsets.zero,
    this.selectedColor,
    this.unselectedColor,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.selectedBorderColor,
    this.unselectedBorderColor,
  });

  final List<AppCardSelectionOption<T>> options;
  final T? selectedValue;
  final ValueChanged<T> onChanged;
  final AppCardSelectionLayout layout;
  final double spacing;
  final double runSpacing;
  final double cardHeight;
  final double borderRadius;
  final EdgeInsets padding;
  final double gridChildAspectRatio;
  final EdgeInsets horizontalPadding;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final Color? selectedBorderColor;
  final Color? unselectedBorderColor;

  @override
  Widget build(BuildContext context) {
    if (layout == AppCardSelectionLayout.grid2) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: options.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: spacing.w,
          mainAxisSpacing: runSpacing.h,
          childAspectRatio: gridChildAspectRatio,
        ),
        itemBuilder: (context, index) {
          final option = options[index];
          return _AppCardSelectionItem<T>(
            option: option,
            isSelected: option.value == selectedValue,
            onTap: () => onChanged(option.value),
            expand: true,
            height: cardHeight,
            borderRadius: borderRadius,
            padding: padding,
            selectedColor: selectedColor,
            unselectedColor: unselectedColor,
            selectedTextColor: selectedTextColor,
            unselectedTextColor: unselectedTextColor,
            selectedBorderColor: selectedBorderColor,
            unselectedBorderColor: unselectedBorderColor,
          );
        },
      );
    }

    final textDirection = Directionality.of(context);
    return Directionality(
      textDirection: textDirection,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: horizontalPadding,
          child: Row(
            textDirection: textDirection,
            children: [
              for (int i = 0; i < options.length; i++) ...[
                _AppCardSelectionItem<T>(
                  option: options[i],
                  isSelected: options[i].value == selectedValue,
                  onTap: () => onChanged(options[i].value),
                  expand: false,
                  height: cardHeight,
                  borderRadius: borderRadius,
                  padding: padding,
                  selectedColor: selectedColor,
                  unselectedColor: unselectedColor,
                  selectedTextColor: selectedTextColor,
                  unselectedTextColor: unselectedTextColor,
                  selectedBorderColor: selectedBorderColor,
                  unselectedBorderColor: unselectedBorderColor,
                ),
                if (i != options.length - 1) SizedBox(width: spacing.w),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class AppCardSelectionFormField<T> extends FormBuilderField<T> {
  AppCardSelectionFormField({
    super.key,
    required super.name,
    required List<AppCardSelectionOption<T>> options,
    ValueChanged<T>? onChanged,
    AppCardSelectionLayout layout = AppCardSelectionLayout.horizontal,
    double spacing = 8,
    double runSpacing = 8,
    double cardHeight = 42,
    double borderRadius = 10,
    EdgeInsets padding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),
    double gridChildAspectRatio = 3.2,
    EdgeInsets horizontalPadding = EdgeInsets.zero,
    Color? selectedColor,
    Color? unselectedColor,
    Color? selectedTextColor,
    Color? unselectedTextColor,
    Color? selectedBorderColor,
    Color? unselectedBorderColor,
    final String? Function(String?)? validator,
    super.initialValue,
    super.enabled,
  }) : super(
         builder: (field) {
           final value = field.value;
           return _AppCardSelectionFormFieldBody<T>(
             name: name,
             field: field,
             options: options,
             selectedValue: value,
             onChanged: onChanged,
             layout: layout,
             spacing: spacing,
             runSpacing: runSpacing,
             cardHeight: cardHeight,
             borderRadius: borderRadius,
             padding: padding,
             gridChildAspectRatio: gridChildAspectRatio,
             horizontalPadding: horizontalPadding,
             selectedColor: selectedColor,
             unselectedColor: unselectedColor,
             selectedTextColor: selectedTextColor,
             unselectedTextColor: unselectedTextColor,
             selectedBorderColor: selectedBorderColor,
             unselectedBorderColor: unselectedBorderColor,
           );
         },
       );
}

class _AppCardSelectionItem<T> extends StatelessWidget {
  const _AppCardSelectionItem({
    required this.option,
    required this.isSelected,
    required this.onTap,
    required this.expand,
    required this.height,
    required this.borderRadius,
    required this.padding,
    required this.selectedColor,
    required this.unselectedColor,
    required this.selectedTextColor,
    required this.unselectedTextColor,
    required this.selectedBorderColor,
    required this.unselectedBorderColor,
  });

  final AppCardSelectionOption<T> option;
  final bool isSelected;
  final VoidCallback onTap;
  final bool expand;
  final double height;
  final double borderRadius;
  final EdgeInsets padding;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final Color? selectedBorderColor;
  final Color? unselectedBorderColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final resolvedSelectedColor =
        selectedColor ?? colorScheme.primary.withValues(alpha: 0.12);
    final resolvedUnselectedColor =
        unselectedColor ?? colorScheme.surfaceContainerHighest;
    final resolvedSelectedTextColor = selectedTextColor ?? colorScheme.primary;
    final resolvedUnselectedTextColor =
        unselectedTextColor ?? colorScheme.onSurfaceVariant;
    final resolvedSelectedBorderColor =
        selectedBorderColor ?? colorScheme.primary;
    final resolvedUnselectedBorderColor =
        unselectedBorderColor ?? colorScheme.outlineVariant;

    final animationDuration = const Duration(milliseconds: 220);
    final animationCurve = Curves.easeOutCubic;

    final content = AnimatedSwitcher(
      duration: const Duration(milliseconds: 180),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) {
        final slide =
            Tween<Offset>(
              begin: const Offset(0.08, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            );

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: slide, child: child),
        );
      },
      child: AnimatedScale(
        key: ValueKey<bool>(isSelected),
        duration: animationDuration,
        curve: animationCurve,
        scale: isSelected ? 1.01 : 1,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(borderRadius.r),
            child: AnimatedContainer(
              duration: animationDuration,
              curve: animationCurve,
              height: height.h,
              width: expand ? double.infinity : null,
              padding: EdgeInsets.fromLTRB(
                padding.left.w,
                padding.top.h,
                padding.right.w,
                padding.bottom.h,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? resolvedSelectedColor
                    : resolvedUnselectedColor,
                borderRadius: BorderRadius.circular(borderRadius.r),
                border: Border.all(
                  color: isSelected
                      ? resolvedSelectedBorderColor
                      : resolvedUnselectedBorderColor,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: resolvedSelectedBorderColor.withValues(
                            alpha: 0.10,
                          ),
                          blurRadius: 6.r,
                          offset: Offset(0, 2.h),
                        ),
                      ]
                    : null,
              ),
              child: AnimatedDefaultTextStyle(
                duration: animationDuration,
                curve: animationCurve,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                  color: isSelected
                      ? resolvedSelectedTextColor
                      : resolvedUnselectedTextColor,
                ),
                child: Row(
                  mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (option.iconData != null || option.icon != null) ...[
                      AnimatedSwitcher(
                        duration: animationDuration,
                        switchInCurve: animationCurve,
                        switchOutCurve: Curves.easeInCubic,
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: ScaleTransition(
                              scale: animation,
                              child: child,
                            ),
                          );
                        },
                        child: option.icon != null
                            ? IconTheme(
                                key: ValueKey<bool>(isSelected),
                                data: IconThemeData(
                                  size: 16.sp,
                                  color: isSelected
                                      ? resolvedSelectedTextColor
                                      : resolvedUnselectedTextColor,
                                ),
                                child: option.icon!,
                              )
                            : Icon(
                                option.iconData,
                                key: ValueKey<bool>(isSelected),
                                size: 16.sp,
                                color: isSelected
                                    ? resolvedSelectedTextColor
                                    : resolvedUnselectedTextColor,
                              ),
                      ),
                      SizedBox(width: 6.w),
                    ],
                    Flexible(
                      child: AppText(
                        option.label,
                        fontSize: 13,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w600,
                        textColor: isSelected
                            ? resolvedSelectedTextColor
                            : resolvedUnselectedTextColor,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    if (expand) {
      return content;
    }

    return IntrinsicWidth(child: content);
  }
}

class _AppCardSelectionFormFieldBody<T> extends StatelessWidget {
  const _AppCardSelectionFormFieldBody({
    required this.name,
    required this.field,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    required this.layout,
    required this.spacing,
    required this.runSpacing,
    required this.cardHeight,
    required this.borderRadius,
    required this.padding,
    required this.gridChildAspectRatio,
    required this.horizontalPadding,
    required this.selectedColor,
    required this.unselectedColor,
    required this.selectedTextColor,
    required this.unselectedTextColor,
    required this.selectedBorderColor,
    required this.unselectedBorderColor,
  });

  final String name;
  final FormFieldState<T> field;
  final List<AppCardSelectionOption<T>> options;
  final T? selectedValue;
  final ValueChanged<T>? onChanged;
  final AppCardSelectionLayout layout;
  final double spacing;
  final double runSpacing;
  final double cardHeight;
  final double borderRadius;
  final EdgeInsets padding;
  final double gridChildAspectRatio;
  final EdgeInsets horizontalPadding;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final Color? selectedBorderColor;
  final Color? unselectedBorderColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Semantics(
      label: name,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCardSelection<T>(
            options: options,
            selectedValue: selectedValue,
            onChanged: (value) {
              field.didChange(value);
              onChanged?.call(value);
            },
            layout: layout,
            spacing: spacing,
            runSpacing: runSpacing,
            cardHeight: cardHeight,
            borderRadius: borderRadius,
            padding: padding,
            gridChildAspectRatio: gridChildAspectRatio,
            horizontalPadding: horizontalPadding,
            selectedColor: selectedColor,
            unselectedColor: unselectedColor,
            selectedTextColor: selectedTextColor,
            unselectedTextColor: unselectedTextColor,
            selectedBorderColor: field.hasError
                ? colorScheme.error
                : selectedBorderColor,
            unselectedBorderColor: field.hasError
                ? colorScheme.error.withValues(alpha: 0.4)
                : unselectedBorderColor,
          ),
          if (field.hasError) ...[
            SizedBox(height: 5.h),
            AppText(
              field.errorText ?? '',
              textColor: colorScheme.error,
              fontSize: 10,
              textAlign: TextAlign.start,
            ),
          ],
        ],
      ),
    );
  }
}
