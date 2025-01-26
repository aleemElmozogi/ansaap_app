import 'package:ansaap_app/core/requests/add_family_member_request.dart';
import 'package:ansaap_app/data/repositories/inquiries_repository.dart';
import 'package:ansaap_app/features/authenticated/familyTree/data/family_tree_content_model.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/data/models/cities_content_model.dart';
import 'package:dartz/dartz.dart';
import 'package:ansaap_app/core/error/failures.dart';
import 'package:ansaap_app/core/network/network_info.dart';
import 'package:ansaap_app/core/requests/login_request.dart';
import 'package:ansaap_app/core/usecases/usecase.dart';
import 'package:ansaap_app/data/repositories/auth_repository.dart';
import 'package:ansaap_app/features/authentication/auth/data/models/user_content_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddFamilyMemberUsecase extends UseCase<String, AddFamilyMemberRequest> {
  final InquiriesRepository inquiriesRepository;

  AddFamilyMemberUsecase(
      {required this.inquiriesRepository, required NetworkInfo networkInfo})
      : super(networkInfo: networkInfo);

  @override
  Future<Either<Failure, String>> call(
          AddFamilyMemberRequest request) async =>
      await inquiriesRepository.addFamilyMember(request);
}
