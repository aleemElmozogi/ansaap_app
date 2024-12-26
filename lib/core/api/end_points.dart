class EndPoints {
  static const bool isMock = false;
  static const String baseUrl = 'http://localhost:5068/v1.0';

  static const String signIn = '$baseUrl/consumer/Auth/SignIn';
  static const String registration = '$baseUrl/consumer/Auth/Registration';

  static const String getUserInfo =
      '$baseUrl/consumer/UserManagment/GetUserInfo';

  static const String fetchPosts = '$baseUrl/consumer/Requests/fetchPosts';
  static const String fetchProjects = '$baseUrl/consumer/Requests/fetchProjects';

}
