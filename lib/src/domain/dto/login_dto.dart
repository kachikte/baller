class LoginDto {

  String email = '';
  String password = '';

  LoginDto(this.email, this.password);

  LoginDto.fromJson(json) {
    email = json['email'];
    password = json['password'];
  }

  toJson() {
    return {
      'email': email,
      'password': password
    };
  }
}