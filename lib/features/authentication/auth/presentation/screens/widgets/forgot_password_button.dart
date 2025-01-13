part of '../auth_page.dart';

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(PhoneInputRoute(
          onSuccess: (v) => context.router.push(ResetPasswordRoute()))),
      child: AppText(
        'نسيت كلمة السر؟',
        textColor: AppColors.primary,
        fontSize: 15.sp,
      ),
    );
  }
}
