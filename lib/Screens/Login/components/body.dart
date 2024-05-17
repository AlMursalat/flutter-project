import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:signup_and_signin/Screens/Login/components/background.dart';
import 'package:signup_and_signin/Screens/Register/register_screen.dart';
import 'package:signup_and_signin/components/already_have_an_account_check.dart';
import 'package:signup_and_signin/components/rounded_button.dart';
import 'package:signup_and_signin/components/rounded_input_email_field.dart';
import 'package:signup_and_signin/components/rounded_password_field.dart';
import 'package:signup_and_signin/constants.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
    required Column child,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
            hintText: "Your Email",
            onChanged: (value) {},
          ),
          RoundedPasswordField(
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
          RoundedButton(
            text: "LOGIN",
            press: () {},
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
}
