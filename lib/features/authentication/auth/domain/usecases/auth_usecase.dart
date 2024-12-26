import 'package:dartz/dartz.dart';
import 'package:ansaap_app/core/error/failures.dart';
import 'package:ansaap_app/core/network/network_info.dart';
import 'package:ansaap_app/core/requests/login_request.dart';
import 'package:ansaap_app/core/usecases/usecase.dart';
import 'package:ansaap_app/data/repositories/auth_repository.dart';
import 'package:ansaap_app/features/authentication/auth/data/models/user_content_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthUsecase extends UseCase<UserContentModel, LoginRequest> {
  final AuthRepository authRepository;

  AuthUsecase({required this.authRepository, required NetworkInfo networkInfo})
      : super(networkInfo: networkInfo);

  @override
  Future<Either<Failure, UserContentModel>> call(LoginRequest params) async =>
      await authRepository.signIn(params);
}
