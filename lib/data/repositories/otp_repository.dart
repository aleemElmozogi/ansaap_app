import 'package:ansaap_app/core/error/exceptions.dart';
import 'package:ansaap_app/core/error/failures.dart';
import 'package:ansaap_app/core/requests/send_otp_request.dart';
import 'package:ansaap_app/core/requests/verify_otp_request.dart';
import 'package:ansaap_app/data/repositories/base_repository.dart';
import 'package:ansaap_app/generated/l10n.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class OtpRepository {
  Future<Either<Failure, String>> sendOtp(SendOtpRequest request);
  Future<Either<Failure, String>> verifyOtp(VerifyOtpRequest request);
}

@Singleton(as: OtpRepository)
class OtpRepositoryImpl extends BaseRepository implements OtpRepository {
  OtpRepositoryImpl(
      {required super.localStorage,
      required super.apiConsumer,
      required super.networkInfo});

  @override
  Future<Either<Failure, String>> sendOtp(SendOtpRequest request) async {
    try {
      final auth = FirebaseAuth.instance;

      if (await networkInfo.isConnected) {
        await auth
            .verifyPhoneNumber(
                phoneNumber: request.phoneNumber,
                verificationCompleted: (credentials) async {
                  await auth.signInWithCredential(credentials);
                },
                verificationFailed: (e) {
                  if (e.code == 'invalid-phone-number') {
                    request.onCodeSentFailed(
                        "عذرًا، رقم الهاتف غير صالح. يرجى التأكد من إدخال رقم هاتف صحيح");
                  } else {
                    request.onCodeSentFailed(S.current.invalidRequest);
                  }
                },
                codeSent: (verificationId, resendToken) {
                  request.onCodeSent(verificationId);
                },
                codeAutoRetrievalTimeout: (verificationId) {
                  request.onCodeSent(verificationId);
                })
            .timeout(const Duration(seconds: 40));
        return const Right('Updated');
      } else {
        return Left(NetworkFailure(S.current.noInternetConnection));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> verifyOtp(VerifyOtpRequest request) async {
    try {
      final auth = FirebaseAuth.instance;

      if (await networkInfo.isConnected) {
        try {
          final credential = await auth
              .signInWithCredential(PhoneAuthProvider.credential(
                  verificationId: request.verificationId, smsCode: request.otp))
              .timeout(const Duration(seconds: 40));
          if (credential.user == null) {
            return Left(FetchErrorFailure(S.current.noDataOrContentAvailable));
          }
        } on FirebaseException catch (e) {
          return Left(ServerFailure(e.message));
        } on ServerException catch (e) {
          return Left(ServerFailure(e.message));
        } on Exception catch (e) {
          return const Left(ServerFailure(
              "عذرًا، رمز التحقق المدخل غير صالح. يرجى التأكد من إدخال رمز التحقق صحيح"));
        }

        return const Right('secsuss');
      } else {
        return Left(NetworkFailure(S.current.noInternetConnection));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
