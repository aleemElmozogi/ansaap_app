part of '../screens/auth_page.dart';

final List<BlocListener> listeners = [
  BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.signInStatus != current.signInStatus,
      listener: (BuildContext context, AuthState state) {
        {
          switch (state.signInStatus) {
            case CallStatus.pure:
              break;
            case CallStatus.failed:
              context.showErrorDialog(state.message);
              break;
            case CallStatus.success:
              //Route to the home page
            context.router.pushAll([const MainRoute()]);
              break;
            default:
              break;
          }
        }
      })
];

