import 'dart:io';
import 'package:my_flutter_template/config/themes/app_theme.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_flutter_template/generated/l10n.dart';

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
    final theme = Theme.of(context);

    return FormBuilderField<String>(
      name: widget.name,
      validator: widget.validator,
      builder: (FormFieldState<String> field) {
        return Column(
          children: [
            AppCustomButton(
              borderColor: field.hasError
                  ? theme.colorScheme.error
                  : theme.appColors.border,
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
                          color: theme.colorScheme.primary,
                        ),
                        SizedBox(height: 10.h),
                        AppText(S.of(context).uploadImageTitle),
                        SizedBox(height: 2.h),
                        AppText(
                          S.of(context).uploadImageDescription,
                          maxLines: 2,
                          textColor: theme.appColors.mutedText,
                        ),
                      ],
                    ),
            ),
            if (field.hasError)
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: AppText(
                  field.errorText ?? '',
                  textColor: theme.colorScheme.error,
                  fontSize: 10.sp,
                ),
              ),
          ],
        );
      },
    );
  }
}
