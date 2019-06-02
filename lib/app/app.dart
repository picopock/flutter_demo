import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:demo/i10n/localization_intl.dart' show AppLocalizations;

import '../demos/demo1/bottom_navigation.dart';
import '../demos/demo2/bottom_app_bar_demo.dart';
import '../demos/demo3/pages.dart';
import '../demos/demo4/frosted_glass.dart';
import '../demos/demo5/main.dart';
import '../demos/demo6/search_bar.dart';
import '../demos/demo7/wrap_demo.dart';
import '../demos/demo8/expansion_tile.dart';
import '../demos/demo9/main.dart';
import '../demos/demo10/splash_screen.dart';
import '../demos/demo11/right_back_demo.dart';
import '../demos/demo12/tool_tips_demo.dart';
import '../demos/demo13/draggable_demo.dart';
import '../demos/demo14/main.dart';
import '../demos/demo15/grid_list.dart';
import '../demos/demo16/dismissible_page.dart';
import '../demos/demo17/animated_list.dart';
import '../demos/demo18/read_write.dart';
import '../demos/demo19/network_request.dart';
import '../demos/demo20/platform_channel.dart';
import '../demos/demo21/demo21.dart';
import '../demos/demo22/demo22.dart';
import '../demos/demo23/demo23.dart';
import '../demos/demo24/text_field_and_form.dart';
import '../demos/demo25/layout_page.dart';
import '../demos/demo26/container_page.dart';
import '../demos/demo27/scrollable_page.dart';
import '../demos/demo28/functional_widget_page.dart';
import '../demos/demo29/event_notification_page.dart';
import '../demos/demo30/custom_widget.dart';
import '../demos/demo31/redux_demo_page.dart';
import '../demos/demo32/intl_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter demo app'
      onGenerateTitle: (context) {
        return AppLocalizations.of(context).title;
      },
      routes: {
        'demo1': (BuildContext context) => BottomNavigation(),
        'demo2': (BuildContext context) => BottomAppBarDemo(),
        'demo3': (BuildContext context) => FirstPage(),
        'demo4': (BuildContext context) => FrostedGlass(),
        'demo5': (BuildContext context) => KeepAlivePage(),
        'demo6': (BuildContext context) => SearchBar(),
        'demo7': (BuildContext context) => WrapDemo(),
        'demo8': (BuildContext context) => ExpansionPanelListDemo(),
        'demo9': (BuildContext context) => MyHomePage(),
        'demo10': (BuildContext context) => SplashScreen(),
        'demo11': (BuildContext context) => RightBackDemo(),
        'demo12': (BuildContext context) => ToolTipDemo(),
        'demo13': (BuildContext context) => DraggableDemo(),
        'demo14': (BuildContext context) => CircleDemo(),
        'demo15': (BuildContext context) => GridList(),
        'demo16': (BuildContext context) => DismissiblePage(),
        'demo17': (BuildContext context) => AnimatedListSample(),
        'demo18': (BuildContext context) => ReadAndWriteFile(),
        'demo19': (BuildContext context) => HTTPRequest(),
        'demo20': (BuildContext context) => PlatformChannelPage(),
        'demo21': (BuildContext context) => Demo21(),
        'demo22': (BuildContext context) => Demo22(),
        'demo23': (BuildContext context) => SwitchAndCheckBox(),
        'demo24': (BuildContext context) => TextFieldAndForm(),
        'demo25': (BuildContext context) => LayoutPage(),
        "demo26": (BuildContext context) => ContainerPage(),
        "demo27": (BuildContext context) => ScrollablePage(),
        "demo28": (BuildContext context) => FunctionalWidgetPage(),
        "demo29": (BuildContext context) => EventAndNotificationPage(),
        "demo30": (BuildContext context) => CustomWidget(),
        "demo31": (BuildContext context) => ReduxDemoPage(),
        "demo32": (BuildContext context) => IntlPage(),
      },
      home: HomePage(),
      locale: Locale('zh', 'CN'),
      localizationsDelegates: [
        // 本地化的代理类
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // 自定义
        AppLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // 美国英语
        const Locale('zh', 'CN'), // 中文简体
        //其它Locales
      ],
    );
  }
}

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
            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: Text(title),
      ),
    );
  }
}
