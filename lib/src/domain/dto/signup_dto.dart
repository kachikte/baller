class SignupDto {

  String firstName = '';
  String lastName = '';
  String email = '';
  String phoneNumber = '';
  String password = '';

  SignupDto(this.firstName, this.lastName, this.email, this.phoneNumber, this.password);

  SignupDto.fromJson(json) {
    firstName = json['firstName'];
    lastName = json['lastname'];
    email = json['email'];
    phoneNumber = json['phonenumber'];
    password = json['password'];
  }

  toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password
    };
  }
}