import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preference/model/userModel.dart';
import 'package:shared_preference/pages/signUp.dart';
import 'package:shared_preference/reusables.dart';
import 'package:shared_preference/services/pref_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  bool pressed = false;
  @override
  void initState() {
    String email = emailController.text.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              child: Image.network(
                'https://cdni.iconscout.com/illustration/premium/thumb/login-page-4468581-3783954.png',
                fit: BoxFit.cover,
              ),
            ),
            Reusables.InputContainer(
                'Email', emailController, Icons.person_outline),
            const SizedBox(
              height: 10,
            ),
            Reusables.InputContainer(
                'Password', passwordController, Icons.lock_open),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text('Forgot Password?')],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //login button
            //Reusables.CustomButton('LOG IN', doLogin,),
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
                child: Center(
                  child: Text(
                    'LOG IN',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Or connect using',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            //google vs facebook
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Reusables.Alternative(Colors.blue[900]!, 'Facebook'),
                const SizedBox(
                  width: 15,
                ),
                Reusables.Alternative(Colors.red, 'Google'),
              ],
            ),
            const SizedBox(
              height: 90,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account? '),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpPage()),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.blue[700], fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
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
  void doLogin() async {
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    User user = User(email: email, password: password);
    Prefs.storeUser(user);
    Prefs.loadUser().then((user) => {
          print(user?.email),
          print(user?.password),
        });
  }
}
