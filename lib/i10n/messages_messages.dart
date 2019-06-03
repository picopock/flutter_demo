// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

// ignore: unnecessary_new
final messages = new MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'messages';

  static m0(howMany) => "${Intl.plural(howMany, zero: 'There are no emails left', one: 'There is ${howMany} email left', other: 'There are ${howMany} emails left')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "about" : MessageLookupByLibrary.simpleMessage("About"),
    "animatedList" : MessageLookupByLibrary.simpleMessage("AnimatedList: add、remove、animation"),
    "bezierCurveCutting" : MessageLookupByLibrary.simpleMessage("bezier curve cutting"),
    "bottomNavigation" : MessageLookupByLibrary.simpleMessage("bottom navigation"),
    "bottomNavigationWithDocker" : MessageLookupByLibrary.simpleMessage("bottom navigation with docker"),
    "containerWidget" : MessageLookupByLibrary.simpleMessage("Container Widget"),
    "customWidget" : MessageLookupByLibrary.simpleMessage("Custom Widget"),
    "dragDrop" : MessageLookupByLibrary.simpleMessage("Drag and drop"),
    "eventHandlingNotification" : MessageLookupByLibrary.simpleMessage("Event handling and notification"),
    "expandClosedCase" : MessageLookupByLibrary.simpleMessage("expand closed case"),
    "fileIO" : MessageLookupByLibrary.simpleMessage("File io: dart:io path_provider"),
    "frostedGlass" : MessageLookupByLibrary.simpleMessage("frosted glass effects"),
    "functionalWidget" : MessageLookupByLibrary.simpleMessage("Functional Widget"),
    "gridList" : MessageLookupByLibrary.simpleMessage("Grid List"),
    "i10n" : MessageLookupByLibrary.simpleMessage("Intl"),
    "imageIcon" : MessageLookupByLibrary.simpleMessage("Image and Icon"),
    "inputBoxForm" : MessageLookupByLibrary.simpleMessage("Input box and form"),
    "intl" : MessageLookupByLibrary.simpleMessage("Flutter intl"),
    "languageToggle" : MessageLookupByLibrary.simpleMessage("Language Toggle"),
    "layout" : MessageLookupByLibrary.simpleMessage("Layout"),
    "netRequest" : MessageLookupByLibrary.simpleMessage("Net Request"),
    "platformChannel" : MessageLookupByLibrary.simpleMessage("Platform Channel"),
    "radioSwitchCheckBox" : MessageLookupByLibrary.simpleMessage("Radio switch and check box"),
    "remainingEmailsMessage" : m0,
    "retainPageStatus" : MessageLookupByLibrary.simpleMessage("retain page status"),
    "rightArrawReturnPreviousPage" : MessageLookupByLibrary.simpleMessage("Swipe right to return to the previous page"),
    "roundAvatarRoundedEffect" : MessageLookupByLibrary.simpleMessage("Round avatar and rounded effect"),
    "routeAnimation" : MessageLookupByLibrary.simpleMessage("route animation"),
    "scrollableWidget" : MessageLookupByLibrary.simpleMessage("Scrollable Widget"),
    "searchBar" : MessageLookupByLibrary.simpleMessage("search bar"),
    "signOut" : MessageLookupByLibrary.simpleMessage("Sign Out"),
    "slidingOff" : MessageLookupByLibrary.simpleMessage("Sliding off"),
    "splashScreenAnimation" : MessageLookupByLibrary.simpleMessage("splash screen animation"),
    "textFontStyleButton" : MessageLookupByLibrary.simpleMessage("Text、Font Style、Button"),
    "themeToggle" : MessageLookupByLibrary.simpleMessage("Theme Toggle"),
    "title" : MessageLookupByLibrary.simpleMessage("Flutter App"),
    "tooltip" : MessageLookupByLibrary.simpleMessage("Tooltip"),
    "useRedux" : MessageLookupByLibrary.simpleMessage("Use Redux"),
    "wrapStreamingLayout" : MessageLookupByLibrary.simpleMessage("wrap streaming layout")
  };
}
