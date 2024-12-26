import 'package:ansaap_app/data/repositories/notifications_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class OnMessageUsecase {
  final NotificationsRepository _repository;

  OnMessageUsecase(this._repository);

  Stream<RemoteMessage> call() {
    try {
      return _repository.onMessage;
    } catch (e) {
      rethrow;
    }
  }
}
