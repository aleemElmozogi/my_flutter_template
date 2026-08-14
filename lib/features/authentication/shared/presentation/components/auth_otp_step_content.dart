import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_template/core/validation/input_validation.dart';
import 'package:my_flutter_template/core/widgets/app_clickable_text.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:my_flutter_template/core/widgets/app_text_form_field.dart';
import 'package:my_flutter_template/core/widgets/loading_indicator.dart';

class AuthOtpStepContent extends StatefulWidget {
  const AuthOtpStepContent({
    super.key,
    required this.formKey,
    required this.cooldownSeconds,
    required this.onResendTap,
    required this.shouldRestartCooldown,
    required this.isResending,
  });

  final GlobalKey<FormBuilderState> formKey;
  final int cooldownSeconds;
  final Future<void> Function() onResendTap;
  final bool shouldRestartCooldown;
  final bool isResending;

  @override
  State<AuthOtpStepContent> createState() => _AuthOtpStepContentState();
}

class _AuthOtpStepContentState extends State<AuthOtpStepContent> {
  Timer? _timer;
  int _secondsLeft = 0;

  @override
  void initState() {
    super.initState();
    if (widget.shouldRestartCooldown) {
      _startCooldown();
    }
  }

  @override
  void didUpdateWidget(covariant AuthOtpStepContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.shouldRestartCooldown && widget.shouldRestartCooldown) {
      _startCooldown();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startCooldown() {
    _timer?.cancel();
    setState(() {
      _secondsLeft = widget.cooldownSeconds;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_secondsLeft <= 1) {
        timer.cancel();
        setState(() {
          _secondsLeft = 0;
        });
        return;
      }
      setState(() {
        _secondsLeft -= 1;
      });
    });
  }

  Future<void> _handleResend() async {
    if (_secondsLeft > 0) return;
    await widget.onResendTap();
    setState(() {
      _secondsLeft = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: .start,
      children: [
        const AppText(
          'رمز التحقق',
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 6.h),
        AppText(
          'أدخل الرمز المرسل إلى هاتفك',
          textAlign: TextAlign.start,
          textColor: colorScheme.onSurfaceVariant,
        ),
        SizedBox(height: 20.h),
        FormBuilder(
          key: widget.formKey,
          child: AppTextFormField(
            name: 'otp',
            hintText: '123456',
            labelText: 'رمز التحقق',
            prefixIcon: Icons.verified_user_outlined,
            keyboardType: TextInputType.number,
            maxLength: 6,
            validator: InputValidation.otpValidation(),
          ),
        ),
        SizedBox(height: 6.h),
        widget.isResending
            ? Center(child: AppLoadingIndicator(size: 25))
            : AppClickableText(
                title: _secondsLeft == 0
                    ? 'إعادة إرسال الرمز'
                    : 'إعادة الإرسال خلال $_secondsLeft ثانية',
                onTap: _handleResend,
                textColor: _secondsLeft == 0
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant,
                withSplash: _secondsLeft == 0,
              ),
      ],
    );
  }
}
