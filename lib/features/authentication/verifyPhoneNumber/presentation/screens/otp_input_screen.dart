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
class OtpInputScreen extends StatelessWidget {
  OtpInputScreen(
      {super.key, required this.phoneNumber, required this.onSuccess});
  final _formKey = GlobalKey<FormBuilderState>();
  final String phoneNumber;
  final Function(String) onSuccess;
  String maskNumber(String number) {
    String firstThree = number.substring(0, 3); // Get the first 3 digits
    String lastTwo =
        number.substring(number.length - 2); // Get the last 2 digits

    return '0${firstThree}XXXXX$lastTwo';
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'رمز التحقق',
      body: FormBuilder(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImgAssets.mobileVector, height: 130.h),
            SizedBox(height: 25.h),
            AppText(
              'الرجاء ادخال رمز التحقق المرسل إلي ${maskNumber(phoneNumber)}',
              fontWeight: FontWeight.w600,
              fontSize: 19.sp,
              maxLines: 2,
            ),
            SizedBox(height: 20.h),
            AppOtpFormField(
              name: 'otp',
              validator: InputValidation.otpValidation(),
              length: 6,
            ),
            SizedBox(height: 10.h),
            AppText(
              '02:12',
              fontWeight: FontWeight.w400,
              textColor: AppColors.primary,
              fontSize: 17.sp,
            ),
            SizedBox(height: 25.h),
            AppButton(
                title: "التحقق",
                onTab: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final otp = _formKey.currentState?.value['otp'];
                    if (otp != null) {
                      onSuccess(phoneNumber);
                    }
                  }
                }),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  'لم يصلك الرمز؟ ',
                  fontWeight: FontWeight.w500,
                  fontSize: 17.sp,
                ),
                AppText(
                  ' اعادة الارسال',
                  fontWeight: FontWeight.w600,
                  textColor: AppColors.primary,
                  fontSize: 17.sp,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
