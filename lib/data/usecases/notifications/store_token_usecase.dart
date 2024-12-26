import 'package:ansaap_app/data/repositories/notifications_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class StoreTokenUsecase {
  final NotificationsRepository _repository;

  StoreTokenUsecase(this._repository);
  // TODO: implement call
  // Future<void> call(StoreFcmTokenRequest request) {
  //   try {
  //     return _repository.storeToken(request);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
