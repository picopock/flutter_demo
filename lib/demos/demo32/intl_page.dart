import 'package:flutter/material.dart';

import '../../i10n/localization_intl.dart' show AppLocalizations;

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
            Text(AppLocalizations.of(context).remainingEmailsMessage(10))
          ],
        ),
      ),
    );
  }
}
