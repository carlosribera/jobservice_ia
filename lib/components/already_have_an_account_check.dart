import 'package:flutter/material.dart';



class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key, 
    this.login = true, 
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "No tienes una cuenta ? " : "Ya tienes una cuenta ? ",
          style: TextStyle(color: colors.secondary,fontSize: 14),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In", 
            style: TextStyle(
              color: colors.primary, 
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}
