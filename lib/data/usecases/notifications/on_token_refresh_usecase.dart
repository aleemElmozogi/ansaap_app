import 'package:ansaap_app/data/repositories/notifications_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class OnTokenRefreshUsecase {
  final NotificationsRepository _repository;

  OnTokenRefreshUsecase(this._repository);

  Stream<String> call() {
    try {
      return _repository.onTokenRefresh;
    } catch (e) {
      rethrow;
    }
  }
}
