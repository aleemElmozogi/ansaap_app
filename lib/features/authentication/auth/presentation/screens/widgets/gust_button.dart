part of '../auth_page.dart';

class _GustButton extends StatelessWidget {
  const _GustButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCustomButton(
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
        onPressed: () => context.router.replaceAll([const MainRoute()]));
  }
}
