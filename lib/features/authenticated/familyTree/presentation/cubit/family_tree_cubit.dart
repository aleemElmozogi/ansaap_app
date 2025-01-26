import 'package:ansaap_app/core/enums/familiy_visability_state.dart';
import 'package:ansaap_app/core/enums/fetch_status.dart';
import 'package:ansaap_app/core/requests/add_family_member_request.dart';
import 'package:ansaap_app/features/authenticated/familyTree/data/family_member_content_model.dart';
import 'package:ansaap_app/features/authenticated/familyTree/data/family_tree_content_model.dart';
import 'package:ansaap_app/features/authenticated/familyTree/domain/usecases/add_family_member_usecase.dart';
import 'package:ansaap_app/features/authenticated/familyTree/domain/usecases/fetch_family_tree_usecase.dart';
import 'package:ansaap_app/features/authenticated/familyTree/presentation/cubit/family_tree_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class FamilyTreeCubit extends Cubit<FamilyTreeState> {
  final FetchFamilyTreeUsecase _fetchFamilyTreeUsecase;
  final AddFamilyMemberUsecase _addFamilyMemberUsecase;

  FamilyTreeCubit(this._fetchFamilyTreeUsecase, this._addFamilyMemberUsecase)
      : super(FamilyTreeState());

  Future<void> fetchFamilyTree({int? familyId}) async {
    emit(state.copyWith(fetchFamilyTreeStatus: CallStatus.inProgress));
    final response = await _fetchFamilyTreeUsecase(familyId);
    response.fold(
        (failure) => emit(state.copyWith(
            fetchFamilyTreeStatus: CallStatus.failed,
            message: failure.message.toString())),
        (familyTree) => emit(state.copyWith(
            familyTreeContentModel: familyTree,
            fetchFamilyTreeStatus: CallStatus.success)));
  }

  Future<void> addFamilyMember({
    required int familyId,
    required int parentId,
    required String parentName,
    required String name,
    DateTime? dateOfBirth,
    DateTime? dateOfDeath,
  }) async {
    // Emit in-progress state
    emit(state.copyWith(addFamilyMemberStatus: CallStatus.inProgress));

    // Call usecase to add family member
    final response = await _addFamilyMemberUsecase(AddFamilyMemberRequest(
      familyId: familyId,
      dateOfBirth: dateOfBirth,
      dateOfDeath: dateOfDeath,
      parentId: parentId,
      name: name,
    ));

    // Handle response
    response.fold(
      (failure) {
        emit(state.copyWith(
          addFamilyMemberStatus: CallStatus.failed,
          message: failure.message ?? '',
        ));
      },
      (message) {
        emit(state.copyWith(fetchFamilyTreeStatus: CallStatus.inProgress));

        // On success, update family tree and statuses
        final updatedFamilyTree = _addFamilyMemberToTree(
          state.familyTreeContentModel,
          familyId,
          parentId,
          parentName,
          name,
          dateOfBirth,
          dateOfDeath,
        );

        emit(state.copyWith(
          familyTreeContentModel: updatedFamilyTree,
          message: message,
          addFamilyMemberStatus: CallStatus.success,
          fetchFamilyTreeStatus: CallStatus.success,
        ));
      },
    );
  }

// Helper method to add a new family member to the family tree
  FamilyTreeContentModel _addFamilyMemberToTree(
    FamilyTreeContentModel? familyTreeContentModel,
    int familyId,
    int parentId,
    String parentName,
    String name,
    DateTime? dateOfBirth,
    DateTime? dateOfDeath,
  ) {
    // Ensure the family tree model is not null
    final familyTree = familyTreeContentModel ??
        FamilyTreeContentModel(
          familyId: familyId,
          familyName: '',
          cityId: 0,
          cityName: '',
          familyVisibility: FamilyVisibilityState.visible,
          familyMembers: [],
          cityContentModel: null,
        );

    // Create a new family member and add it to the family tree
    familyTree.familyMembers.add(FamilyMemberContentModel(
      id: familyTree.familyMembers.last.id + 1,
      parentId: parentId,
      name: name,
      dateOfBirth: dateOfBirth?.toString() ?? '',
      dateOfDeath: dateOfDeath?.toString() ?? '',
      familyId: familyId,
      parentName: parentName,
    ));
    return familyTree;
  }
}
