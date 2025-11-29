import 'package:my_flutter_template/core/utils/app_strings.dart';
import 'package:my_flutter_template/core/utils/dialog_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:my_flutter_template/core/utils/app_colors.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'app_custom_button.dart';

class AppLocationPickerFormField extends StatefulWidget {
  final String name;
  final String? Function(String?)? validator;

  const AppLocationPickerFormField({
    required this.name,
    this.validator,
    super.key,
  });

  @override
  _AppLocationPickerFormFieldState createState() =>
      _AppLocationPickerFormFieldState();
}

class _AppLocationPickerFormFieldState
    extends State<AppLocationPickerFormField> {
  String? _selectedLocation;
  String? city;
  String? country;
  Future<void> _pickLocation(
      FormFieldState<String> field, BuildContext context) async {
    context.showAppBottomSheet(
      child: SizedBox(
        height: .8.sh,
        child: MapLocationPicker(
            config: MapLocationPickerConfig(
          apiKey: AppStrings.googleMapsApiKey,
          hideMoreOptions: true,
          initialMapType: MapType.normal,
          onNext: (result) {
            if (result != null) {
              result.geometry.location.lat;
              String? address = result.formattedAddress;
              for (var component in result.addressComponents) {
                if (component.types.contains('locality')) {
                  setState(() {
                    city = component.longName;
                  });
                } else if (component.types.contains('country')) {
                  setState(() {
                    country = component.longName;
                  });
                }
              }
              setState(() {
                _selectedLocation =
                    "Address\nLat: ${result.geometry.location.lat}, Lng: ${result.geometry.location.lng}";
              });
              field.didChange(_selectedLocation);
              Navigator.pop(context);
            }
          },
        )),
      ),
    );
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
              contentPadding:
                  EdgeInsets.all(_selectedLocation != null ? 0 : 5.r),
              onPressed: () async => await _pickLocation(field, context),
              child: _selectedLocation != null
                  ? SizedBox(
                      height: 100.h,
                      width: 1.sw,
                      child: Center(
                        child: AppText(
                          'تم اختيار العنوان',
                          textColor: AppColors.primary,
                          fontSize: 15.sp,
                        ),
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 35.r,
                          color: AppColors.primary,
                        ),
                        SizedBox(height: 10.h),
                        const AppText('اختر موقعك'),
                        SizedBox(height: 2.h),
                        const AppText(
                          'اضغط هنا لفتح الخريطة واختيار موقعك',
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
