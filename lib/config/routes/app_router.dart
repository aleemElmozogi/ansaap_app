import 'package:ansaap_app/features/authenticated/home/presentation/screens/home_screen.dart';
import 'package:ansaap_app/features/authenticated/profile/presentation/screens/profile_screen.dart';
import 'package:ansaap_app/features/authentication/resetPassword/presentation/screens/reset_password_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ansaap_app/features/authenticated/main_screen.dart';
import 'package:ansaap_app/features/authentication/register/presentation/screens/register_screen.dart';
import 'package:ansaap_app/features/authentication/verifyPhoneNumber/presentation/screens/otp_input_screen.dart';
import 'package:ansaap_app/features/authentication/verifyPhoneNumber/presentation/screens/phone_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ansaap_app/features/authentication/auth/presentation/screens/auth_page.dart';
import 'package:ansaap_app/features/startUp/splash/presentation/screens/splash_screen.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter(

// required AuthGuard authGuard,
// required SoftGuard softGuard,
// required OtpGuard otpGuard,
// // required ChangePasswordGuard changePasswordGuard
      )
      :
// _authGuard = authGuard,
//         _softGuard = softGuard,
//         _otpGuard = otpGuard,
//         // _changePasswordGuard = changePasswordGuard,
        super();
  // final AuthGuard _authGuard;
  // final SoftGuard _softGuard;
  // final OtpGuard _otpGuard;
  // // final ChangePasswordGuard _changePasswordGuard;
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
// is first open
  bool isFirstOpen = true;
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, initial: true),
    // AutoRoute(page: OnBoardingRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: PhoneInputRoute.page),
    AutoRoute(page: OtpInputRoute.page),
    AutoRoute(page: ResetPasswordRoute.page),

    AutoRoute(page: MainRoute.page, children: [
      AutoRoute(page: HomeRoute.page),
      AutoRoute(page: ProfileRoute.page),
    ]),

    // // private routes
    // AutoRoute(page: MainRoute.page, initial: true, guards: [
    //   _softGuard
    // ], children: [
    //   AutoRoute(page: HomeRoute.page),
    //   AutoRoute(page: SearchRoute.page),
    //   AutoRoute(page: NotificationsRoute.page),
    //   AutoRoute(page: ProfileRoute.page),
    // ]),
  ];

  @override
  List<AutoRouteGuard> get guards => [
        // _authGuard,
        // _changePasswordGuard,
      ];
}
