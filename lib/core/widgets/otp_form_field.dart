import 'package:my_flutter_template/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppOtpFormField extends StatelessWidget {
  final int length;
  final String name;
  final String? Function(String?)? validator;
  const AppOtpFormField(
      {super.key,
      required this.length,
      required this.name,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: name,
      builder: (FormFieldState<String> field) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: PinCodeTextField(
            appContext: context,
            length: length,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            enableActiveFill: true,
            onCompleted: field.didChange,
            // onChanged: field.didChange,
            errorTextDirection: TextDirection.rtl,
            validator: validator,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              activeColor: AppColors.lightGrey,
              activeFillColor: AppColors.lightGrey,
              inactiveColor: AppColors.lightGrey,
              inactiveFillColor: AppColors.lightGrey,
              selectedColor: AppColors.primary,
              selectedFillColor: AppColors.lightGrey,
              borderRadius: const BorderRadius.all(
                Radius.circular(7),
              ),
              fieldHeight: 50.h,
            ),
          ),
        );
      },
    );
  }
}
