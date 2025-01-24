// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../config/routes/app_router.dart' as _i20;
import '../../data/repositories/auth_repository.dart' as _i481;
import '../../data/repositories/inquiries_repository.dart' as _i325;
import '../../data/repositories/notifications_repository.dart' as _i1061;
import '../../data/repositories/otp_repository.dart' as _i640;
import '../../data/services/fcm_service.dart' as _i1036;
import '../../data/usecases/notifications/delete_token_usecase.dart' as _i356;
import '../../data/usecases/notifications/get_notifications_settings_usecase.dart'
    as _i388;
import '../../data/usecases/notifications/get_notifications_usecase.dart'
    as _i1071;
import '../../data/usecases/notifications/get_token_usecase.dart' as _i224;
import '../../data/usecases/notifications/on_message_open_app_usecase.dart'
    as _i471;
import '../../data/usecases/notifications/on_message_usecase.dart' as _i34;
import '../../data/usecases/notifications/on_token_refresh_usecase.dart'
    as _i218;
import '../../data/usecases/notifications/request_notifications_permission_usecase.dart'
    as _i846;
import '../../data/usecases/notifications/store_token_usecase.dart' as _i322;
import '../../data/usecases/notifications/subscribe_topic_usecase.dart'
    as _i794;
import '../../data/usecases/notifications/unsubscribe_topic_usecase.dart'
    as _i500;
import '../../features/authenticated/sendSuggestion/domain/usecases/send_suggestion_usecase.dart'
    as _i494;
import '../../features/authenticated/sendSuggestion/presentation/cubit/send_suggestion_cubit.dart'
    as _i947;
import '../../features/authenticated/viewFamilies/domain/usecases/fetch_cities_usecase.dart'
    as _i1027;
import '../../features/authenticated/viewFamilies/domain/usecases/fetch_families_usecase.dart'
    as _i499;
import '../../features/authenticated/viewFamilies/presentation/cubit/view_families_cubit.dart'
    as _i738;
import '../../features/authentication/auth/domain/usecases/auth_usecase.dart'
    as _i298;
import '../../features/authentication/auth/presentation/cubit/auth_cubit.dart'
    as _i609;
import '../../features/authentication/register/domain/usecases/signup_usecase.dart'
    as _i354;
import '../../features/authentication/verifyPhoneNumber/domain/usecases/otp_verification_usecase.dart'
    as _i867;
import '../../features/authentication/verifyPhoneNumber/domain/usecases/send_otp_usecase.dart'
    as _i629;
import '../../features/startUp/splash/data/datasources/lang_local_data_source.dart'
    as _i600;
import '../../features/startUp/splash/data/repositories/lang_repository_impl.dart'
    as _i705;
import '../../features/startUp/splash/domain/repositories/lang_repository.dart'
    as _i865;
import '../../features/startUp/splash/domain/usecases/change_lang.dart' as _i92;
import '../../features/startUp/splash/domain/usecases/get_saved_lang.dart'
    as _i586;
import '../../features/startUp/splash/presentation/cubit/locale_cubit.dart'
    as _i258;
import '../api/api_consumer.dart' as _i207;
import '../api/api_consumer_mock_impl.dart' as _i776;
import '../api/api_consumer_prod_impl.dart' as _i1030;
import '../api/api_helper.dart' as _i242;
import '../localStorage/loacal_storage.dart' as _i198;
import '../network/network_info.dart' as _i932;
import '../services/fcm_service.dart' as _i928;

