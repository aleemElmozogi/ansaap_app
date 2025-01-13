part of '../auth_page.dart';

class _SignInButton extends StatelessWidget {
  const _SignInButton({
    super.key,
    required GlobalKey<FormBuilderState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormBuilderState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.signInStatus != current.signInStatus,
      builder: (context, state) {
        return state.signInStatus.isInProgress
            ? const Center(child: AppLoadingIndicator())
            : AppButton(
                title: "تسجيل الدخول",
                onTab: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final creeds = _formKey.currentState?.input;
                    if (creeds != null) {
                      context
                          .read<AuthCubit>()
                          .login(creeds.phone, creeds.password);
                    }
                  }
                });
      },
    );
  }
}
