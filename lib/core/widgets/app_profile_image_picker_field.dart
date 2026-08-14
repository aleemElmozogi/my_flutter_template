import 'dart:io';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'app_custom_button.dart';

class AppProfilePickerFormField extends StatefulWidget {
  final String name;
  final String? label;
  final String? Function(String?)? validator;

  const AppProfilePickerFormField({
    required this.name,
    this.validator,
    this.label,
    super.key,
  });

  @override
  State<AppProfilePickerFormField> createState() =>
      _AppProfilePickerFormFieldState();
}

class _AppProfilePickerFormFieldState extends State<AppProfilePickerFormField> {
  String? _imagePath;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(FormFieldState<String> field) async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(10.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const AppText('التقاط صورة بالكاميرا'),
                onTap: () => Navigator.of(context).pop(ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const AppText('اختيار صورة من المعرض'),
                onTap: () => Navigator.of(context).pop(ImageSource.gallery),
              ),
            ],
          ),
        );
      },
    );

    if (source != null) {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _imagePath = pickedFile.path;
        });
        field.didChange(_imagePath);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FormBuilderField<String>(
      name: widget.name,
      validator: widget.validator,
      builder: (FormFieldState<String> field) {
        return Column(
          children: [
            AppCustomButton(
              borderRadius: 50.r,
              borderColor: field.hasError
                  ? colorScheme.error
                  : colorScheme.outline,
              contentPadding: EdgeInsets.all(_imagePath != null ? 10.r : 5.r),
              backgroundColor: colorScheme.secondaryContainer,
              onPressed: () async => await _pickImage(field),
              child: _imagePath != null
                  ? ClipOval(
                      child: Image.file(
                        File(_imagePath!),
                        fit: BoxFit.cover,
                        height: 80.r,
                        width: 80.r,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(
                        Icons.image,
                        size: 45.r,
                        color: colorScheme.primary,
                      ),
                    ),
            ),
            if ((widget.label ?? '').isNotEmpty && _imagePath == null) ...[
              SizedBox(height: 5.h),
              AppText(
                widget.label ?? ' ',
                textColor: colorScheme.primary,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ],
            if (field.hasError)
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: AppText(
                  field.errorText ?? '',
                  textColor: colorScheme.error,
                  fontSize: 10.sp,
                ),
              ),
          ],
        );
      },
    );
  }
}
