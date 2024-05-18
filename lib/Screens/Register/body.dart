import 'package:flutter/material.dart';
import 'package:signup_and_signin/Screens/Login/login_screen.dart';
import 'package:signup_and_signin/Screens/Register/background.dart';
import 'package:signup_and_signin/components/already_have_an_account_check.dart';
import 'package:signup_and_signin/components/rounded_button.dart';
import 'package:signup_and_signin/components/rounded_input_email_field.dart';
import 'package:signup_and_signin/components/rounded_input_name_field.dart';
import 'package:signup_and_signin/components/rounded_password_field.dart';
import 'package:signup_and_signin/constants.dart';
import 'package:signup_and_signin/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
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
            'assets/images/register.jpg',
            height: size.height * 0.35,
          ),
          Text(
            "Create New Account!",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: primaryColor),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          RoundedInputNameField(
            controller: _usernameController,
            hintText: "Username",
            onChanged: (value) {},
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
            // onTap: _signUp,
            child: RoundedButton(text: "SIGN UP", press: _signUp),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void _signUp() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      _showDialog("Success", "User berhasil dibuat!");
    } else {
      _showDialog("Error", "User gagal dibuat!");
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
