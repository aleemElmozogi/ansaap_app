import 'package:ansaap_app/data/repositories/notifications_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteTokenUsecase {
  final NotificationsRepository _repository;

  const DeleteTokenUsecase(this._repository);

  Future<void> call() {
    try {
      return _repository.deleteToken();
    } catch (e) {
      rethrow;
    }
  }
}
