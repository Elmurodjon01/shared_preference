class User {
  late String email;
  late String password;
  User(
      {required this.email, required this.password,});

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}





//
// Container(
// margin: const EdgeInsets.only(left: 20, right: 20),
// height: 50,
// padding: const EdgeInsets.only(left: 15, right: 15),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(25),
// color: Colors.grey[200],
// ),
// child: TextField(
// controller: emailController,
// decoration: const InputDecoration(
// hintText: 'Email',
// border: InputBorder.none,
// icon: Icon(
// Icons.email_outlined,
// color: Colors.blue,
// ),
// ),
// ),
// ),
// const SizedBox(
// height: 10,
// ),
// Container(
// margin: const EdgeInsets.only(left: 20, right: 20),
// height: 50,
// padding: const EdgeInsets.only(left: 15, right: 15),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(25),
// color: Colors.grey[200],
// ),
// child: TextField(
// controller: passwordController,
// decoration: const InputDecoration(
// hintText: 'Password',
// border: InputBorder.none,
// icon: Icon(
// Icons.lock_clock_outlined,
// color: Colors.blue,
// ),
// ),
// ),
// ),
// const SizedBox(
// height: 10,
// ),
// Container(
// margin: const EdgeInsets.only(left: 20, right: 20),
// height: 50,
// width: double.infinity,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(25),
// color: Colors.blue,
// ),
// child: ElevatedButton(
// onPressed: () {
// _doLogin;
// },
// child: const Text(
// 'Login',
// style: TextStyle(color: Colors.white),
// ),
// ),
// ),