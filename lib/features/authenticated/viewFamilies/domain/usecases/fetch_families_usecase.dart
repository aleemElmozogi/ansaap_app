import 'package:ansaap_app/data/repositories/inquiries_repository.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/data/models/families_content_model.dart';
import 'package:dartz/dartz.dart';
import 'package:ansaap_app/core/error/failures.dart';
import 'package:ansaap_app/core/network/network_info.dart';
import 'package:ansaap_app/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchFamiliesUsecase extends UseCase<List<FamiliesContentModel>, NoParams> {
  final InquiriesRepository inquiriesRepository;

  FetchFamiliesUsecase(
      {required this.inquiriesRepository, required NetworkInfo networkInfo})
      : super(networkInfo: networkInfo);

  @override
  Future<Either<Failure, List<FamiliesContentModel>>> call(
          NoParams params) async =>
      await inquiriesRepository.fetchFamilies();
}
