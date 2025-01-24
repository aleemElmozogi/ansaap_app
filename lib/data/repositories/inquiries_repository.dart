import 'package:ansaap_app/core/models/message_model.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/data/models/cities_content_model.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/data/models/cities_model.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/data/models/families_content_model.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/data/models/families_model.dart';
import 'package:dartz/dartz.dart';
import 'package:ansaap_app/core/api/api_consumer.dart';
import 'package:ansaap_app/core/api/end_points.dart';
import 'package:ansaap_app/core/error/failures.dart';
import 'package:ansaap_app/core/localStorage/loacal_storage.dart';
import 'package:ansaap_app/core/network/network_info.dart';

import 'package:ansaap_app/core/utils/network_method.dart';
import 'package:ansaap_app/data/repositories/base_repository.dart';

import 'package:injectable/injectable.dart';

abstract class InquiriesRepository {
  Future<Either<Failure, List<FamiliesContentModel>>> fetchFamilies();
  Future<Either<Failure, List<CitiesContentModel>>> fetchCities();
  Future<Either<Failure, String>> sendSuggestion(String suggestion);
}

@Singleton(as: InquiriesRepository)
class InquiriesRepositoryImpl extends BaseRepository
    implements InquiriesRepository {
  InquiriesRepositoryImpl({
    required LocalStorage localStorage,
    required ApiConsumer apiConsumer,
    required NetworkInfo networkInfo,
  }) : super(
          localStorage: localStorage,
          apiConsumer: apiConsumer,
          networkInfo: networkInfo,
        );

  @override
  Future<Either<Failure, List<FamiliesContentModel>>> fetchFamilies() async {
    return executeRequest<FamiliesModel, List<FamiliesContentModel>>(
      requestFunction: () async => apiConsumer.request<FamiliesModel>(
          FamiliesModel.new,
          path: EndPoints.signIn,
          method: NetworkMethod.get,
          authorization: await localStorage.publicToken,
          mockResponse: {
            "statusCode": 200,
            "data": [
              {
                "cityContent": {
                  "cityId": 1,
                  "cityName": "Cairo",
                },
                "familyName": "Family 1",
                "familyId": 1,
              }
            ]
          }),
      onSuccess: (response) async {
        return response.data ?? [];
      },
    );
  }

  @override
  Future<Either<Failure, String>> sendSuggestion(String suggestion) async {
    return executeRequest<MessageModel, String>(
      requestFunction: () async => apiConsumer.request<MessageModel>(
          MessageModel.new,
          path: EndPoints.signIn,
          method: NetworkMethod.get,
          authorization: await localStorage.publicToken,
          mockResponse: {"statusCode": 200, "data": 'تمت العملية بنجاح'}),
      onSuccess: (response) async {
        return response.data ?? '';
      },
    );
  }

  @override
  Future<Either<Failure, List<CitiesContentModel>>> fetchCities() async {
    return executeRequest<CitiesModel, List<CitiesContentModel>>(
      requestFunction: () async => apiConsumer.request<CitiesModel>(
          CitiesModel.new,
          path: EndPoints.signIn,
          method: NetworkMethod.get,
          authorization: await localStorage.publicToken,
          mockResponse: {
            "statusCode": 200,
            "data": [
              {
                "cityId": 1,
                "cityName": "Cairo",
              },
              {
                "cityId": 2,
                "cityName": "Tripoli",
              },
            ]
          }),
      onSuccess: (response) async {
        return response.data ?? [];
      },
    );
  }
}
