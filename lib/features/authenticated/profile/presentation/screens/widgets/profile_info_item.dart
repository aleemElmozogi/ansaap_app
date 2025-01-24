part of '../profile_screen.dart';
class _ProfileInfoItem extends StatelessWidget {
  const _ProfileInfoItem({
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
