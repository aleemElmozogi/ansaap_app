import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:ansaap_app/core/models/error_response_model.dart';
import 'package:ansaap_app/core/utils/error_fromatter.dart';
import 'package:ansaap_app/generated/l10n.dart';

class ServerException extends Equatable implements Exception {
  final String? message;

  const ServerException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

class ApiException extends ServerException {
  final ErrorResponseModel errorResponse;

  ApiException(this.errorResponse, [String? message])
      : super(message ?? errorResponse.message);

  @override
  List<Object?> get props => [errorResponse, message];
}

class FetchDataException extends ServerException {
  FetchDataException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.errorDuringCommunication);
}

class EmptyResponseException extends ServerException {
  EmptyResponseException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.noDataOrContentAvailable);
}

class BadRequestException extends ServerException {
  BadRequestException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.invalidRequest);
}

class BadResponseException extends ServerException {
  BadResponseException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.invalidResponse);
}

class UnauthorizedException extends ServerException {
  UnauthorizedException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.unauthorized);
}

class NotFoundException extends ServerException {
  NotFoundException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.informationNotAvailable);
}

class ConflictException extends ServerException {
  ConflictException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.conflictOccurred);
}

class InternalServerErrorException extends ServerException {
  InternalServerErrorException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.internalServerError);
}

class NoInternetConnectionException extends ServerException {
  NoInternetConnectionException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.noInternetConnection);
}

class CacheException extends ServerException {
  CacheException([message])
      : super((message != null && message.toString().isNotEmpty)
            ? message.toString()
            : S.current.noDataOrContentAvailable);
}
