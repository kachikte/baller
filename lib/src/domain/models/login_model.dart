class LoginModel {
  String token = '';
  String firstName = '';
  String lastName = '';
  String email = '';

  LoginModel(
      {required this.token,
      required this.firstName,
      required this.lastName,
      required this.email});
}
