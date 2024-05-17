import 'package:flutter/material.dart';
import 'package:signup_and_signin/Screens/Login/components/text_field_container.dart';
import 'package:signup_and_signin/constants.dart';

class RoundedInputEmailField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputEmailField({
    super.key,
    required this.hintText,
    this.icon = Icons.email,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: onChanged,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: primaryColor,
            ),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}
