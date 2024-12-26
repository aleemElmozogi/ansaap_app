import 'package:ansaap_app/data/repositories/notifications_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RequestNotificationsPermissionUsecase {
  final NotificationsRepository _repository;

  RequestNotificationsPermissionUsecase(this._repository);

  Future<NotificationSettings> call() {
    try {
      return _repository.requestPermission();
    } catch (e) {
      rethrow;
    }
  }
}