const String _mock = 'mock';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i20.AppRouter>(() => _i20.AppRouter());
    gh.lazySingleton<_i242.ApiHelper>(() => _i242.ApiHelperImpl());
    gh.singleton<_i198.LocalStorage>(() => _i198.LocalStorageImpl());
    gh.singleton<_i600.LangLocalDataSource>(() =>
        _i600.LangLocalDataSourceImpl(localStorage: gh<_i198.LocalStorage>()));
    gh.lazySingleton<_i932.NetworkInfo>(() => _i932.NetworkInfoImpl());
    gh.factory<_i207.ApiConsumer>(
      () => _i776.DioConsumerMockImpl(gh<_i932.NetworkInfo>()),
      registerFor: {_mock},
    );
    gh.lazySingleton<_i928.FcmService>(
        () => _i928.FcmService(gh<_i892.FirebaseMessaging>()));
    gh.lazySingleton<_i1036.FcmService>(
        () => _i1036.FcmService(gh<_i892.FirebaseMessaging>()));
    gh.lazySingleton<_i1061.NotificationsRepository>(
        () => _i1061.NotificationsRepository(
              gh<_i1036.FcmService>(),
              gh<_i932.NetworkInfo>(),
            ));
    gh.singleton<_i865.LangRepository>(() => _i705.LangRepositoryImpl(
        langLocalDataSource: gh<_i600.LangLocalDataSource>()));
    gh.lazySingleton<_i1071.GetNotificationsUseCase>(() =>
        _i1071.GetNotificationsUseCase(gh<_i1061.NotificationsRepository>()));
    gh.factory<_i207.ApiConsumer>(
      () => _i1030.DioConsumerProdImpl(gh<_i932.NetworkInfo>()),
      registerFor: {_prod},
    );
    gh.singleton<_i640.OtpRepository>(() => _i640.OtpRepositoryImpl(
          localStorage: gh<_i198.LocalStorage>(),
          apiConsumer: gh<_i207.ApiConsumer>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i500.UnsubscribeTopicUsecase>(() =>
        _i500.UnsubscribeTopicUsecase(gh<_i1061.NotificationsRepository>()));
    gh.lazySingleton<_i218.OnTokenRefreshUsecase>(() =>
        _i218.OnTokenRefreshUsecase(gh<_i1061.NotificationsRepository>()));
    gh.lazySingleton<_i356.DeleteTokenUsecase>(
        () => _i356.DeleteTokenUsecase(gh<_i1061.NotificationsRepository>()));
    gh.lazySingleton<_i471.OnMessageOpenAppUsecase>(() =>
        _i471.OnMessageOpenAppUsecase(gh<_i1061.NotificationsRepository>()));
    gh.lazySingleton<_i34.OnMessageUsecase>(
        () => _i34.OnMessageUsecase(gh<_i1061.NotificationsRepository>()));
    gh.lazySingleton<_i224.GetTokenUsecase>(
        () => _i224.GetTokenUsecase(gh<_i1061.NotificationsRepository>()));
    gh.lazySingleton<_i846.RequestNotificationsPermissionUsecase>(() =>
        _i846.RequestNotificationsPermissionUsecase(
            gh<_i1061.NotificationsRepository>()));
    gh.lazySingleton<_i388.GetNotificationsSettingsUsecase>(() =>
        _i388.GetNotificationsSettingsUsecase(
            gh<_i1061.NotificationsRepository>()));
    gh.lazySingleton<_i794.SubscribeTopicUsecase>(() =>
        _i794.SubscribeTopicUsecase(gh<_i1061.NotificationsRepository>()));
    gh.lazySingleton<_i322.StoreTokenUsecase>(
        () => _i322.StoreTokenUsecase(gh<_i1061.NotificationsRepository>()));
    gh.singleton<_i325.InquiriesRepository>(() => _i325.InquiriesRepositoryImpl(
          localStorage: gh<_i198.LocalStorage>(),
          apiConsumer: gh<_i207.ApiConsumer>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.singleton<_i481.AuthRepository>(() => _i481.AuthRepositoryImpl(
          localStorage: gh<_i198.LocalStorage>(),
          apiConsumer: gh<_i207.ApiConsumer>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i629.SendOtpUsecase>(() => _i629.SendOtpUsecase(
          otpRepository: gh<_i640.OtpRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i867.OtpVerificationUsecase>(
        () => _i867.OtpVerificationUsecase(
              otpRepository: gh<_i640.OtpRepository>(),
              networkInfo: gh<_i932.NetworkInfo>(),
            ));
    gh.lazySingleton<_i586.GetSavedLangUseCase>(() => _i586.GetSavedLangUseCase(
          langRepository: gh<_i865.LangRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i92.ChangeLangUseCase>(() => _i92.ChangeLangUseCase(
          langRepository: gh<_i865.LangRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i298.AuthUsecase>(() => _i298.AuthUsecase(
          authRepository: gh<_i481.AuthRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i354.SignupUsecase>(() => _i354.SignupUsecase(
          authRepository: gh<_i481.AuthRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i609.AuthCubit>(() => _i609.AuthCubit(
          gh<_i298.AuthUsecase>(),
          gh<_i198.LocalStorage>(),
        ));
    gh.lazySingleton<_i499.FetchFamiliesUsecase>(
        () => _i499.FetchFamiliesUsecase(
              inquiriesRepository: gh<_i325.InquiriesRepository>(),
              networkInfo: gh<_i932.NetworkInfo>(),
            ));
    gh.lazySingleton<_i1027.FetchCitiesUsecase>(() => _i1027.FetchCitiesUsecase(
          inquiriesRepository: gh<_i325.InquiriesRepository>(),
          networkInfo: gh<_i932.NetworkInfo>(),
        ));
    gh.lazySingleton<_i494.SendSuggestionUsecase>(
        () => _i494.SendSuggestionUsecase(
              inquiriesRepository: gh<_i325.InquiriesRepository>(),
              networkInfo: gh<_i932.NetworkInfo>(),
            ));
    gh.factory<_i258.LocaleCubit>(() => _i258.LocaleCubit(
          getSavedLangUseCase: gh<_i586.GetSavedLangUseCase>(),
          changeLangUseCase: gh<_i92.ChangeLangUseCase>(),
        ));
    gh.lazySingleton<_i947.SendSuggestionCubit>(
        () => _i947.SendSuggestionCubit(gh<_i494.SendSuggestionUsecase>()));
    gh.lazySingleton<_i738.ViewFamiliesCubit>(() => _i738.ViewFamiliesCubit(
          gh<_i499.FetchFamiliesUsecase>(),
          gh<_i1027.FetchCitiesUsecase>(),
        ));
    return this;
  }
}
