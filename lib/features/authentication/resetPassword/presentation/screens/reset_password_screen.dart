import 'package:ansaap_app/config/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ansaap_app/core/utils/app_colors.dart';
import 'package:ansaap_app/core/utils/assets_manager.dart';
import 'package:ansaap_app/core/validation/input_validation.dart';
import 'package:ansaap_app/core/widgets/app_button.dart';
import 'package:ansaap_app/core/widgets/app_scaffold.dart';
import 'package:ansaap_app/core/widgets/app_text.dart';
import 'package:ansaap_app/core/widgets/app_text_form_field.dart';
import 'package:ansaap_app/core/widgets/otp_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen(
      {super.key, });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  String newPassword = '';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'إعادة تعيين كلمة المرور',
      body: FormBuilder(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              'أدخل كلمة مرور جديدة.',
              fontWeight: FontWeight.w600,
              fontSize: 25.sp,
            ),
            SizedBox(height: 35.h),
            AppTextFormField(
                name: 'newPassword',
                validator: InputValidation.requiredValidation(),
                labelText: 'كلمة المرور',
                maxLength: 12,
                isPassword: true,
                onChanged: (value) {
                  setState(() {
                    newPassword = value;
                  });
                },
                description: '* يجب أن تتكون على الأقل من 8 حروف.'),
            SizedBox(height: 7),
            AppTextFormField(
              name: 'confirmPassword',
              validator: InputValidation.matchValidation(
                  newPassword),
              labelText: 'تأكيد كلمة المرور',
              isPassword: true,
              maxLength: 12,
            ),
            SizedBox(height: 10.h),
            Spacer(),
            AppButton(
                title: "إعادة تعيين كلمة المرور",
                onTab: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final confirmPassword =
                        _formKey.currentState?.value['confirmPassword'];
                    if (confirmPassword != null) {
                      context.router.replaceAll([LoginRoute()]);
                    }
                  }
                }),
          ],
        ),
      ),
    );
  }
}

extension on FormBuilderState {
  ({String phone, String password})? get input {
    final newPassword = value['newPassword'] as String?;
    final confirmPassword = value['confirmPassword'] as String?;
    if (newPassword == null || confirmPassword == null) return null;
    return (phone: newPassword, password: confirmPassword);
  }
}
