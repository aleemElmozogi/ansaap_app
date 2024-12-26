import 'package:ansaap_app/data/repositories/notifications_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetNotificationsSettingsUsecase {
  final NotificationsRepository _repository;

  GetNotificationsSettingsUsecase(this._repository);

  Future<NotificationSettings> call() {
    try {
      return _repository.getNotificationSettings();
    } catch (e) {
      rethrow;
    }
  }
}
