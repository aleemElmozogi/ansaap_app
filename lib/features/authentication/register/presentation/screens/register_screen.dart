import 'package:auto_route/auto_route.dart';
import 'package:ansaap_app/config/routes/app_router.dart';
import 'package:ansaap_app/core/validation/input_validation.dart';
import 'package:ansaap_app/core/widgets/app_button.dart';
import 'package:ansaap_app/core/widgets/app_date_form_field.dart';
import 'package:ansaap_app/core/widgets/app_scaffold.dart';
import 'package:ansaap_app/core/widgets/app_text.dart';
import 'package:ansaap_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  String newPassword = '';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: 'التسجيل',
        body: FormBuilder(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(
                  'أدخل البيانات الأتية للتسجيل.',
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                ),
                SizedBox(height: 30.h),
                AppTextFormField(
                  name: 'userName',
                  validator: InputValidation.userName(),
                  labelText: 'إسم المستخدم',
                  description:
                      '* يجب أن يتكون من أحرف وأرقام إنجليزية و . و _ فقط.',
                ),
                const SizedBox(height: 20),
                AppTextFormField(
                  name: 'password',
                  validator: InputValidation.passwordValidation(),
                  isPassword: true,
                  labelText: 'كلمة المرور',
                  description: '* يجب أن تتكون من 8 أحرف على الأقل.',
                  onChanged: (value) {
                    setState(() {
                      newPassword = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                AppTextFormField(
                  name: 'confirmPassword',
                  validator: InputValidation.matchValidation(newPassword),
                  labelText: 'تأكيد كلمة المرور',
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                AppTextFormField(
                  name: 'fullName',
                  labelText: 'الإسم بالكامل (إختياري)',
                ),
                const SizedBox(height: 20),
                AppTextFormField(
                  name: 'email',
                  labelText: 'البريد الإلكتروني (إختياري)',
                ),
                const SizedBox(height: 25),
                AppButton(
                    title: "تسجيل",
                    onTab: () {
                      if (_formKey.currentState!.saveAndValidate()) {
                        final creeds = _formKey.currentState?.input;
                        if (creeds != null) {
                          // creeds['sdsds'] ;
                          context.router.popUntilRouteWithName(LoginRoute.name);
                        }
                      }
                    }),
              ],
            ),
          ),
        ));
  }
}

extension on FormBuilderState {
  ({
    String userName,
    String password,
    String fullName,
    String email,
    String confirmPassword
  })? get input {
    final userName = value['userName'] as String?;
    final confirmPassword = value['confirmPassword'] as String?;
    final email = value['email'] as String?;
    final password = value['password'] as String?;
    final fullName = value['fullName'] as String?;
    if (password == null || confirmPassword == null || userName == null) {
      return null;
    }
    return (
    userName: userName,
      password: password,
      email: email ?? '',
      fullName: fullName ?? '',
      confirmPassword: confirmPassword
    );
  }
}
