import 'package:flutter/material.dart';
import 'package:shared_preference/model/userModel.dart';
import 'package:shared_preference/services/pref_service.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  // void showName(String name) {
  //   setState(() {
  //     myname = name;
  //   });
  // }
  @override
  // String myname = '';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void initState() {
    emailController;
    passwordController;
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('shared preferences'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: 50,
              padding: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.email_outlined,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: 50,
              padding: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.lock_clock_outlined,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blue,
              ),
              child: ElevatedButton(
                onPressed: () {
                  _doLogin;
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            // ElevatedButton(
            //   onPressed: () {
            //     Prefs.storeName('Elmurodjon');
            //   },
            //   child: const Text('Store name'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Prefs.loadName().then((name) => {
            //           showName(name!),
            //         });
            //   },
            //   child: const Text('Load name'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Prefs.removeName();
            //   },
            //   child: const Text('Remove name'),
            // ),
            // Text('Name:' + myname),
          ],
        ),
      ),
    );
  }
  void _doLogin (){
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    User user = User(email: email, password: password);
    Prefs.storeUser(user);
    Prefs.loadUser().then((value) => {
      print(user.email),
    });
  }
}
