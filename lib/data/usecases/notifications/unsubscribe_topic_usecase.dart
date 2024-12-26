import 'package:ansaap_app/data/repositories/notifications_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UnsubscribeTopicUsecase {
  final NotificationsRepository _repository;

  UnsubscribeTopicUsecase(this._repository);
  Future<void> call(String topic) {
    try {
      return _repository.unsubscribeFromTopic(topic);
    } catch (e) {
      rethrow;
    }
  }
}
