import 'package:dartz/dartz.dart';
import 'package:ansaap_app/core/api/api_consumer.dart';
import 'package:ansaap_app/core/api/end_points.dart';
import 'package:ansaap_app/core/error/exceptions.dart';
import 'package:ansaap_app/core/error/failures.dart';
import 'package:ansaap_app/core/localStorage/loacal_storage.dart';
import 'package:ansaap_app/core/models/message_model.dart';
import 'package:ansaap_app/core/network/network_info.dart';
import 'package:ansaap_app/core/requests/login_request.dart';
import 'package:ansaap_app/core/requests/send_otp_request.dart';
import 'package:ansaap_app/core/requests/signup_request.dart';
import 'package:ansaap_app/core/requests/verify_otp_request.dart';
import 'package:ansaap_app/core/utils/network_method.dart';
import 'package:ansaap_app/data/repositories/base_repository.dart';
import 'package:ansaap_app/features/authentication/auth/data/models/credentials_model.dart';
import 'package:ansaap_app/features/authentication/auth/data/models/user_content_model.dart';
import 'package:ansaap_app/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserContentModel>> signIn(LoginRequest request);
  Future<Either<Failure, String>> signUp(SignupRequest request);

}

@Singleton(as: AuthRepository)
class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  AuthRepositoryImpl({
    required LocalStorage localStorage,
    required ApiConsumer apiConsumer,
    required NetworkInfo networkInfo,
  }) : super(
          localStorage: localStorage,
          apiConsumer: apiConsumer,
          networkInfo: networkInfo,
        );

  @override
  Future<Either<Failure, UserContentModel>> signIn(LoginRequest request) async {
    return executeRequest<CredentialsModel, UserContentModel>(
      requestFunction: () async => apiConsumer.request<CredentialsModel>(
          CredentialsModel.new,
          path: EndPoints.signIn,
          method: NetworkMethod.get,
          queryParameters: request.toJson(),
          authorization: await localStorage.publicToken,
          mockResponse: {
            "statusCode": 200,
            "data": {
              "accessToken": "accessToken",
              "refreshToken": "refreshToken",
              "userContent": {
                'fullName': 'منظمة H2O',
                'email': 'email',
                'imageUrl': 'imageUrl',
                'phoneNumber': 'phoneNumber',
                'walletTotal': 24899,
              }
            }
          }),
      onSuccess: (credentials) async {
        final accessToken = credentials.data?.accessToken ?? '';
        final refreshToken = credentials.data?.refreshToken ?? '';

        await localStorage.appStarted();
        await localStorage.refreshAccessToken(accessToken);
        await localStorage.refreshRefreshTokenToken(refreshToken);

        return credentials.data!.user;
      },
    );
  }

  @override
  Future<Either<Failure, String>> signUp(SignupRequest request) async {
    return executeRequest<MessageModel, String>(
      requestFunction: () async => apiConsumer.request<MessageModel>(
          MessageModel.new,
          path: EndPoints.signIn,
          method: NetworkMethod.get,
          queryParameters: request.toJson(),
          authorization: await localStorage.publicToken,
          mockResponse: {"statusCode": 200, "data": 'secsuss'}),
      onSuccess: (credentials) async {
        return credentials.data ?? '';
      },
    );
  }

}
