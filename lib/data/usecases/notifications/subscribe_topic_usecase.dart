import 'package:ansaap_app/data/repositories/notifications_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SubscribeTopicUsecase {
  final NotificationsRepository _repository;

  SubscribeTopicUsecase(this._repository);
  Future<void> call(String topic) {
    try {
      return _repository.subscribeToTopic(topic);
    } catch (e) {
      rethrow;
    }
  }
}
