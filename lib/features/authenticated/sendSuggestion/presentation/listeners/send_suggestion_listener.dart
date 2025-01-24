part of '../screens/send_suggestion_screen.dart';

extension SendSuggestionListener on SendSuggestionScreen {
  void suggestionListener(BuildContext context, SendSuggestionState state){
    switch (state.sendSuggestionsStatus) {
      case CallStatus.pure:
        break;
      case CallStatus.failed:
        context.showErrorDialog(state.message);
        break;
      case CallStatus.success:
        Navigator.pop(context);
        context.showSuccessDialog(message: state.message);
        break;
      default:
        break;
    }
  }
}

