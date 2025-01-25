import 'package:ansaap_app/core/enums/fetch_status.dart';
import 'package:ansaap_app/core/usecases/usecase.dart';
import 'package:ansaap_app/features/authenticated/familyTree/domain/usecases/fetch_family_tree_usecase.dart';
import 'package:ansaap_app/features/authenticated/familyTree/presentation/cubit/family_tree_state.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/domain/usecases/fetch_cities_usecase.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/domain/usecases/fetch_families_usecase.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/presentation/cubit/view_families_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class FamilyTreeCubit extends Cubit<FamilyTreeState> {
  final FetchFamilyTreeUsecase _fetchFamilyTreeUsecase;

  FamilyTreeCubit(this._fetchFamilyTreeUsecase)
      : super(FamilyTreeState()){
    fetchFamilyTree();
  }

  Future<void> fetchFamilyTree({int? familyId}) async {
    emit(state.copyWith(fetchFamilyTreeStatus: CallStatus.inProgress));
    final response = await _fetchFamilyTreeUsecase(familyId);
    response.fold(
        (failure) => emit(state.copyWith(
            fetchFamilyTreeStatus: CallStatus.failed,
            message: failure.message.toString())),
        (familyTree) => emit(state.copyWith(
            familyTreeContentModel: familyTree, fetchFamilyTreeStatus: CallStatus.success)));
  }
}
