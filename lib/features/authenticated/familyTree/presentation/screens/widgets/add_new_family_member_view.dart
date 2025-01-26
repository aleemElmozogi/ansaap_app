part of '../family_tree_screen.dart';

class _AddNewFamilyMemberView extends StatelessWidget {
   _AddNewFamilyMemberView({
    super.key,
    required this.member,
    required this.bloc,
  });

  final FamilyMemberContentModel member;
  final FamilyTreeCubit bloc;
   final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50.h),
      child: Column(
        spacing: 10,
        children: [
          Row(
            spacing: 10,
            children: [
              Align(alignment: Alignment.centerRight, child: BackButton()),
              AppText(
                'إضافة فرد جديد',
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ],
          ),
          FormBuilder(
              key: _formKey,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                child: Column(spacing: 10, children: [
                  AppTextFormField(
                    name: 'parentName',
                    hintText: member.name,
                    labelText: 'اسم الاب',
                    enabled: false,
                  ),
                  AppTextFormField(
                    name: 'name',
                    labelText: 'الاسم',
                    validator: InputValidation.requiredValidation(),
                  ),
                  AppDateFormField(
                    name: 'dateOfBirth',
                    labelText: 'تاريخ الميلاد',
                  ),
                  AppDateFormField(
                    name: 'dateOfDeath',
                    labelText: 'تاريخ الوفاة',
                  ),
                  SizedBox(height: 5.h),
                  AppButton(
                      title: 'حفظ',
                      onTab: () {
                        if (_formKey.currentState!.saveAndValidate()) {
                          final creeds = _formKey.currentState?.input;
                          if (creeds != null) {
                            bloc.addFamilyMember(
                              name: creeds.name,
                              parentName: member.name ?? '',
                              dateOfBirth: creeds.dateOfBirth ,
                              dateOfDeath: creeds.dateOfDeath,
                              familyId: member.familyId,
                              parentId: member.id ?? 0,
                            );
                          }
                        }
                      }),
                ]),
              )),
        ],
      ),
    );
  }
}

extension on FormBuilderState {
  ({
    String name,
    String? parentName,
  DateTime? dateOfBirth,
  DateTime? dateOfDeath
  })? get input {
    final name = value['name'] as String?;
    final parentName = value['parentName'] as String?;
    final dateOfDeath = value['dateOfDeath'] as DateTime?;
    final dateOfBirth = value['dateOfBirth'] as DateTime?;
    if (name == null) return null;
    return (
      name: name,
      parentName: parentName,
      dateOfBirth: dateOfBirth,
      dateOfDeath: dateOfDeath
    );
  }
}
