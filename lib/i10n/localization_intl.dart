import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static AppLocalizationsDelegate delegate = AppLocalizationsDelegate();

  String get title => Intl.message(
        'Flutter App',
        name: 'title',
        desc: 'Title for the Demo application',
      );

  remainingEmailsMessage(int howMany) => Intl.plural(
        howMany,
        zero: 'There are no emails left',
        one: 'There is $howMany email left',
        other: 'There are $howMany emails left',
        name: "remainingEmailsMessage",
        args: [howMany],
        desc: "How many emails remain after archiving.",
        examples: const {'howMany': 42, 'userName': 'Fred'},
      );

  String get intl {
    return Intl.message('Flutter intl', desc: 'intl', args: [], name: 'intl');
  }

  String get bottomNavigation {
    return Intl.message('bottom navigation',
        desc: 'intl', args: [], name: 'bottomNavigation');
  }

  String get bottomNavigationWithDocker =>
      Intl.message('bottom navigation with docker',
          desc: 'intl', args: [], name: 'bottomNavigationWithDocker');
  String get routeAnimation => Intl.message('route animation',
      desc: 'intl', args: [], name: 'routeAnimation');
  String get frostedGlass => Intl.message('frosted glass effects',
      desc: 'intl', args: [], name: 'frostedGlass');
  String get retainPageStatus => Intl.message('retain page status',
      desc: 'intl', args: [], name: 'retainPageStatus');
  String get searchBar =>
      Intl.message('search bar', desc: 'intl', args: [], name: 'searchBar');
  String get wrapStreamingLayout => Intl.message('wrap streaming layout',
      desc: 'intl', args: [], name: 'wrapStreamingLayout');
  String get expandClosedCase => Intl.message('expand closed case',
      desc: 'intl', args: [], name: 'expandClosedCase');
  String get bezierCurveCutting => Intl.message('bezier curve cutting',
      desc: 'intl', args: [], name: 'bezierCurveCutting');
  String get splashScreenAnimation => Intl.message('splash screen animation',
      desc: 'intl', args: [], name: 'splashScreenAnimation');
  String get rightArrawReturnPreviousPage =>
      Intl.message('Swipe right to return to the previous page',
          desc: 'intl', args: [], name: 'rightArrawReturnPreviousPage');
  String get tooltip =>
      Intl.message('Tooltip', desc: 'intl', args: [], name: 'tooltip');
  String get dragDrop =>
      Intl.message('Drag and drop', desc: 'intl', args: [], name: 'dragDrop');
  String get roundAvatarRoundedEffect =>
      Intl.message('Round avatar and rounded effect',
          desc: 'intl', args: [], name: 'roundAvatarRoundedEffect');
  String get gridList =>
      Intl.message('Grid List', desc: 'intl', args: [], name: 'gridList');
  String get slidingOff =>
      Intl.message('Sliding off', desc: 'intl', args: [], name: 'slidingOff');
  String get animatedList => Intl.message('AnimatedList: add、remove、animation',
      desc: 'intl', args: [], name: 'animatedList');
  String get fileIO => Intl.message('File io: dart:io path_provider',
      desc: 'intl', args: [], name: 'fileIO');
  String get netRequest =>
      Intl.message('Net Request', desc: 'intl', args: [], name: 'netRequest');
  String get platformChannel => Intl.message('Platform Channel',
      desc: 'intl', args: [], name: 'platformChannel');
  String get textFontStyleButton => Intl.message('Text、Font Style、Button',
      desc: 'intl', args: [], name: 'textFontStyleButton');
  String get imageIcon =>
      Intl.message('Image and Icon', desc: 'intl', args: [], name: 'imageIcon');
  String get radioSwitchCheckBox => Intl.message('Radio switch and check box',
      desc: 'intl', args: [], name: 'radioSwitchCheckBox');
  String get inputBoxForm => Intl.message('Input box and form',
      desc: 'intl', args: [], name: 'inputBoxForm');
  String get layout =>
      Intl.message('Layout', desc: 'intl', args: [], name: 'layout');
  String get containerWidget => Intl.message('Container Widget',
      desc: 'intl', args: [], name: 'containerWidget');
  String get scrollableWidget => Intl.message('Scrollable Widget',
      desc: 'intl', args: [], name: 'scrollableWidget');
  String get functionalWidget => Intl.message('Functional Widget',
      desc: 'intl', args: [], name: 'functionalWidget');
  String get eventHandlingNotification =>
      Intl.message('Event handling and notification',
          desc: 'intl', args: [], name: 'eventHandlingNotification');
  String get customWidget => Intl.message('Custom Widget',
      desc: 'intl', args: [], name: 'customWidget');
  String get useRedux =>
      Intl.message('Use Redux', desc: 'intl', args: [], name: 'useRedux');
  String get i10n => Intl.message('Intl', desc: 'intl', args: [], name: 'i10n');

  String get languageToggle {
    return Intl.message('Language Toggle',
        desc: 'language toggle', args: [], name: 'languageToggle');
  }

  String get themeToggle {
    return Intl.message('Theme Toggle',
        desc: 'theme toggle', args: [], name: 'themeToggle');
  }

  String get about {
    return Intl.message('About', desc: 'about', args: [], name: 'about');
  }

  String get signOut {
    return Intl.message('Sign Out',
        desc: 'sign out', args: [], name: 'signOut');
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  // 是否支持某个 locale
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
