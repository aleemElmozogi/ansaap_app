enum UserStatus {
  //   ACTIVE
  // INACTIVE
  // BANNED
  // DELETED
  active('ACTIVE'),
  inactive('INACTIVE'),
  banned('BANNED'),
  deleted('DELETED');

  const UserStatus(this._apiValue);

  final String _apiValue;

  static UserStatus fromJson(String apiValue) {
    try {
      return UserStatus.values
          .firstWhere((element) => element._apiValue == apiValue);
    } catch (e) {
      throw Exception('Unknown UserStatus: $apiValue');
    }
  }

  String toJson() => _apiValue;
}
