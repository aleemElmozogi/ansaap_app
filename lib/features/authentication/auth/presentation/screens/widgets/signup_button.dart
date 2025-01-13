part of '../auth_page.dart';

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          'ليس لديك حساب؟  ',
          fontSize: 15.sp,
        ),
        InkWell(
          onTap: () => context.router.push(PhoneInputRoute(
              onSuccess: (v) =>
                  context.router.push(RegisterRoute(phoneNumber: v)))),
          child: AppText(
            'التسجيل',
            fontSize: 15.sp,
            textColor: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
