import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart' show StoreBuilder;
import 'package:redux/redux.dart' show Store;

import '../../store/app.dart' show AppState;
import '../../store/locale.dart' show ChangeLocaleAction;
import '../../store/theme.dart' show ChangeThemeDataAction;
import '../../i10n/localization_intl.dart' show AppLocalizations;

import './user_account_header.dart' show UserAccountHeader;
import './flex_language_button.dart' show FlexLanguageButton;
import './flex_theme_button.dart' show FlexThemeButton;

class AppDrawer extends StatelessWidget {
  Future showLanguageDialog(BuildContext context, Store store) {
    onPressed(locale) {
      return () {
        store.dispatch(ChangeLocaleAction(locale: locale));
        Navigator.pop(context);
      };
    }

    return showDialog(
        context: context,
        builder: (BuildContext context) {
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
        });
  }

  showThemeDialog(BuildContext context, Store store) {
    onPressed(color) {
      final ThemeData themeData = ThemeData(primaryColor: color);
      return () {
        store.dispatch(ChangeThemeDataAction(themeData: themeData));
        Navigator.pop(context);
      };
    }

    return showDialog(
        context: context,
        builder: (BuildContext context) {
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
                  FlexThemeButton(
                    color: Colors.black,
                    onPressed: onPressed(Colors.black),
                  ),
                  FlexThemeButton(
                    color: Colors.brown,
                    onPressed: onPressed(Colors.brown),
                  ),
                  FlexThemeButton(
                    color: Colors.blueAccent,
                    onPressed: onPressed(Colors.blueAccent),
                  ),
                  FlexThemeButton(
                    color: Colors.greenAccent,
                    onPressed: onPressed(Colors.greenAccent),
                  ),
                  FlexThemeButton(
                    color: Colors.yellow,
                    onPressed: onPressed(Colors.yellow),
                  ),
                  FlexThemeButton(
                    color: Colors.pinkAccent,
                    onPressed: onPressed(Colors.pinkAccent),
                  ),
                  FlexThemeButton(
                    color: Colors.redAccent,
                    onPressed: onPressed(Colors.redAccent),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (BuildContext context, Store store) {
        return Drawer(
          child: Container(
            child: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  children: <Widget>[
                    UserAccountHeader(),
                    ListTile(
                      leading: Icon(Icons.language),
                      title: Text(
                        AppLocalizations.of(context).languageToggle,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onTap: () {
                        showLanguageDialog(context, store);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.color_lens),
                      title: Text(
                        AppLocalizations.of(context).themeToggle,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onTap: () {
                        showThemeDialog(context, store);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.device_unknown),
                      title: Text(
                        AppLocalizations.of(context).about,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onTap: () {
                        showThemeDialog(context, store);
                      },
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: RaisedButton(
                                  color: Theme.of(context).primaryColor,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  child: Text(
                                    AppLocalizations.of(context).signOut,
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  onPressed: () {},
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
