import 'package:auto_route/auto_route.dart';
import 'package:my_flutter_template/core/enums/fetch_status.dart';
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
import 'package:my_flutter_template/generated/l10n.dart';

part '../listeners/sign_in_listener.dart';

class _LoginFormFields {
  const _LoginFormFields._();

  static const phone = 'phone';
  static const password = 'password';
  static const rememberLogin = 'rememberLogin';
  static const biometricLogin = 'biometricLogin';
}

@RoutePage()
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      listenersList: listeners,
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                S.of(context).loginTitle,
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
              SizedBox(height: 30.h),
              AppTextFormField(
                name: _LoginFormFields.phone,
                validator: InputValidation.phoneNumberValidation(),
                hintText: S.of(context).phoneNumber,
                maxLength: 9,
                prefixIcon: Icons.phone,
              ),
              const SizedBox(height: 20),
              AppTextFormField(
                name: _LoginFormFields.password,
                validator: InputValidation.requiredValidation(),
                isPassword: true,
                hintText: S.of(context).password,
                prefixIcon: Icons.lock_rounded,
              ),
              const SizedBox(height: 10),
              FormBuilderCheckbox(
                name: _LoginFormFields.rememberLogin,
                initialValue: false,
                activeColor: Theme.of(context).colorScheme.primary,
                title: AppText(S.of(context).rememberThisLogin),
              ),
              FormBuilderCheckbox(
                name: _LoginFormFields.biometricLogin,
                initialValue: false,
                activeColor: Theme.of(context).colorScheme.primary,
                title: AppText(S.of(context).enableBiometricLogin),
              ),
              const SizedBox(height: 15),
              BlocBuilder<AuthCubit, AuthState>(
                buildWhen: (previous, current) =>
                    previous.signInStatus != current.signInStatus,
                builder: (context, state) {
                  return state.signInStatus.isInProgress
                      ? const Center(child: AppLoadingIndicator())
                      : AppButton(
                          title: S.of(context).loginTitle,
                          onTab: () => _submitLogin(context),
                        );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(S.of(context).dontHaveAccount, fontSize: 15.sp),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _submitLogin(BuildContext context) {
    final form = _formKey.currentState;
    if (form?.saveAndValidate() != true) return;

    final input = form?.input;
    if (input == null) return;

    context.read<AuthCubit>().login(
      input.phone,
      input.password,
      rememberLogin: input.rememberLogin,
      biometricLogin: input.biometricLogin,
    );
  }
}

extension on FormBuilderState {
  ({String phone, String password, bool rememberLogin, bool biometricLogin})?
  get input {
    final phone = value[_LoginFormFields.phone];
    final password = value[_LoginFormFields.password];
    final rememberLogin = value[_LoginFormFields.rememberLogin] == true;
    final biometricLogin = value[_LoginFormFields.biometricLogin] == true;

    if (phone is! String || password is! String) return null;

    final trimmedPhone = phone.trim();
    if (trimmedPhone.isEmpty || password.isEmpty) return null;

    return (
      phone: trimmedPhone,
      password: password,
      rememberLogin: rememberLogin,
      biometricLogin: biometricLogin,
    );
  }
}
