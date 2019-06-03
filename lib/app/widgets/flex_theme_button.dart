import 'package:flutter/material.dart';

class FlexThemeButton extends StatelessWidget {
  final onPressed;
  final Color color;

  FlexThemeButton({Key key, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: onPressed,
              color: color,
              child: Text(''),
            ),
          ),
        ],
      ),
    );
  }
}
