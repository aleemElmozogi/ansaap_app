part of '../family_tree_screen.dart';

class _FamilyMemberInfoView extends StatelessWidget {
  const _FamilyMemberInfoView({
    super.key,
    required this.member,
  });

  final FamilyMemberContentModel member;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 25.0, vertical: 30.h),
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppText('المعلومات الشخصية',
              textColor: AppColors.primary,
              fontWeight: FontWeight.bold),
          SizedBox(height: 50.h),
          _FamilyMemberInfoItem(
            title: 'الاسم',
            value: member.name,
          ),
          _FamilyMemberInfoItem(
            title: 'تاريخ الميلاد',
            value: member.dateOfBirth,
          ),
          if (member.parentName != null &&
              member.parentName!.isNotEmpty)
            _FamilyMemberInfoItem(
              title: 'اسم الأب',
              value: member.parentName ?? '',
            ),
          if (member.dateOfDeath != null &&
              member.dateOfDeath!.isNotEmpty)
            _FamilyMemberInfoItem(
              title: 'تاريخ الوفاة',
              value: member.dateOfDeath ?? '',
            ),
          SizedBox(height: 20.h),
          AppButton(
            title: 'العودة',
            onTab: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}
