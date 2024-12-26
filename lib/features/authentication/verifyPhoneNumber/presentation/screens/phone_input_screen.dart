import 'package:auto_route/auto_route.dart';
import 'package:ansaap_app/config/routes/app_router.dart';
import 'package:ansaap_app/core/utils/assets_manager.dart';
import 'package:ansaap_app/core/validation/input_validation.dart';
import 'package:ansaap_app/core/widgets/app_button.dart';
import 'package:ansaap_app/core/widgets/app_scaffold.dart';
import 'package:ansaap_app/core/widgets/app_text.dart';
import 'package:ansaap_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class PhoneInputScreen extends StatelessWidget {
  PhoneInputScreen({super.key, required this.onSuccess});
  final _formKey = GlobalKey<FormBuilderState>();
  final Function(String) onSuccess;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'التحقق من رقم الهاتف',
      body: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(ImgAssets.mobileVector,height: 130.h,),
              SizedBox(height: 25.h),
              AppText(
                'قم بإدخال رقم الهاتف لإرسال رمز التحقق إليه',
                fontWeight: FontWeight.w600,
                fontSize: 19.sp,
                maxLines: 2,
              ),
              SizedBox(height: 20.h),
              AppTextFormField(
                name: 'phone',
                maxLength: 9,
                validator: InputValidation.phoneNumberValidation(),
                hintText: 'رقم الهاتف',
                prefixIcon: Icons.phone,
              ),
              SizedBox(height: 25.h),
              AppButton(
                  title: "التالي",
                  onTab: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                      final phoneNumber = _formKey.currentState?.value['phone'];
                      if (phoneNumber != null) {
                        context.router.push(OtpInputRoute(
                            phoneNumber: phoneNumber.toString(),
                            onSuccess: (v) => onSuccess(phoneNumber)));
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
