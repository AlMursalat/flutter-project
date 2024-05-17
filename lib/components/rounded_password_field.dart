import 'package:flutter/material.dart';
import 'package:signup_and_signin/Screens/Login/components/text_field_container.dart';
import 'package:signup_and_signin/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final bool isObscure;
  final bool hasSuffix;
  final VoidCallback onPressed;
  const RoundedPasswordField({
    super.key,
    required this.onChanged,
    required this.onPressed,
    required this.hasSuffix,
    required this.isObscure,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: isObscure,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: primaryColor,
          ),
          suffixIcon: hasSuffix
              ? IconButton(
                  onPressed: onPressed,
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                  color: primaryColor,
                )
              : null,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
