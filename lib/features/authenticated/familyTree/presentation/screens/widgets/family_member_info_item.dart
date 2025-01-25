part of '../family_tree_screen.dart';

class _FamilyMemberInfoItem extends StatelessWidget {
  const _FamilyMemberInfoItem({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(title),
        AppText(value),
      ],
    );
  }
}
