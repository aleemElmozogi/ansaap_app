part of '../family_tree_screen.dart';

class FamilyTreeGraphView extends StatelessWidget {
  final FamilyTreeContentModel familyTree;

  const FamilyTreeGraphView({super.key, required this.familyTree});

  @override
  Widget build(BuildContext context) {
    final Graph graph = Graph();
    final SugiyamaConfiguration configuration = SugiyamaConfiguration();

    final Map<int, Node> nodes = {};

    // Build nodes and edges dynamically
    for (var member in familyTree.familyMembers) {
      final currentNode = nodes.putIfAbsent(
        member.id,
        () => Node.Id(member.id ?? 'Unknown'),
      );

      if (member.parentId != null) {
        final parentNode = nodes.putIfAbsent(
          member.parentId ?? 0,
          () => Node.Id(member.parentName ?? 'Unknown'),
        );

        graph.addEdge(parentNode, currentNode);
      }
    }

    if (nodes.isEmpty) {
      return Center(
        child: AppText('لا يوجد بيانات لعرضها.'),
      );
    }

    configuration
      ..nodeSeparation = (50)
      ..levelSeparation = (100)
      ..orientation = SugiyamaConfiguration.ORIENTATION_TOP_BOTTOM;

    final SugiyamaAlgorithm algorithm = SugiyamaAlgorithm(configuration);

    return InteractiveViewer(
      constrained: false,
      boundaryMargin: const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
      minScale: 0.5,
      maxScale: 2.0,
      child: GraphView(
          graph: graph,
          algorithm: algorithm,
          builder: (Node node) {
            String memberId = node.key?.value.toString() ?? '0';
            final FamilyMemberContentModel member = familyTree.familyMembers
                .firstWhere((element) => element.id == int.parse(memberId));
            String memberName = familyTree.familyMembers
                .firstWhere((element) => element.id == int.parse(memberId))
                .name;

            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppCustomButton(
                      onPressed: () {
                        context.showAppBottomSheet(
                            child: SizedBox(
                          height: .5.sh,
                          child: _FamilyMemberInfoView(member: member),
                        ));
                      },
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 25.h, horizontal: 7.w),
                      borderColor: AppColors.primary,
                      child: AppText(memberName),
                    ),
                    const SizedBox(height: 10),
                    // Space between node and button
                    AppCustomButton(
                        borderColor: AppColors.primary,
                        backgroundColor: AppColors.lightGrey,
                        borderRadius: 50,
                        child:
                            Icon(Icons.add, size: 20, color: AppColors.primary),
                        onPressed: () {
                          print('Node clicked: $memberId');
                          context.showAppBottomSheet(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 50.h),
                              child: Column(
                                spacing: 10,
                                children: [
                                  Row(
                                    spacing: 10,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: BackButton()),
                                      AppText(
                                        'إضافة فرد جديد',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp,
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                      child: Form(
                                          child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 40.h),
                                    child: Column(spacing: 10, children: [
                                      AppTextFormField(
                                        name: 'parentName',
                                        hintText: member.parentName,
                                        labelText: 'اسم الاب',
                                        enabled: false,
                                      ),
                                      AppTextFormField(
                                        name: 'name',
                                        labelText: 'الاسم',
                                        validator: InputValidation
                                            .requiredValidation(),
                                      ),
                                      AppDateFormField(
                                        name: 'dateOfBirth',
                                        labelText: 'تاريخ الميلاد',
                                        validator: InputValidation
                                            .requiredValidation(),
                                      ),
                                      AppDateFormField(
                                        name: 'dateOfDeath',
                                        labelText: 'تاريخ الوفاة',
                                        validator: InputValidation
                                            .requiredValidation(),
                                      ),
                                      SizedBox(height: 5.h),
                                      AppButton(title: 'حفظ', onTab: () {}),
                                    ]),
                                  ))),
                                ],
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ],
            );
          }),
    );
  }
}
