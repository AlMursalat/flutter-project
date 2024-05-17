import 'package:flutter/material.dart';
import 'package:signup_and_signin/constants.dart';

import '../Screens/Login/components/text_field_container.dart';

class RoundedInputNameField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputNameField({
    super.key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        keyboardType: TextInputType.name,
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
