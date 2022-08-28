import 'package:flutter/material.dart';
import 'package:shared_preference/model/userModel.dart';
import 'package:shared_preference/reusables.dart';
import 'package:shared_preference/services/pref_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Prefs prefs = Prefs();

class _MyHomePageState extends State<MyHomePage> {
  @override
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void _doLogin() async {
    String email = emailController.toString().trim();
    String password = passwordController.toString().trim();
    User user = User(email: email, password: password);
    Prefs.storeUser(user);
    Prefs.loadUser().then((user)  => {
      print(user?.email),
      print(user?.password),

    });
  }
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('shared preferences'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Reusables.InputContainer('Email', emailController, Icons.person_outline),
            const SizedBox(height: 10,),
            Reusables.InputContainer('Password', passwordController, Icons.lock_open),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password?')
                ],
              ),
            ),
            const SizedBox(height: 20,),
            //login button
            Reusables.CustomButton('LOG IN'),
            const SizedBox(height: 40,),
            Text('Or connect using', style: TextStyle(color: Colors.grey, fontSize: 16),),
            const SizedBox(height: 20,),
            Reusables.Alternative(),
          ],
        ),
      );
  }

  // void _doLogin() {
  //   String email = emailController.text.toString().trim();
  //   String password = passwordController.text.toString().trim();
  //   User user = User.from(email: email, password: password);
  //   Prefs.storeUser(user);
  //   // prefs.loadUser(user).then((value) => {
  //   //   print(user.email),
  //   //   print(user.password),
  //   // });
  //   Prefs.loadUser().then((user) => {
  //         print(user?.email),
  //       });
  //   print(user.email);
  // }
}
