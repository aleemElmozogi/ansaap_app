part of '../screens/family_tree_screen.dart';

extension SendSuggestionListener on FamilyTreeScreen {
  void _addNewMemberListener(BuildContext context, FamilyTreeState state) {
    switch (state.addFamilyMemberStatus) {
      case CallStatus.pure:
        break;
      case CallStatus.inProgress:
        context.showLoadingDialog();
        break;
      case CallStatus.failed:
        Navigator.pop(context);
        Navigator.pop(context);
        context.showErrorDialog(state.message);
        break;
      case CallStatus.success:
        Navigator.pop(context);
        Navigator.pop(context);
        context.showSuccessDialog(message: state.message);
        break;
      default:
        break;
    }
  }
}
