import 'package:ansaap_app/core/utils/app_launcher.dart';
import 'package:ansaap_app/core/widgets/app_custom_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ansaap_app/config/routes/app_router.dart';
import 'package:ansaap_app/core/enums/fetch_status.dart';
import 'package:ansaap_app/core/utils/app_colors.dart';
import 'package:ansaap_app/core/utils/dialog_extension.dart';
import 'package:ansaap_app/core/widgets/app_button.dart';
import 'package:ansaap_app/core/widgets/app_scaffold.dart';
import 'package:ansaap_app/core/widgets/app_text.dart';
import 'package:ansaap_app/core/widgets/app_text_form_field.dart';
import 'package:ansaap_app/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ansaap_app/core/validation/input_validation.dart';
import 'package:ansaap_app/features/authentication/auth/presentation/cubit/auth_cubit.dart';
import 'package:ansaap_app/features/authentication/auth/presentation/cubit/auth_state.dart';
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
      body: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (previous, current) =>
            previous.signInStatus != current.signInStatus,
        builder: (context, state) {
          return Column(
            children: [
              Hero(
                tag: 'appName',
                child: AppText(
                  'أَنْسَابْ',
                  fontWeight: FontWeight.w700,
                  fontSize: 50.sp,
                  textColor: AppColors.primary,
                ),
              ),
              SizedBox(height: 30.h),
              FormBuilder(
                key: _formKey,
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      AppTextFormField(
                        name: 'userName',
                        validator: InputValidation.emailValidation(),
                        labelText: 'إسم المستخدم',
                        maxLength: 9,
                      ),
                      SizedBox(height: 20.h),
                      AppTextFormField(
                        name: 'password',
                        validator: InputValidation.requiredValidation(),
                        isPassword: true,
                        labelText: 'كلمة المرور',
                        prefixIcon: Icons.lock_rounded,
                      ),
                      SizedBox(height: 25.h),
                      BlocBuilder<AuthCubit, AuthState>(
                        buildWhen: (previous, current) =>
                            previous.signInStatus != current.signInStatus,
                        builder: (context, state) {
                          return state.signInStatus.isInProgress
                              ? const Center(child: AppLoadingIndicator())
                              : AppButton(
                                  title: "تسجيل الدخول",
                                  onTab: () {
                                    if (_formKey.currentState!
                                        .saveAndValidate()) {
                                      final creeds =
                                          _formKey.currentState?.input;
                                      if (creeds != null) {
                                        context.read<AuthCubit>().login(
                                            creeds.phone, creeds.password);
                                      }
                                    }
                                  });
                        },
                      ),
                      SizedBox(height: 25.h),
                      InkWell(
                        onTap: () => context.router.push(PhoneInputRoute(
                            onSuccess: (v) =>
                                context.router.push(ResetPasswordRoute()))),
                        child: AppText(
                          'نسيت كلمة السر؟',
                          textColor: AppColors.primary,
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            'ليس لديك حساب؟  ',
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
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                            thickness: .4,
                          )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7.w),
                            child: AppText(
                              'أو',
                              textColor: AppColors.primary,
                              fontSize: 15.sp,
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            thickness: .4,
                          )),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      AppCustomButton(
                          child: SizedBox(
                            width: 1.sw,
                            height: 40.h,
                            child: Center(
                              child: AppText(
                                'الدخول كزائر',
                                textColor: AppColors.primary,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                          onPressed: () =>
                              context.router.replaceAll([const MainRoute()])),
                      SizedBox(height: 50.h),
                      InkWell(
                          onTap: () => AppLauncher().callPhoneNumber(),
                          child: AppText("تواصل معنا",
                              textColor: AppColors.primary))
                    ],
                  ),
                ),
              ),
            ],
          );
        },
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