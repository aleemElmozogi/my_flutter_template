import 'package:auto_route/auto_route.dart';
import 'package:my_flutter_template/config/routes/app_router.dart';
import 'package:my_flutter_template/core/enums/fetch_status.dart';
import 'package:my_flutter_template/core/utils/app_colors.dart';
import 'package:my_flutter_template/core/utils/dialog_extension.dart';
import 'package:my_flutter_template/core/widgets/app_button.dart';
import 'package:my_flutter_template/core/widgets/app_scaffold.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:my_flutter_template/core/widgets/app_text_form_field.dart';
import 'package:my_flutter_template/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_template/core/validation/input_validation.dart';
import 'package:my_flutter_template/features/authentication/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_flutter_template/features/authentication/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part '../listeners/sign_in_listener.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      listenersList: listeners,
      body: SingleChildScrollView(
        child: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (previous, current) =>
              previous.signInStatus != current.signInStatus,
          builder: (context, state) {
            return FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    'تسجيل الدخول',
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),
                  SizedBox(height: 30.h),
                  AppTextFormField(
                    name: 'phone',
                    validator: InputValidation.phoneNumberValidation(),
                    hintText: 'رقم الهاتف',
                    maxLength: 9,
                    prefixIcon: Icons.phone,
                  ),
                  const SizedBox(height: 20),
                  AppTextFormField(
                    name: 'password',
                    validator: InputValidation.requiredValidation(),
                    isPassword: true,
                    hintText: 'كلمة المرور',
                    prefixIcon: Icons.lock_rounded,
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () => context.router.push(PhoneInputRoute(
                        onSuccess: (v) => context.router
                            .push(ForgetPasswordRoute(phoneNumber: v)))),
                    child: AppText(
                      'نسيت كلمة السر؟',
                      textColor: AppColors.primary,
                      fontSize: 15.sp,
                    ),
                  ),
                  const SizedBox(height: 15),
                  BlocBuilder<AuthCubit, AuthState>(
                    buildWhen: (previous, current) =>
                        previous.signInStatus != current.signInStatus,
                    builder: (context, state) {
                      return state.signInStatus.isInProgress
                          ? const Center(child: AppLoadingIndicator())
                          : AppButton(
                              title: "تسجيل الدخول",
                              onTab: () {
                                if (_formKey.currentState!.saveAndValidate()) {
                                  final creeds = _formKey.currentState?.input;
                                  if (creeds != null) {
                                    context
                                        .read<AuthCubit>()
                                        .login(creeds.phone, creeds.password);
                                  }
                                }
                              });
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        'ليس لديك حساب؟ ',
                        fontSize: 15.sp,
                      ),
                      InkWell(
                        onTap: () => context.router.push(PhoneInputRoute(
                            onSuccess: (v) => context.router
                                .push(RegisterRoute(phoneNumber: v)))),
                        child: AppText(
                          'التسجيل',
                          fontSize: 15.sp,
                          textColor: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () => context.router.replaceAll([const MainRoute()]),
                    child: AppText(
                      'الإستمرار كضيف',
                      textColor: AppColors.primary,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

extension on FormBuilderState {
  ({String phone, String password})? get input {
    final phone = value['phone'] as String?;
    final password = value['password'] as String?;
    if (phone == null || password == null) return null;
    return (phone: phone, password: password);
  }
}
