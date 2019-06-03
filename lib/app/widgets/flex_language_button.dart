import 'package:flutter/material.dart';

class FlexLanguageButton extends StatelessWidget {
  final String text;
  final onPressed;

  FlexLanguageButton({Key key, @required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            color: Theme.of(context).primaryColor,
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
