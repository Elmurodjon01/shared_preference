class User {
  late String email;
  late String password;
  late String phone;
  late String name;
  late String passwordCheck;
  User(
      {required this.email,
      required this.password,
      required this.passwordCheck,
      required this.name,
      required this.phone});

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'],
        passwordCheck = json['passwordCheck'],
        name = json['name'],
        phone = json['phone'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'passwordCheck': passwordCheck,
        'name': name,
        'phone': phone
      };
}
