part of '../family_view_screen.dart';

class FamilyListItem extends StatelessWidget {
  const FamilyListItem({super.key, required this.family});
  final FamiliesContentModel family;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 3,
      children: [
        ListTile(
          title: AppText(family.familyName, textAlign: TextAlign.start),
          subtitle: AppText(
            family.cityContentModel?.cityName ?? '',
            fontSize: 12,
            textAlign: TextAlign.start,
          ),
        ),
        Divider(
          thickness: .2,
        ),
      ],
    );
  }
}
