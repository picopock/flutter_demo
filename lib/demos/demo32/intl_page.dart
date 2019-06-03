import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../i10n/localization_intl.dart' show AppLocalizations;
import '../../store/app.dart' show AppState;
import '../../store/locale.dart' show ChangeLocaleAction;

class IntlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).intl),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(AppLocalizations.of(context).remainingEmailsMessage(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  color: Colors.amberAccent,
                  onPressed: () {
                    StoreProvider.of<AppState>(context).dispatch(
                        ChangeLocaleAction(locale: Locale('zh', 'CN')));
                  },
                  child: Text('中文简体'),
                ),
                RaisedButton(
                  color: Colors.cyan,
                  onPressed: () {
                    StoreProvider.of<AppState>(context).dispatch(
                        ChangeLocaleAction(locale: Locale('en', 'US')));
                  },
                  child: Text('English'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
