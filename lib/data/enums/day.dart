enum Day {
  monday("MONDAY"),
  tuesday("TUESDAY"),
  wednesday("WEDNESDAY"),
  thursday("THURSDAY"),
  friday("FRIDAY"),
  saturday("SATURDAY"),
  sunday("SUNDAY");

  const Day(this._apiValue);

  final String _apiValue;

  static Day fromJson(String apiValue) {
    try {
      return Day.values.firstWhere((element) => element._apiValue == apiValue);
    } catch (e) {
      throw Exception('Unknown Day: $apiValue');
    }
  }

  String toJson() => _apiValue;
}
