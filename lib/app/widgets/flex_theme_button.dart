import 'package:flutter/material.dart';

class FlexThemeButton extends StatelessWidget {
  final String text;
  final onPressed;
  final Color color;

  FlexThemeButton({Key key, this.text, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            color: color,
            textColor: Colors.white,
            child: Text(
              text,
              style: TextStyle(fontSize: 18.0),
            ),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
