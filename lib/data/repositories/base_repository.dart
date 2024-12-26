import 'package:dartz/dartz.dart';
import 'package:ansaap_app/core/api/api_consumer.dart';
import 'package:ansaap_app/core/error/exceptions.dart';
import 'package:ansaap_app/core/error/failures.dart';
import 'package:ansaap_app/core/localStorage/loacal_storage.dart';
import 'package:ansaap_app/core/network/network_info.dart';
import 'package:ansaap_app/generated/l10n.dart';

abstract class BaseRepository {
  final LocalStorage localStorage;
  final ApiConsumer apiConsumer;
  final NetworkInfo networkInfo;

  BaseRepository({
    required this.localStorage,
    required this.apiConsumer,
    required this.networkInfo,
  });

  /// Handles network checks, API requests, and exceptions.
  Future<Either<Failure, ResultType>> executeRequest<T, ResultType>({
    required Future<T> Function() requestFunction,
    required Future<ResultType> Function(T response) onSuccess,
  }) async {
    // Check network connection before executing the request
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure(S.current.noInternetConnection));
    }

    try {
      // Execute the API request
      final T response = await requestFunction();

      // Handle successful response
      final ResultType result = await onSuccess(response);
      return Right(result);
    } on ApiException catch (e) {
      // Handle API-specific errors
      return Left(ApiFailure.withMessage(e.message ?? S.current.errorDuringCommunication));
    } on FetchDataException catch (e) {
      // Handle fetch data errors
      return Left(FetchErrorFailure.withMessage(e.message ?? S.current.errorDuringCommunication));
    } on EmptyResponseException catch (e) {
      // Handle cases of empty response
      return Left(FetchErrorFailure.withMessage(e.message ?? S.current.noDataOrContentAvailable));
    } on BadRequestException catch (e) {
      // Handle bad request errors
      return Left(ServerFailure.withMessage(e.message ?? S.current.invalidRequest));
    } on BadResponseException catch (e) {
      // Handle invalid response errors
      return Left(ServerFailure.withMessage(e.message ?? S.current.invalidResponse));
    } on UnauthorizedException catch (e) {
      // Handle unauthorized errors
      return Left(AuthFailure.withMessage(e.message ?? S.current.unauthorized));
    } on NotFoundException catch (e) {
      // Handle not found errors
      return Left(ServerFailure.withMessage(e.message ?? S.current.informationNotAvailable));
    } on ConflictException catch (e) {
      // Handle conflict errors
      return Left(ServerFailure.withMessage(e.message ?? S.current.conflictOccurred));
    } on InternalServerErrorException catch (e) {
      // Handle internal server errors
      return Left(ServerFailure.withMessage(e.message ?? S.current.internalServerError));
    } on NoInternetConnectionException catch (e) {
      // Handle no internet connection errors
      return Left(NetworkFailure.withMessage(e.message ?? S.current.noInternetConnection));
    } on CacheException catch (e) {
      // Handle cache errors
      return Left(CacheFailure.withMessage(e.message ?? S.current.noDataOrContentAvailable));
    } on ServerException catch (e) {
      // Handle general server exceptions
      return Left(ServerFailure.withMessage(e.message ?? S.current.errorDuringCommunication));
    } on Exception catch (e) {
      // Handle all other unhandled exceptions
      return Left(FetchErrorFailure.withMessage(e.toString()));
    }
  }
}
