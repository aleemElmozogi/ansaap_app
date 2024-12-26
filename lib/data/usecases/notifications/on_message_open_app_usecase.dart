import 'package:ansaap_app/data/repositories/notifications_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class OnMessageOpenAppUsecase {
  final NotificationsRepository _repository;

  OnMessageOpenAppUsecase(this._repository);

  Stream<RemoteMessage> call() {
    try {
      return _repository.onMessageOpenedApp;
    } catch (e) {
      rethrow;
    }
  }
}
