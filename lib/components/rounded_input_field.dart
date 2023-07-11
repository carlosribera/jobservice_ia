import 'package:flutter/material.dart';

import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final TextEditingController ctrl;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key, 
    this.hintText, 
    this.icon = Icons.person, 
    this.onChanged, 
    this.ctrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return TextFieldContainer(
      child: TextField( 
        controller: ctrl,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon, 
            color: colors.primary,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}