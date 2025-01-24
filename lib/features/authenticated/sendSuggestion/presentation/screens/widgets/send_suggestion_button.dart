part of '../send_suggestion_screen.dart';

class _SendSuggestionButton extends StatelessWidget {
  const _SendSuggestionButton({
    super.key,
    required GlobalKey<FormBuilderState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormBuilderState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendSuggestionCubit, SendSuggestionState>(
      buildWhen: (previous, current) =>
          previous.sendSuggestionsStatus != current.sendSuggestionsStatus,
      builder: (context, state) {
        return state.sendSuggestionsStatus.isInProgress
            ? const Center(child: AppLoadingIndicator())
            : AppButton(
                title: "إرسال",
                onTab: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final creeds = _formKey.currentState?.input;
                    if (creeds != null) {
                      context
                          .read<SendSuggestionCubit>()
                          .sendSuggestion(creeds.suggestion);
                    }
                  }
                });
      },
    );
  }
}
