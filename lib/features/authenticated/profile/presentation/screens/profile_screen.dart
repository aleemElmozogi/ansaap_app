import 'package:ansaap_app/config/routes/app_router.dart';
import 'package:ansaap_app/core/utils/app_colors.dart';
import 'package:ansaap_app/core/widgets/app_custom_button.dart';
import 'package:ansaap_app/core/widgets/app_text.dart';
import 'package:ansaap_app/features/authentication/auth/presentation/cubit/auth_cubit.dart';
import 'package:ansaap_app/features/authentication/auth/presentation/cubit/auth_state.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part 'widgets/profile_info_item.dart';
@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) => previous.authState != current.authState,
      builder: (context, state) {
        if (state.authState.isUnAuthenticated) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              AppText('يرجي تسجيل الدخول لعرض الملف الشخصي'),
              AppCustomButton(
                onPressed: () => context.router.replaceAll([LoginRoute()]),
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: AppText(
                  'تسجيل الدخول',
                  textColor: AppColors.primary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20.h,
          children: [
            _ProfileInfoItem(
              title: 'إسم المستخدم',
              value: state.userEntity?.userName ?? '',
            ),
            _ProfileInfoItem(
              title: 'الإسم الكامل',
              value: state.userEntity?.fullName ?? '',
            ),
            _ProfileInfoItem(
              title: 'البريد الإلكتروني',
              value: state.userEntity?.userEmail ?? '',
            ),
            AppCustomButton(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                borderColor: AppColors.primary,
                onPressed: () => context.router.push(PhoneInputRoute(
                    onSuccess: (v) =>
                        context.router.push(ResetPasswordRoute()))),
                child: const AppText('تغيير كلمة المرور')),
          ],
        );
      },
    );
  }
}
