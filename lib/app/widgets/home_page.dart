import 'package:flutter/material.dart';

import 'package:demo/i10n/localization_intl.dart' show AppLocalizations;
import './app_drawer.dart' show AppDrawer;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).title)),
      body: ListView(
        children: [
          ListItem(
              value: 1, title: AppLocalizations.of(context).bottomNavigation),
          ListItem(
              value: 2,
              title: AppLocalizations.of(context).bottomNavigationWithDocker),
          ListItem(
              value: 3, title: AppLocalizations.of(context).routeAnimation),
          ListItem(value: 4, title: AppLocalizations.of(context).frostedGlass),
          ListItem(
              value: 5, title: AppLocalizations.of(context).retainPageStatus),
          ListItem(value: 6, title: AppLocalizations.of(context).searchBar),
          ListItem(
              value: 7,
              title: AppLocalizations.of(context).wrapStreamingLayout),
          ListItem(
              value: 8, title: AppLocalizations.of(context).expandClosedCase),
          ListItem(
              value: 9, title: AppLocalizations.of(context).bezierCurveCutting),
          ListItem(
              value: 10,
              title: AppLocalizations.of(context).splashScreenAnimation),
          ListItem(
              value: 11,
              title: AppLocalizations.of(context).rightArrawReturnPreviousPage),
          ListItem(value: 12, title: AppLocalizations.of(context).tooltip),
          ListItem(value: 13, title: AppLocalizations.of(context).dragDrop),
          ListItem(
              value: 14,
              title: AppLocalizations.of(context).roundAvatarRoundedEffect),
          ListItem(value: 15, title: AppLocalizations.of(context).gridList),
          ListItem(value: 16, title: AppLocalizations.of(context).slidingOff),
          ListItem(value: 17, title: AppLocalizations.of(context).animatedList),
          ListItem(value: 18, title: AppLocalizations.of(context).fileIO),
          ListItem(value: 19, title: AppLocalizations.of(context).netRequest),
          ListItem(
              value: 20, title: AppLocalizations.of(context).platformChannel),
          ListItem(
              value: 21,
              title: AppLocalizations.of(context).textFontStyleButton),
          ListItem(value: 22, title: AppLocalizations.of(context).imageIcon),
          ListItem(
              value: 23,
              title: AppLocalizations.of(context).radioSwitchCheckBox),
          ListItem(value: 24, title: AppLocalizations.of(context).inputBoxForm),
          ListItem(value: 25, title: AppLocalizations.of(context).layout),
          ListItem(
              value: 26, title: AppLocalizations.of(context).containerWidget),
          ListItem(
              value: 27, title: AppLocalizations.of(context).scrollableWidget),
          ListItem(
              value: 28, title: AppLocalizations.of(context).functionalWidget),
          ListItem(
              value: 29,
              title: AppLocalizations.of(context).eventHandlingNotification),
          ListItem(value: 30, title: AppLocalizations.of(context).customWidget),
          ListItem(value: 31, title: AppLocalizations.of(context).useRedux),
          ListItem(value: 32, title: AppLocalizations.of(context).intl),
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}

class ListItem extends StatelessWidget {
  final num value;
  final String title;

  ListItem({this.value, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'demo$value');
      },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)),
        ),
        child: Text(title),
      ),
    );
  }
}
