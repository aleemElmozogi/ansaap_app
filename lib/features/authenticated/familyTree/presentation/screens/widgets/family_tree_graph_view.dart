part of '../family_tree_screen.dart';

class FamilyTreeGraphView extends StatelessWidget {
  final FamilyTreeContentModel familyTree;
  final String? familyName;
  const FamilyTreeGraphView(
      {super.key, required this.familyTree, this.familyName});

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
      child: Column(
        children: [
          AppCustomButton(
            onPressed: () => null,
            borderColor: AppColors.primary,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: AppText(
              familyName != null
                  ? 'عائلة $familyName'
                  : 'عائلة ${familyTree.familyName}'

              ,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 10.h),
          GraphView(
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
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 25.h, horizontal: 7.w),
                          borderColor: AppColors.primary,
                          child: AppText(memberName),
                        ),
                        const SizedBox(height: 10),
                        // Space between node and button
                        AppCustomButton(
                            borderColor: AppColors.primary,
                            backgroundColor: AppColors.lightGrey,
                            borderRadius: 50,
                            child: Icon(Icons.add,
                                size: 20, color: AppColors.primary),
                            onPressed: () {
                              final bloc = context.read<FamilyTreeCubit>();
                              context.showAppBottomSheet(
                                child: _AddNewFamilyMemberView(
                                    member: member, bloc: bloc),
                              );
                            })
                      ],
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
