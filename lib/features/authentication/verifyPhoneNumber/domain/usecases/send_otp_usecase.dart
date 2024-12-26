import 'package:ansaap_app/data/repositories/otp_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:ansaap_app/core/error/failures.dart';
import 'package:ansaap_app/core/network/network_info.dart';
import 'package:ansaap_app/core/requests/send_otp_request.dart';

import 'package:ansaap_app/core/usecases/usecase.dart';
import 'package:ansaap_app/data/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SendOtpUsecase extends UseCase<String, SendOtpRequest> {
  final OtpRepository otpRepository;

  SendOtpUsecase(
      {required this.otpRepository,
        required NetworkInfo networkInfo})
      : super(networkInfo: networkInfo);

  @override
  Future<Either<Failure, String>> call(SendOtpRequest params) async =>
      await otpRepository.sendOtp(params);
}
