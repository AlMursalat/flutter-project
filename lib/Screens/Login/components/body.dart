import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signup_and_signin/Screens/Login/components/background.dart';
import 'package:signup_and_signin/Screens/Register/register_screen.dart';
import 'package:signup_and_signin/components/already_have_an_account_check.dart';
import 'package:signup_and_signin/components/rounded_button.dart';
import 'package:signup_and_signin/components/rounded_input_email_field.dart';
import 'package:signup_and_signin/components/rounded_password_field.dart';
import 'package:signup_and_signin/constants.dart';
import 'package:signup_and_signin/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/login.jpg",
            height: size.height * 0.35,
          ),
          Text(
            "Login to Your Account!",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: primaryColor),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          RoundedInputEmailField(
            controller: _emailController,
            hintText: "Email",
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            controller: _passwordController,
            hasSuffix: true,
            isObscure: isObscure,
            onChanged: (value) {},
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          GestureDetector(
            // onTap: _signIn,
            child: RoundedButton(text: "SIGN IN", press: _signIn),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          AlreadyHaveAnAccountCheck(
            login: true,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RegisterScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      _showDialog("Success", "Login berhasil!");
    } else {
      _showDialog("Error", "Login gagal! Periksa email dan kata sandi Anda.");
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
