import 'package:ansaap_app/data/repositories/notifications_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetNotificationsUseCase {
  final NotificationsRepository _notificationsRepository;

  GetNotificationsUseCase(this._notificationsRepository);

  // TODO: implement this
  // Future<List<Notification>> call() async {
  //   try {
  //     return await _notificationsRepository.getNotifications();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
