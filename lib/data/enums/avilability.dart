enum Avilability {
  available("AVAILABLE"),
  unavailable("UNAVAILABLE"),
  archived("ARCHIVED");

  const Avilability(this._apiValue);

  final String _apiValue;

  static Avilability fromJson(String apiValue) {
    try {
      return Avilability.values
          .firstWhere((element) => element._apiValue == apiValue);
    } catch (e) {
      throw Exception('Unknown Avilability: $apiValue');
    }
  }

  String toJson() => _apiValue;
}
