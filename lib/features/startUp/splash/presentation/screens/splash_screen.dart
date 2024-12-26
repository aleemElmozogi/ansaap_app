import 'dart:async';
import 'package:ansaap_app/core/widgets/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ansaap_app/config/routes/app_router.dart';
import 'package:ansaap_app/core/utils/app_colors.dart';
import 'package:ansaap_app/core/utils/assets_manager.dart';
import 'package:ansaap_app/core/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ansaap_app/core/widgets/loading_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() => context.router.replaceAll([LoginRoute()]);

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColorGradient: const [
        AppColors.primary,
        AppColors.lightPrimary
      ],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 35.h),
            const Spacer(),
            Hero(
                tag: 'appName',
                child: AppText('أَنْسَابْ', textColor: AppColors.white,
                 fontSize: 50.sp,fontWeight: FontWeight.bold,)),
            const Spacer(),
            const AppLoadingIndicator(fillColor: AppColors.white),
            SizedBox(height: 35.h),
          ],
        ),
      ),
    );
  }
}
