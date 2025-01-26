// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [FamilyTreeScreen]
class FamilyTreeRoute extends PageRouteInfo<FamilyTreeRouteArgs> {
  FamilyTreeRoute({
    Key? key,
    int? familyId,
    String? familyName,
    List<PageRouteInfo>? children,
  }) : super(
          FamilyTreeRoute.name,
          args: FamilyTreeRouteArgs(
            key: key,
            familyId: familyId,
            familyName: familyName,
          ),
          initialChildren: children,
        );

  static const String name = 'FamilyTreeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FamilyTreeRouteArgs>(
          orElse: () => const FamilyTreeRouteArgs());
      return FamilyTreeScreen(
        key: args.key,
        familyId: args.familyId,
        familyName: args.familyName,
      );
    },
  );
}

class FamilyTreeRouteArgs {
  const FamilyTreeRouteArgs({
    this.key,
    this.familyId,
    this.familyName,
  });

  final Key? key;

  final int? familyId;

  final String? familyName;

  @override
  String toString() {
    return 'FamilyTreeRouteArgs{key: $key, familyId: $familyId, familyName: $familyName}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<LoginRouteArgs>(orElse: () => const LoginRouteArgs());
      return LoginScreen(key: args.key);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainScreen();
    },
  );
}

/// generated route for
/// [OtpInputScreen]
class OtpInputRoute extends PageRouteInfo<OtpInputRouteArgs> {
  OtpInputRoute({
    Key? key,
    required String phoneNumber,
    required dynamic Function(String) onSuccess,
    List<PageRouteInfo>? children,
  }) : super(
          OtpInputRoute.name,
          args: OtpInputRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
            onSuccess: onSuccess,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpInputRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpInputRouteArgs>();
      return OtpInputScreen(
        key: args.key,
        phoneNumber: args.phoneNumber,
        onSuccess: args.onSuccess,
      );
    },
  );
}

class OtpInputRouteArgs {
  const OtpInputRouteArgs({
    this.key,
    required this.phoneNumber,
    required this.onSuccess,
  });

  final Key? key;

  final String phoneNumber;

  final dynamic Function(String) onSuccess;

  @override
  String toString() {
    return 'OtpInputRouteArgs{key: $key, phoneNumber: $phoneNumber, onSuccess: $onSuccess}';
  }
}

/// generated route for
/// [PhoneInputScreen]
class PhoneInputRoute extends PageRouteInfo<PhoneInputRouteArgs> {
  PhoneInputRoute({
    Key? key,
    required dynamic Function(String) onSuccess,
    List<PageRouteInfo>? children,
  }) : super(
          PhoneInputRoute.name,
          args: PhoneInputRouteArgs(
            key: key,
            onSuccess: onSuccess,
          ),
          initialChildren: children,
        );

  static const String name = 'PhoneInputRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PhoneInputRouteArgs>();
      return PhoneInputScreen(
        key: args.key,
        onSuccess: args.onSuccess,
      );
    },
  );
}

class PhoneInputRouteArgs {
  const PhoneInputRouteArgs({
    this.key,
    required this.onSuccess,
  });

  final Key? key;

  final dynamic Function(String) onSuccess;

  @override
  String toString() {
    return 'PhoneInputRouteArgs{key: $key, onSuccess: $onSuccess}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    Key? key,
    required String phoneNumber,
    List<PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterRouteArgs>();
      return RegisterScreen(
        key: args.key,
        phoneNumber: args.phoneNumber,
      );
    },
  );
}

class RegisterRouteArgs {
  const RegisterRouteArgs({
    this.key,
    required this.phoneNumber,
  });

  final Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [ResetPasswordScreen]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ResetPasswordScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}
