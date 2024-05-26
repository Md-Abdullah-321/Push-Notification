import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/screens/home.dart';
import 'package:push_notification/user_auth/firebase_auth_implementation/firebase_auth_services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState(); // Delegate state creation
}

class _LoginState extends State<Login> {
  // Define state variables for user input
  String _email = "";
  String _password = "";
  final FirebaseAuthService _auth = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome Back!",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const Text(
              "Login to continue",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.80,
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Email",
                    ),
                    onChanged: (value) => setState(
                        () => _email = value), // Update email on change
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Password",
                    ),
                    obscureText: true, // Hide password input
                    onChanged: (value) => setState(
                        () => _password = value), // Update password on change
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      // Handle form submission logic using _email and _password
                      _login(_email, _password, context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      fixedSize:
                          const Size(double.maxFinite, double.minPositive),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.amber[400],
    );
  }

  void _login(String _email, String _password, context) async {
    User? user = await _auth.signInWithEmailAndPassword(_email, _password);

    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    } else {
      print("User does not exist");
    }
  }
}
