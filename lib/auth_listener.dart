part of 'app.dart';

extension AuthListener on AsaapApp {
  Future<void> _authStatus(BuildContext context, AuthState state) async {
    switch (state.authState) {
      case AuthStatus.authenticated:
        _appRouter.replaceAll([MainRoute()]);
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          _appRouter.navigatorKey.currentContext
              ?.showSuccessDialog(message: 'تم تسحيل الدخول بنجاح');
        });
        break;
      case AuthStatus.unAuthenticated:
        _appRouter.replaceAll([LoginRoute()]);
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          _appRouter.navigatorKey.currentContext
              ?.showSuccessDialog(message: 'تم تسحيل الخروج بنجاح');
        });
        break;
    }
  }
}
