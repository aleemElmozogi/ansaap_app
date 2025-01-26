import 'package:ansaap_app/core/enums/familiy_visability_state.dart';
import 'package:ansaap_app/core/models/message_model.dart';
import 'package:ansaap_app/core/requests/add_family_member_request.dart';
import 'package:ansaap_app/features/authenticated/familyTree/data/family_tree_content_model.dart';
import 'package:ansaap_app/features/authenticated/familyTree/data/family_tree_model.dart';
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
  Future<Either<Failure, String>> addFamilyMember(
      AddFamilyMemberRequest request);
  Future<Either<Failure, FamilyTreeContentModel>> fetchFamilyTree(
      int? familyId);
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
                "cityContent": {"cityId": 1, "cityName": "بنغازي"},
                "familyName": "العريبي",
                "familyId": 1
              },
              {
                "cityContent": {"cityId": 2, "cityName": "طرابلس"},
                "familyName": "المصراتي",
                "familyId": 2
              },
              {
                "cityContent": {"cityId": 3, "cityName": "مصراتة"},
                "familyName": "الشويهدي",
                "familyId": 3
              },
              {
                "cityContent": {"cityId": 4, "cityName": "البيضاء"},
                "familyName": "العوامي",
                "familyId": 4
              },
              {
                "cityContent": {"cityId": 5, "cityName": "طبرق"},
                "familyName": "العبيدي",
                "familyId": 5
              },
              {
                "cityContent": {"cityId": 6, "cityName": "زليتن"},
                "familyName": "المغربي",
                "familyId": 6
              },
              {
                "cityContent": {"cityId": 7, "cityName": "سبها"},
                "familyName": "الطاهر",
                "familyId": 7
              },
              {
                "cityContent": {"cityId": 8, "cityName": "درنة"},
                "familyName": "المنصوري",
                "familyId": 8
              },
              {
                "cityContent": {"cityId": 9, "cityName": "غريان"},
                "familyName": "المحجوب",
                "familyId": 9
              },
              {
                "cityContent": {"cityId": 10, "cityName": "سرت"},
                "familyName": "الزوي",
                "familyId": 10
              },
              {
                "cityContent": {"cityId": 11, "cityName": "الزاوية"},
                "familyName": "الشتيوي",
                "familyId": 11
              },
              {
                "cityContent": {"cityId": 12, "cityName": "اجدابيا"},
                "familyName": "الكيلاني",
                "familyId": 12
              },
              {
                "cityContent": {"cityId": 13, "cityName": "نالوت"},
                "familyName": "القماطي",
                "familyId": 13
              },
              {
                "cityContent": {"cityId": 14, "cityName": "الكفرة"},
                "familyName": "الفزاني",
                "familyId": 14
              },
              {
                "cityContent": {"cityId": 15, "cityName": "صبراتة"},
                "familyName": "السعداوي",
                "familyId": 15
              },
              {
                "cityContent": {"cityId": 16, "cityName": "الخمس"},
                "familyName": "الحاسي",
                "familyId": 16
              },
              {
                "cityContent": {"cityId": 17, "cityName": "المرج"},
                "familyName": "البوعيشي",
                "familyId": 17
              },
              {
                "cityContent": {"cityId": 18, "cityName": "زوارة"},
                "familyName": "السويحلي",
                "familyId": 18
              },
              {
                "cityContent": {"cityId": 19, "cityName": "مسلاتة"},
                "familyName": "الغرياني",
                "familyId": 19
              },
              {
                "cityContent": {"cityId": 20, "cityName": "ترهونة"},
                "familyName": "العكروت",
                "familyId": 20
              },
              {
                "cityContent": {"cityId": 21, "cityName": "بني وليد"},
                "familyName": "المزاري",
                "familyId": 21
              },
              {
                "cityContent": {"cityId": 22, "cityName": "مرزق"},
                "familyName": "التباوي",
                "familyId": 22
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
  Future<Either<Failure, String>> addFamilyMember(
      AddFamilyMemberRequest request) async {
    return executeRequest<MessageModel, String>(
      requestFunction: () async => apiConsumer.request<MessageModel>(
          MessageModel.new,
          path: EndPoints.signIn,
          queryParameters: request.toJson(),
          method: NetworkMethod.post,
          authorization: await localStorage.accessToken,
          mockResponse: {"statusCode": 200, "data": 'تمت عملية الإضافة بنجاح'}),
      onSuccess: (response) async {
        return response.data ?? '';
      },
    );
  }

  @override
  Future<Either<Failure, FamilyTreeContentModel>> fetchFamilyTree(
      int? familyId) async {
    return executeRequest<FamilyTreeModel, FamilyTreeContentModel>(
      requestFunction: () async => apiConsumer.request<FamilyTreeModel>(
          FamilyTreeModel.new,
          path: EndPoints.signIn,
          method: NetworkMethod.get,
          queryParameters: familyId != null ? {"familyId": familyId} : {},
          authorization: await localStorage.publicToken,
          mockResponse: {
            "statusCode": 200,
            "data": {
              "familyId": 1,
              "familyName": "عائلة الجربي",
              "familyVisibility": FamilyVisibilityState.visible.value,
              "cityContent": {
                "cityId": 1,
                "cityName": "طرابلس",
              },
              "familyMembers": [
                {
                  "id": 1,
                  "name": "أحمد",
                  "familyId": 1,
                  "dateOfBirth": "1990-01-01",
                  "dateOfDeath": "2021-01-01",
                  "parentId": null,
                  "parentName": null
                },
                {
                  "id": 2,
                  "name": "محمد",
                  "familyId": 1,
                  "dateOfBirth": "1990-01-01",
                  "dateOfDeath": "2021-01-01",
                  "parentId": 1,
                  "parentName": "أحمد"
                },
                {
                  "id": 3,
                  "name": "ايمن",
                  "familyId": 1,
                  "dateOfBirth": "1990-01-01",
                  "dateOfDeath": "2021-01-01",
                  "parentId": 1,
                  "parentName": "أحمد"
                },
                {
                  "id": 4,
                  "name": "علي",
                  "familyId": 1,
                  "dateOfBirth": "1990-01-01",
                  "dateOfDeath": "2021-01-01",
                  "parentId": 1,
                  "parentName": "أحمد"
                },
                {
                  "id": 5,
                  "name": "صالح",
                  "familyId": 1,
                  "dateOfBirth": "1990-01-01",
                  "dateOfDeath": "2021-01-01",
                  "parentId": 2,
                  "parentName": "محمد"
                },
                {
                  "id": 6,
                  "name": "خالد",
                  "familyId": 1,
                  "dateOfBirth": "1990-01-01",
                  "dateOfDeath": "2021-01-01",
                  "parentId": 2,
                  "parentName": "محمد"
                }
              ]
            }
          }),
      onSuccess: (response) async {
        return response.data ??
            FamilyTreeContentModel(
              cityId: 1,
              cityName: 'Cairo',
              familyId: 1,
              familyName: 'Family 1',
              familyVisibility: FamilyVisibilityState.visible,
              familyMembers: [],
              cityContentModel: null,
            );
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
              {"cityId": 1, "cityName": "بنغازي"},
              {"cityId": 2, "cityName": "طرابلس"},
              {"cityId": 3, "cityName": "مصراتة"},
              {"cityId": 4, "cityName": "البيضاء"},
              {"cityId": 5, "cityName": "طبرق"},
              {"cityId": 6, "cityName": "زليتن"},
              {"cityId": 7, "cityName": "سبها"},
              {"cityId": 8, "cityName": "درنة"},
              {"cityId": 9, "cityName": "غريان"},
              {"cityId": 10, "cityName": "سرت"},
              {"cityId": 11, "cityName": "الزاوية"},
              {"cityId": 12, "cityName": "اجدابيا"},
              {"cityId": 13, "cityName": "نالوت"},
              {"cityId": 14, "cityName": "الكفرة"},
              {"cityId": 15, "cityName": "صبراتة"},
              {"cityId": 16, "cityName": "الخمس"},
              {"cityId": 17, "cityName": "المرج"},
              {"cityId": 18, "cityName": "زوارة"},
              {"cityId": 19, "cityName": "مسلاتة"},
              {"cityId": 20, "cityName": "ترهونة"},
              {"cityId": 21, "cityName": "بني وليد"},
              {"cityId": 22, "cityName": "مرزق"}
            ]
          }),
      onSuccess: (response) async {
        return response.data ?? [];
      },
    );
  }
}
