import 'package:flutter/material.dart';
import 'package:shared_preference/reusables.dart';

import '../model/userModel.dart';
import '../services/pref_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const String id = 'signUpPage';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}



class _SignUpPageState extends State<SignUpPage> {
  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final userPhoneController = TextEditingController();
  final userPasswordController = TextEditingController();
  final userPasswordCheckController = TextEditingController();
  @override
  void initState() {
    String email = userEmailController.text.toString();
    String name = userNameController.text.toString();
    String phone = userPhoneController.text.toString();
    String password = userPasswordController.text.toString();
    String passwordCheck = userPasswordCheckController.text.toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'Let\'s get started!',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Center(
                  child: Text(
                    'Create an account to get full access to all the features',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                Container(
                  height: 250,
                  child: Image.network(
                    'https://img.freepik.com/free-vector/access-control-system-abstract-concept_335657-3180.jpg?w=1380&t=st=1661916730~exp=1661917330~hmac=e0ef66a08c90f1b1d85497ddaa027521feabc59f320f2163a9544e510afc91c7',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Reusables.InputContainer(
                    'User', userNameController, Icons.person_outline),
                const SizedBox(
                  height: 15,
                ),
                Reusables.InputContainer(
                    'Email', userEmailController, Icons.email_outlined),
                const SizedBox(
                  height: 15,
                ),
                Reusables.InputContainer('Phone number', userPhoneController,
                    Icons.phone_enabled_outlined),
                const SizedBox(
                  height: 15,
                ),
                Reusables.InputContainer('Password', userPasswordController,
                    Icons.password_outlined),
                const SizedBox(
                  height: 15,
                ),
                Reusables.InputContainer('Confirm password',
                    userPasswordCheckController, Icons.verified_outlined),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: doLogin,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    height: 55,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.blue[900],
                    ),
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                            color: Colors.blue[700],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void doLogin() async {
    String email = userEmailController.text.toString().trim();
    String password = userPasswordController.text.toString().trim();
    String passwordCheck = userPasswordCheckController.text.toString().trim();
    String name = userNameController.text.toString().trim();
    String phone = userPhoneController.text.toString().trim();
    User user = User(email: email, password: password, passwordCheck: passwordCheck, name: name, phone: phone);
    Prefs.storeUser(user);
    Prefs.loadUser().then((user) => {
      print(user?.email),
      print(user?.password),
      print(user?.passwordCheck),
      print(user?.name),
      print(user?.phone),

    });
  }
}
