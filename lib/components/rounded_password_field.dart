import 'package:flutter/material.dart';

import 'text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final TextEditingController ctrl;
  final ValueChanged<String> onChanged;
  final String hintText;
  const RoundedPasswordField({
    Key key, 
    this.onChanged, 
    this.ctrl, 
    this.hintText, 
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _isHidden = true;
  void _toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    
    return TextFieldContainer(
      child: TextField(
        controller: widget.ctrl,
        obscureText: widget.hintText == "Contraseña" ? _isHidden : true,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hintText,
          icon: Icon(
            Icons.lock, 
            color: colors.primary,
          ),
          // suffixIcon: Icon(
          //   Icons.visibility,
          //   color: kPrimaryColor,
          // ),
          suffixIcon: widget.hintText == "Contraseña" ? IconButton(
            onPressed: _toggleVisibility,
            color: colors.primary,
            icon: _isHidden ? const Icon(Icons.visibility_off) :const Icon(Icons.visibility),
          ) : null,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

