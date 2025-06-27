import 'dart:io';
import 'package:my_flutter_template/core/utils/app_colors.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'app_custom_button.dart';

class AppImagePickerFormField extends StatefulWidget {
  final String name;
  final String? Function(String?)? validator;

  const AppImagePickerFormField({
    required this.name,
    this.validator,
    super.key,
  });

  @override
  _AppImagePickerFormFieldState createState() =>
      _AppImagePickerFormFieldState();
}

class _AppImagePickerFormFieldState extends State<AppImagePickerFormField> {
  String? _imagePath;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(FormFieldState<String> field) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
      field.didChange(_imagePath); // Update FormBuilderState
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: widget.name,
      validator: widget.validator,
      builder: (FormFieldState<String> field) {
        return Column(
          children: [
            AppCustomButton(
              borderColor:
                  field.hasError ? Colors.red.shade900 : AppColors.grey,
              contentPadding: EdgeInsets.all(_imagePath != null ? 0 : 5.r),

              onPressed: () async => await _pickImage(field),
              child: _imagePath != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10.0.r),
                      child: Image.file(
                        File(_imagePath!),
                        height: 100.h,
                        width: 1.sw,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.photo,
                          size: 35.r,
                          color: AppColors.primary,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const AppText(
                          'قم برفع صورتك',
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const AppText(
                          'اضغط هنا لتصفح الكاميرا ورفع صورتك',
                          maxLines: 2,
                          textColor: AppColors.grey,
                        ),
                      ],
                    ),
            ),
            if (field.hasError)
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: AppText(
                  field.errorText ?? '',
                  textColor: Colors.red.shade900,
                  fontSize: 10.sp,
                ),
              ),
          ],
        );
      },
    );
  }
}
