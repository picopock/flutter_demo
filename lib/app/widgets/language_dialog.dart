import 'package:flutter/material.dart';

import './flex_language_button.dart' show FlexLanguageButton;

class LanguageDialog extends StatelessWidget {
  final onPressed;
  LanguageDialog({Key key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250.0,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlexLanguageButton(
              text: '简体中文',
              onPressed: onPressed(Locale('zh', 'CN')),
            ),
            FlexLanguageButton(
              text: 'English',
              onPressed: onPressed(Locale('en', 'US')),
            ),
          ],
        ),
      ),
    );
  }
}

// return Material(
//   child: MediaQuery(
//     data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
//         .copyWith(textScaleFactor: 1),
//     child: new SafeArea(
//       child: Center(
//         child: Container(
//             width: 250.0,
//             height: 400.0,
//             child: Column(
//               children: <Widget>[
//                 ListTile(
//                   title: Text('简体中文'),
//                 )
//               ],
//             )),
//       ),
//     ),
//   ),
// );
