import 'dart:io';
import 'package:my_flutter_template/config/themes/app_theme.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_flutter_template/generated/l10n.dart';

import 'app_custom_button.dart';

class AppProfilePickerFormField extends StatefulWidget {
  final String name;
  final String? Function(String?)? validator;

  const AppProfilePickerFormField({
    required this.name,
    this.validator,
    super.key,
  });

  @override
  _AppProfilePickerFormFieldState createState() =>
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
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: AppText(S.of(context).takePhotoWithCamera),
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: AppText(S.of(context).choosePhotoFromGallery),
              onTap: () => Navigator.of(context).pop(ImageSource.gallery),
            ),
          ],
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
    final theme = Theme.of(context);

    return FormBuilderField<String>(
      name: widget.name,
      validator: widget.validator,
      builder: (FormFieldState<String> field) {
        return Column(
          children: [
            AppCustomButton(
              borderRadius: 50.r,
              borderColor: field.hasError
                  ? theme.colorScheme.error
                  : theme.appColors.border,
              contentPadding: EdgeInsets.all(_imagePath != null ? 10.r : 5.r),
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
                  : Icon(Icons.person, size: 80.r),
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
