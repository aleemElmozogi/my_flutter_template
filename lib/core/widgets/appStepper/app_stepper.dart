import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';

class AppStepper extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final ValueChanged<int>? onStepTapped;
  final bool reverseOrder;
  final double circleSize;
  final double connectorThickness;
  final EdgeInsets connectorMargin;
  final Duration animationDuration;
  final EdgeInsets padding;

  const AppStepper({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    this.onStepTapped,
    this.reverseOrder = true,
    this.circleSize = 30,
    this.connectorThickness = 2,
    this.connectorMargin = const EdgeInsets.symmetric(horizontal: 8),
    this.animationDuration = const Duration(milliseconds: 180),
    this.padding = EdgeInsets.zero,
  }) : assert(totalSteps > 0, 'totalSteps must be greater than 0'),
       assert(
         currentStep >= 0,
         'currentStep must be greater than or equal to 0',
       );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final lastStepIndex = totalSteps - 1;
    final normalizedCurrentStep = currentStep.clamp(0, lastStepIndex);
    final displaySteps = _getDisplaySteps(context);

    return Padding(
      padding: padding,
      child: Row(
        children: [
          for (int i = 0; i < displaySteps.length; i++) ...[
            _StepCircle(
              label: '${displaySteps[i] + 1}',
              isActive: displaySteps[i] <= normalizedCurrentStep,
              size: circleSize.w,
              animationDuration: animationDuration,
              onTap: onStepTapped == null
                  ? null
                  : () => onStepTapped!(displaySteps[i]),
            ),
            if (i != displaySteps.length - 1)
              Expanded(
                child: _StepConnector(
                  isActive: _isConnectorActive(
                    displaySteps[i],
                    displaySteps[i + 1],
                    normalizedCurrentStep,
                  ),
                  height: connectorThickness.h,
                  margin: connectorMargin,
                  activeColor: colorScheme.primary,
                  inactiveColor: colorScheme.outlineVariant,
                  animationDuration: animationDuration,
                ),
              ),
          ],
        ],
      ),
    );
  }

  List<int> _getDisplaySteps(BuildContext context) {
    final steps = List<int>.generate(totalSteps, (index) => index);
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final shouldReverse = reverseOrder ? !isRtl : isRtl;

    return shouldReverse ? steps.reversed.toList() : steps;
  }

  bool _isConnectorActive(int firstStep, int secondStep, int currentStep) {
    return firstStep <= currentStep && secondStep <= currentStep;
  }
}

class _StepConnector extends StatelessWidget {
  final bool isActive;
  final double height;
  final EdgeInsets margin;
  final Color activeColor;
  final Color inactiveColor;
  final Duration animationDuration;

  const _StepConnector({
    required this.isActive,
    required this.height,
    required this.margin,
    required this.activeColor,
    required this.inactiveColor,
    required this.animationDuration,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      margin: margin,
      height: height,
      decoration: BoxDecoration(
        color: isActive ? activeColor : inactiveColor,
        borderRadius: BorderRadius.circular(height),
      ),
    );
  }
}

class _StepCircle extends StatelessWidget {
  final String label;
  final bool isActive;
  final double size;
  final Duration animationDuration;
  final VoidCallback? onTap;

  const _StepCircle({
    required this.label,
    required this.isActive,
    required this.size,
    required this.animationDuration,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final fillColor = isActive
        ? colorScheme.primary
        : colorScheme.surfaceContainerHighest;
    final textColor = isActive ? colorScheme.onPrimary : colorScheme.primary;
    final borderColor = isActive ? colorScheme.primary : colorScheme.outline;

    return Semantics(
      button: onTap != null,
      selected: isActive,
      label: 'Step $label',
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: AnimatedContainer(
            duration: animationDuration,
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: fillColor,
              shape: BoxShape.circle,
              border: Border.all(color: borderColor),
            ),
            child: Center(
              child: AppText(
                label,
                textColor: textColor,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
