import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart' show StoreBuilder;
import 'package:redux/redux.dart' show Store;

import '../../store/app.dart' show AppState;
import '../../store/locale.dart' show ChangeLocaleAction;
import '../../store/theme.dart' show ChangeThemeDataAction;
import '../../i10n/localization_intl.dart' show AppLocalizations;

import './user_account_header.dart' show UserAccountHeader;
import './theme_dialog.dart' show ThemeDialog;
import './language_dialog.dart' show LanguageDialog;

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
          return LanguageDialog(
            onPressed: onPressed,
          );
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
          return ThemeDialog(
            onPressed: onPressed,
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
                      onTap: () {},
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
