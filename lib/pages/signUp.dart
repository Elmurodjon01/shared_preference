import 'package:flutter/material.dart';
import 'package:shared_preference/reusables.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const String id = 'signUpPage';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

final userNameController = TextEditingController();
final userEmailController = TextEditingController();
final userPhoneController = TextEditingController();
final userPasswordController = TextEditingController();
final userPasswordCheckController = TextEditingController();

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'https://media.istockphoto.com/vectors/signup-touch-user-screen-icon-vector-id1138806878?k=20&m=1138806878&s=612x612&w=0&h=UbOmE6UQQTklMeCE9Ag43SlKpzoUNOM3XxyhDCHD7rc=',
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
                  onTap: () {},
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
                        'LOG IN',
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
}
