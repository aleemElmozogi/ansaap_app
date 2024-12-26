import 'package:ansaap_app/data/repositories/notifications_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTokenUsecase {
  final NotificationsRepository _repository;

  GetTokenUsecase(this._repository);

  Future<String?> call() {
    try {
      return _repository.getToken();
    } catch (e) {
      rethrow;
    }
  }
}
