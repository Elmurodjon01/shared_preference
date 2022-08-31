class LoginUserModel {
  late String email;
  late String password;
  LoginUserModel(
      {required this.email,
        required this.password,});

  LoginUserModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };
}
